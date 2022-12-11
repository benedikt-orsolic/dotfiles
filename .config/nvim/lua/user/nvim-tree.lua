local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.termguicolors = true
nvim_tree.setup {
	view = {
		number = true,
		relativenumber = true
	}
}
