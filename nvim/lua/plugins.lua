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
	use 'folke/lua-dev.nvim'
	use 'williamboman/nvim-lsp-installer'

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7thk/cmp-vsnip'
	use 'hrsh7th/cmp-buffer'

	use {'jose-elias-alvarez/null-ls.nvim', requires = {'nvim-lua/plenary.nvim'}}

	use 'sheerun/vim-polyglot'

	use 'rust-lang/rust.vim'
	vim.g.rustfmt_autosave = 1

	use 'simrat39/rust-tools.nvim'

	--use 'HerringtonDarkholme/yats.vim'
	--use 'maxmellon/vim-jsx-pretty'
	--use 'styled-components/vim-styled-components'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'

	use 'tpope/vim-repeat'
	-- use 'tpope/vim-surround'
	use 'machakann/vim-sandwich'

	use 'terryma/vim-expand-region'

	use 'windwp/nvim-autopairs'

	use 'ntpeters/vim-better-whitespace'
	use 'frazrepo/vim-rainbow'
	vim.g.rainbow_active = 1

	use 'Yggdroot/indentLine'

	use 'vim-airline/vim-airline'
	--use 'itchyny/lightline.vim'

	--use 'scrooloose/nerdtree'
	--api.nvim_set_keymap('', '<Leader>e', ':NERDTreeToggle<CR>', {})
	--vim.g.NERDTreeShowHidden = 1

	use 'lambdalisue/fern.vim'
	api.nvim_set_keymap('', '<Leader>e', ':Fern . -reveal=% -drawer -toggle -width=40<CR>', opts)

	--use 'xuyuanp/nerdtree-git-plugin'
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'
	--api.nvim_set_keymap('n', '<Leader>gs', ':Git<CR>', opts)
	--api.nvim_set_keymap('n', '<Leader>gc', ':Gcommit-v<CR>', opts)
	--api.nvim_set_keymap('n', '<Leader>ga', ':Gwrite<CR>', opts)
	--api.nvim_set_keymap('n', '<Leader>gr', ':Greafad<CR>', opts)
	--api.nvim_set_keymap('n', '<Leader>gl', ':Gclog<CR>', opts)
	api.nvim_set_keymap('n', '<Leader>gbl', ':Git blame<CR>', opts)
	api.nvim_set_keymap('n', '<Leader>gd', ':Gdiff<CR>', opts)

	--use 'junegunn/fzf'
	--use 'junegunn/fzf.vim'
	--api.nvim_set_keymap('', '<Leader>ff', ':Files<CR>', {})
	--api.nvim_set_keymap('', '<Leader>gg', ':Rg<CR>', {})
	--vim.cmd([[
	--  command! -bang -nargs=* Rg
	--	\ call fzf#vim#grep(
	--	\   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
	--	\   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))
	--]])

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').git_files()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>gg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fc', "<cmd>lua require('telescope.builtin').command_history()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fs', "<cmd>lua require('telescope.builtin').search_history()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>d', "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
	api.nvim_set_keymap('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>", opts)
	api.nvim_set_keymap('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
	api.nvim_set_keymap('n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fsb', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fsa', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>ca', "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>fd', "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>ft', "<cmd>lua require('telescope.builtin').treesitter()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>gla', "<cmd>lua require('telescope.builtin').git_commits()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>glb', "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>gbr', "<cmd>lua require('telescope.builtin').git_branches()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>gs', "<cmd>lua require('telescope.builtin').git_status()<CR>", opts)

	use {
		'phaazon/hop.nvim',
		branch = 'v1',
	}
	require'hop'.setup()
	api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char2({ case_insensitive = true })<CR>", opts)
	api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char2({ case_insensitive = true, inclusive_jump = true })<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>s', "<cmd>lua require'hop'.hint_words()<CR>", opts)
	api.nvim_set_keymap('n', '<Leader>a', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<CR>", opts)

	if packer_bootstrap then
		require('packer').sync()
	end
end)

vim.cmd([[autocmd BufWritePost init.lua source afile | PackerCompile]])

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

	if server.name == 'tsserver' then
		opts.init_options = require('nvim-lsp-ts-utils').init_options
	end

	opts.on_attach = function(client, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

		local opt = { noremap = true, silent = true }
		--buf_set_keymap('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
		--buf_set_keymap('n', '<Leader>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
		--buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
		buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
		buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
		buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
		buf_set_keymap('n', '<Leader>fm', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opt)

		if server.name == 'tsserver' then
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			local ts_utils = require('nvim-lsp-ts-utils')
			ts_utils.setup({})
			ts_utils.setup_client(client)
		end

		if server.name == 'rust_analyzer' then
			buf_set_keymap('n', '<LocalLeader>e', "<cmd>lua require'rust-tools.expand_macro'.expand_macro()<CR>", opt)
			buf_set_keymap('n', '<LocalLeader>o', "<cmd>lua require'rust-tools.open_cargo_toml'.open_cargo_toml()<CR>", opt)
			buf_set_keymap('n', '<LocalLeader>u', "<cmd>lua require'rust-tools.move_item'.move_item(true)<CR>", opt)
			buf_set_keymap('n', '<LocalLeader>d', "<cmd>lua require'rust-tools.move_item'.move_item(false)<CR>", opt)
			buf_set_keymap('n', '<LocalLeader>p', "<cmd>lua require'rust-tools.parent_module'.parent_module()<CR>", opt)
			buf_set_keymap('n', '<LocalLeader>j', "<cmd>lua require'rust-tools.join_lines'.join_lines()<CR>", opt)
		end

	end

	opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

	server:setup(opts)
end)

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
	on_attach = function(client, bufnr)
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
})

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

require('nvim-autopairs').setup{}
