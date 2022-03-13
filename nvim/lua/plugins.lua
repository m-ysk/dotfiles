local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local api = vim.api

require('packer').startup(function()
	local opts = { noremap = true, silent = true }
	use 'wbthomason/packer.nvim'

	use 'morhetz/gruvbox'
	vim.cmd[[autocmd VimEnter * ++nested colorscheme gruvbox]]

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/cmp-buffer'

	use {'jose-elias-alvarez/null-ls.nvim', requires = {'nvim-lua/plenary.nvim'}}

	use 'rust-lang/rust.vim'
	vim.g.rustfmt_autosave = 1

	use 'HerringtonDarkholme/yats.vim'
	use 'maxmellon/vim-jsx-pretty'
	use 'styled-components/vim-styled-components'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'

	use 'ntpeters/vim-better-whitespace'
	use 'frazrepo/vim-rainbow'
	vim.g.rainbow_active = 1

	use 'Yggdroot/indentLine'

	use 'vim-airline/vim-airline'
	use 'itchyny/lightline.vim'

	use 'scrooloose/nerdtree'
	api.nvim_set_keymap('', '<Leader>e', ':NERDTreeToggle<CR>', {})
	vim.g.NERDTreeShowHidden = 1

	use 'xuyuanp/nerdtree-git-plugin'
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'
	api.nvim_set_keymap('n', '<Leader>gs', ':Git<CR>', opts)
	api.nvim_set_keymap('n', '<Leader>gc', ':Gcommit-v<CR>', opts)
	api.nvim_set_keymap('n', '<Leader>ga', ':Gwrite<CR>', opts)
	api.nvim_set_keymap('n', '<Leader>gr', ':Gread<CR>', opts)
	api.nvim_set_keymap('n', '<Leader>gl', ':Glog<CR>', opts)
	api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', opts)
	api.nvim_set_keymap('n', '<Leader>gd', ':Gdiff<CR>', opts)

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	api.nvim_set_keymap('', '<Leader>ff', ':Files<CR>', {})
	api.nvim_set_keymap('', '<Leader>gg', ':Rg<CR>', {})
	vim.cmd([[
	  command! -bang -nargs=* Rg
		\ call fzf#vim#grep(
		\   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
		\   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))
	]])

	if packer_bootstrap then
		require('packer').sync()
	end
end)

vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = 'maintained',
}

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
	local opts = {}
	opts.on_attach = function(client, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

		local opt = { noremap = true, silent = true }
		buf_set_keymap('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
		buf_set_keymap('n', '<Leader>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
		buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
		buf_set_keymap('n', '<Leader><C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
		buf_set_keymap('n', '<Leader>fm', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opt)
	end

	opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

	server:setup(opts)
end)

vim.opt.completeopt = 'menu,menuone,noselect'

local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'vsnip' },
		}, {
			{name = 'buffer' },
		})
})

require('lspconfig').tsserver.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})

local null_ls = require('null-ls')
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint.with({
			only_local = 'node_modules/.bin',
		}),
		null_ls.builtins.formatting.prettier.with({
			only_local = 'node_modules/.bin',
		})
	},
})
