" Plugins
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
"Plug 'phanviet/vim-monokai-pro'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
Plug 'posva/vim-vue'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'rust-lang/rust.vim'
call plug#end()


" UI
"
syntax on
set relativenumber
set number
set mouse=a
set guitablabel=%t
set hlsearch
set showmatch
set showcmd
set nowrap

set encoding=utf8
set autoread
set tabstop=4
set noswapfile

" colors
set termguicolors
set background=dark
"colorscheme monokai_pro
let ayucolor="dark"
colorscheme ayu

" delete automatic indentation with backspace
set backspace=indent,eol,start

" osx block indentations
nnoremap <leader>[ <<<cr>
nnoremap <leader>] >><cr>
nnoremap <leader>[ <gv<cr>
nnoremap <leader>] >gv<cr>

" working with buffers
set hidden
nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprev<cr>

" git commit spell checking
autocmd Filetype gitcommit setlocal spell

" NerdTree
nnoremap <c-o> :NERDTreeToggle<cr>
nnoremap <c-f> :NERDTreeFind<cr>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize=24

" ag
let g:ackprg = 'ag --vimgrep'

" custom files command to include hidden files
command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)

" fzf
nmap <C-p> :HFiles<CR>

" lightline
set noshowmode
set laststatus=2
set showtabline=2
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [
  \      ['mode', 'paste'],
  \      ['fugitive', 'readonly', 'filename']
  \   ]
  \},
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'modified': 'LightlineModified',
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename',
  \},
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
\}

function! LightlineReadonly()
    return (&readonly ? '' : '')
endfunction

function! LightlineModified()
    return (&modified ? '' : '')
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        return (fugitive#head() != '' ? ' '.fugitive#head() : '')
    endif
endfunction

function! LightlineFilename()
    return (expand('%:t') != '' ? expand('%:t') : '[No Name]') .
        \ (LightlineModified() != '' ? ' '.LightlineModified() : '')
endfunction

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:lightline.tabline = {
  \ 'left': [['buffers']],
  \ 'right': [['close']]
\}

let g:lightline.component_expand = {
  \ 'buffers': 'lightline#bufferline#buffers'
\}
let g:lightline.component_type = {
  \ 'buffers': 'tabsel'
\}
