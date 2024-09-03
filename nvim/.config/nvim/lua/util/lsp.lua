local set = vim.keymap.set

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

  if client.name == "pyright" then
    set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
  end
end

return M
