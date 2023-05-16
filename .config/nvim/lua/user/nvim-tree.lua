local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.8

nvim_tree.setup {
	view = {
		number = true,
		relativenumber = true,
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

				-- Ratio
				local window_w = math.floor(screen_w * WIDTH_RATIO)
				local window_h = math.floor(screen_h * HEIGHT_RATIO)

				local center_x = (screen_w - window_w) / 2
				local center_y = ((screen_h - window_h) / 2) - vim.opt.cmdheight:get()


				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w,
					height = window_h,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},

}
