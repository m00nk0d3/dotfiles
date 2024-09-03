local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"cssls",
		"dockerls",
		"gopls",
		"html",
		"jsonls",
		"pyright",
		"rust_analyzer",
		"tsserver",
		"yamlls",
	},
	automatic_installation = true,
	handlers = {},
}
return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}

