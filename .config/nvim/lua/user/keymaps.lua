vim.g.mapleader = ' '
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then 
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<Leader>e", ":NvimTreeToggle<CR>")
map("n", "<Leader>f", ":Telescope find_files<CR>")
