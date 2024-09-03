local config = function()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	require("neoconf").setup({})
	local on_attach = require("util.lsp").on_attach
	local lspconfig = require("lspconfig")

	local signs = {
		Error = "",
		Warn = "",
		Hint = "",
		Info = "",
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()
	--enable keybinds only for when lsp server is available
	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = true,
				analysis = {
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- typescript
	lspconfig.tsserver.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml", "html", "css" },
		cmd = { "typescript-language-server", "--stdio" },
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", "node_modules"),
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local eslint = require("efmls-configs.linters.eslint")
	local prettier = require("efmls-configs.formatters.prettier")

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"json",
			"yaml",
			"html",
			"css",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			rootMarkers = { ".git/" },
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				javascript = { eslint, prettier },
				typescript = { eslint, prettier },
				javascriptreact = { eslint, prettier },
				typescriptreact = { eslint, prettier },
				json = { luacheck },
				yaml = { luacheck },
				html = { luacheck },
				css = { luacheck },
			},
		},
	})

	-- format on save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_active_clients({ name = "efm" })
			if vim.tbl_isempty(efm) then
				return
			end
			vim.lsp.buf.format({ name = "efm" })
		end,
	})

	-- -- typescript
	-- lspconfig.tsserver.setup({
	--   capabilities = require("cmp_nvim_lsp").default_capabilities(),
	--   on_attach = function(client, bufnr) require("lsp-format").on_attach(client) end,
	-- })
	--
	-- -- python
	-- lspconfig.pyright.setup({
	--   capabilities = require("cmp_nvim_lsp").default_capabilities(),
	--   on_attach = function(client, bufnr) require("lsp-format").on_attach(client) end,
	-- })
	--
	-- -- rust
	-- lspconfig.rust_analyzer.setup({
	--   capabilities = require("cmp_nvim_lsp").default_capabilities(),
	--   on_attach = function(client, bufnr) require("lsp-format").on_attach(client) end,
	-- })
	--
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
