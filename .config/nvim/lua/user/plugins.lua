-- Bootstrap packer
local packer_bootstrap = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			'git', 
			'clonse', 
			'--depth', 
			'1', 
			'https://github.com/wbthomason/packer.nvim', 
			install_path
		})
		print "Packer install"
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

-- Automaticly run :PackerCompile on plugins.lua update
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])


local status_packer, packer = pcall(require, 'packer')
if not status_packer then
	return
end

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	

	-- nvim tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		tag = 'nightly' -- update every week
	}

	-- telsecope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{ 'nvim-lua/plenary.nvim'}},
		tag = '0.1.0'
	}

	-- tree sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim_treesitter.install').update({with_sync = true})
			ts_update()
		end,
	}

	use{'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim'}}
	
	if packer_botstrap then
		require('packer').sync()
	end
end)
