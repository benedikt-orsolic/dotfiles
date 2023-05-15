local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

nvim_tree.setup {
	view = {
		number = true,
		relativenumber = true,
		width = 60,
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = {
				border = "rounded",
				width = 60,
				height = 30,
				row = 1,
				col = 1,
			}
		}
	},

}
