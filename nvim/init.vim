set encoding=utf-8
scriptencoding utf-8

set hidden

set nobackup
set nowritebackup

set updatetime=50

set shortmess+=c

set nocompatible

set ruler
set number
set cursorline

set background=dark
set termguicolors

set autoread

set smartindent

nnoremap j gj
nnoremap k gk

" Tab
set tabstop=4
set shiftwidth=4

" Search
set incsearch
set wrapscan
set hlsearch

inoremap <silent> jj <ESC>

let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>v :vs<CR>
nnoremap <Leader>o :only<CR>

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>

let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/mysk/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/mysk/.cache/dein')

" For using toml file
let s:toml_dir = $HOME . '/.config/nvim/dein'
let s:toml = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

" Required:
call dein#end()
call dein#save_state()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"map <C-n> :NERDTreeToggle<CR>
map <Leader>e :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

"map <C-k> :Files<CR>
map <Leader>f :Files<CR>
"map <C-l> :Rg<CR>
map <Leader>gg :Rg<CR>

" fugitive
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gc :Gcommit-v<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gd :Gdiff<CR>

" coc
set signcolumn=number

nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>y <Plug>(coc-type-definition)
nmap <silent> <Leader>i <Plug>(coc-implementation)
nmap <silent> <Leader>r <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Rust
let g:rustfmt_autosave = 1

" Typescript
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Rainbow
let g:rainbow_active = 1

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
