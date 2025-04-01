-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',
			{ buffer = event.buf, desc = 'Hover LSP Action' })
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',
			{ buffer = event.buf, desc = 'Goto Definition' })
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
			{ buffer = event.buf, desc = 'Goto Declaration' })
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
			{ buffer = event.buf, desc = 'Goto Implementation' })
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
			{ buffer = event.buf, desc = 'Goto Type Definition' })
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',
			{ buffer = event.buf, desc = 'Goto References' })
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
			{ buffer = event.buf, desc = 'Get Signarture Information' })
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = event.buf, desc = 'Rename' })
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
			{ buffer = event.buf, desc = 'Format' })
		vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>',
			{ buffer = event.buf, desc = 'Code Actions' })
	end,
})

-- You'll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- These are example language servers.
require('lspconfig').gleam.setup({})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- CSS LS
require 'lspconfig'.cssls.setup {
	capabilities = capabilities,
}

-- TAILWIND CSS LS
require 'lspconfig'.tailwindcss.setup {}

-- JSON LS
require 'lspconfig'.jsonls.setup {
	capabilities = capabilities,
}

-- HTML LS
require 'lspconfig'.html.setup {
	capabilities = capabilities,
}

-- MARKDOWN LS
require 'lspconfig'.markdown_oxide.setup {}

-- HTMX LS
require 'lspconfig'.htmx.setup {}

-- DOCKER COMPOSE LS
require 'lspconfig'.docker_compose_language_service.setup {}

-- DOCKERFILE LS
require("lspconfig").dockerls.setup {
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true,
				},
			},
		}
	}
}

-- YAML LS
require 'lspconfig'.yamlls.setup {}

-- GO LS
require 'lspconfig'.gopls.setup {}

-- TEMPL LS
require 'lspconfig'.templ.setup {}

-- Python LS
require 'lspconfig'.pyright.setup {}

-- LUA LS
require 'lspconfig'.lua_ls.setup {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				}
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
				-- library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,
	settings = {
		Lua = {}
	}
}

-- MARKDOWN LS
require 'lspconfig'.markdown_oxide.setup {}

-- VOLAR (VUE) LS
require 'lspconfig'.volar.setup {
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

-- SQL LS
require 'lspconfig'.sqlls.setup {}



-- TYPESCRIPT LS
require 'lspconfig'.ts_ls.setup {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"vue",
	},
}

require('lspconfig').rust_analyzer.setup {
	-- Other Configs ...
	settings = {
		["rust-analyzer"] = {
			-- Other Settings ...
			procMacro = {
				ignored = {
					leptos_macro = {
						-- optional: --
						-- "component",
						"server",
					},
				},
			},
		},
	}
}


-- You must make sure volar is setup
-- e.g. require'lspconfig'.volar.setup{}
-- See volar's section for more information


local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = false })
	}),
})
