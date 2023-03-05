--local status_ok, lsp_zero = pcall(require, 'lsp-zero')
--if not status_ok then
--return
--end

local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = true,
})

lsp.setup()

--lsp.ensure_installed({
--	'tsserver',
--	'eslint',
--	'sumneko_lua',
--	'rust_analyzer'
--})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = 'minimal',
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	}
})


--lsp.rust_analyzer.setup({})
