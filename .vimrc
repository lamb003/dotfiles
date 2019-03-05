" Plugin manager
call plug#begin()

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1


Plug 'plytophogy/vim-virtualenv'

" Fuzzy file finder
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" for tmux status line thing
" Plug 'edkolev/tmuxline.vim'

" support for a bunch of syntax highlighting
Plug 'sheerun/vim-polyglot'

" golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" typescript support
Plug 'leafgarland/typescript-vim'

" C# support
Plug 'OmniSharp/omnisharp-vim'

Plug 'jamshedvesuna/vim-markdown-preview' 
let vim_markdown_preview_github=1

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" shortcut for commenting lines
Plug 'tpope/vim-commentary'

" Vue support
" Plug 'posa/vim-vue'
" theme
Plug 'ajmwagar/vim-deus'
colorscheme deus

" Bottom status line thing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
call plug#end()

" Remapping the escape key
imap jj <Esc>

" Vim splits navigation with more sane maps
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H> 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" FZF maps
nnoremap <C-F> :Files<CR>
nnoremap <C-B> :Buffers<CR>

" some spacing stuff
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

:set relativenumber
" Allow backspace to work as expected
:set backspace=indent,eol,start
"Settings for the completor vim plugin
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
