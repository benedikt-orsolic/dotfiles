local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

nvim_tree.setup {
	view = {
		number = true,
		relativenumber = true
	}
}

vim.api.nvim_create_autocmd('BufEnter', {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1
		    and require('nvim-tree.utils').is_nvim_tree_buf() then
			vim.cmd 'quit'
		end
	end
})
