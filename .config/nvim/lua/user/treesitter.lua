local status_ok, treesitter = pcall(require, 'nvim-treesitter')
if not status_ok then
	return
end

local config_status_ok, config = pcall(require, 'nvim-treesitter.configs')
if not config_status_ok then
	return
end

config.setup({
	ensure_installed = {
		'rust',
		'javascript',
		'typescript',
		'tsx',
		'lua',
		'gitcommit',
	},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_reqex_highlighting = false,
	},
})
