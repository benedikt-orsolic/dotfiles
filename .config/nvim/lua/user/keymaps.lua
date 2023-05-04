vim.g.mapleader = " "
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("", "<Space>", "<Nop>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Cycle windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Cycle buffers
map("n", "<S-h>", ":bprev<CR>")
map("n", "<S-l>", ":bnext<CR>")

map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")

map("n", "<Leader>e", ":NvimTreeToggle<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")

-- Comment
map('n', '<leader>/', '<cmd>lua  require("Comment.api").toggle.linewise.current()<CR>')
map('x', '<leader>/', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
