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

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ bufer = bufnr })
	local opts = { buffer = bufnr }

	-- vim.keymap.set({ 'n', 'x' }, '<leader>fb', function()
	-- 	vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	-- end, opts)
end)

lsp.setup()

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer',
	'jdtls',
})

vim.diagnostic.config({
	virtual_text = false,
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
