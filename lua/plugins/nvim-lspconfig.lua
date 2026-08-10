return {
	"neovim/nvim-lspconfig",
	branch = "master",
	config = function()
		-- ruby-lsp is deliberately NOT managed by Mason.
		--
		-- Mason installs it as a gem against whichever Ruby was on PATH at install
		-- time, then bakes that interpreter into the executable's shebang and builds
		-- the native extensions (prism, rbs) for that ABI only. The result is a
		-- server that always boots under the global Ruby, so as soon as a project
		-- pins a different version Bundler refuses to load the project's gems.
		--
		-- Instead, resolve ruby-lsp through mise using the project root as the
		-- version context, so each project gets the server running on its own Ruby.
		vim.lsp.config("ruby_lsp", {
			cmd = function(dispatchers, config)
				local root = (config and config.root_dir) or assert(vim.uv.cwd())
				return vim.lsp.rpc.start(
					{ "mise", "-C", root, "exec", "--", "ruby-lsp" },
					dispatchers,
					{ cwd = root }
				)
			end,
		})

		vim.lsp.enable("ruby_lsp")

		-- pyright needs to be told which interpreter a project uses.
		--
		-- Its resolution order is: `python.pythonPath` from LSP workspace
		-- settings, then `venvPath`/`venv` from pyrightconfig.json or
		-- pyproject.toml, then whatever `python` is first on PATH. We send
		-- nothing today, so any project whose venv isn't activated and isn't at
		-- the exact path its committed config claims falls through to a bare
		-- system python and every third-party import goes unresolved.
		--
		-- devenv + uv is the worst case: `languages.python.uv.enable` points
		-- UV_PROJECT_ENVIRONMENT at `$DEVENV_STATE/venv`, so the real venv lives
		-- at `.devenv/state/venv` while the project's `[tool.pyright]` still
		-- says `.venv`, and the devenv shell never puts either on PATH. Setting
		-- VIRTUAL_ENV doesn't help — an explicit venvPath/venv in the project
		-- config outranks it. Only pythonPath reliably wins.
		--
		-- This is the Python analogue of the ruby-lsp block above: derive the
		-- per-project answer from the LSP root. It has to happen in
		-- before_init, since a static `settings` table can't vary per root.

		-- Directories to look for a venv in, nearest first.
		--
		-- The LSP root is not necessarily where the venv lives. pyright's
		-- root_markers list `pyproject.toml` ahead of `.git`, so in a uv
		-- workspace every member package becomes its own root while the one
		-- shared venv sits at the repo root. Walk up from the LSP root to find
		-- it, stopping at the repo boundary so we can never wander into $HOME
		-- and adopt some unrelated venv.
		local function venv_search_dirs(root)
			local dirs = {}
			local home = vim.uv.os_homedir()
			local dir = root

			while dir do
				table.insert(dirs, dir)
				if vim.uv.fs_stat(dir .. "/.git") then
					break
				end

				local parent = vim.fs.dirname(dir)
				if parent == dir or parent == home or parent == "/" then
					break
				end
				dir = parent
			end

			return dirs
		end

		local function find_python_path(root)
			local candidates = {}
			local function add(venv)
				if venv and venv ~= "" then
					table.insert(candidates, venv)
				end
			end

			-- An activated venv is deliberate user intent, so it outranks
			-- anything found on disk.
			add(vim.env.VIRTUAL_ENV)
			-- uv honours this over ./.venv, and devenv sets it to an absolute
			-- path, but it's allowed to be relative to the project.
			add(vim.env.UV_PROJECT_ENVIRONMENT)

			for _, dir in ipairs(venv_search_dirs(root)) do
				add(dir .. "/.venv")
				add(dir .. "/.devenv/state/venv")
				add(dir .. "/venv")
			end

			for _, venv in ipairs(candidates) do
				if not vim.startswith(venv, "/") then
					venv = root .. "/" .. venv
				end

				-- Only accept an interpreter that's actually on disk. A dangling
				-- path silently reproduces the exact breakage this is meant to
				-- fix, and `.devenv/state/venv` in particular vanishes on a
				-- devenv GC.
				local python = venv .. "/bin/python"
				if vim.uv.fs_stat(python) then
					return python
				end
			end

			-- Nothing found: leave pythonPath unset and let pyright fall back to
			-- its own resolution. Guessing a system python would just reintroduce
			-- the bug.
			return nil
		end

		vim.lsp.config("pyright", {
			before_init = function(_, config)
				local root = config.root_dir or vim.uv.cwd()
				if not root then
					return
				end

				local python = find_python_path(root)
				if python then
					-- Mutate in place. The client captured `settings` by
					-- reference when it was constructed, which happens before
					-- before_init runs, so rebinding `config.settings` to a new
					-- table (as `vim.tbl_deep_extend` returns, and as :h
					-- vim.lsp.ClientConfig suggests) leaves the client holding
					-- the old one and the server never sees pythonPath.
					config.settings = config.settings or {}
					config.settings.python = config.settings.python or {}
					config.settings.python.pythonPath = python
				end
			end,
		})
	end,
}
