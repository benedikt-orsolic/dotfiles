vim.g.mapleader = " "
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")

map("n", "<Leader>e", ":NvimTreeToggle<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
