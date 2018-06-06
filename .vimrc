" Welcome to my neovim ting

" Plugin manager
call plug#begin()
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'maralla/completor.vim'

" Fuzzy file finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" support for a bunch of syntax highlighting
Plug 'sheerun/vim-polyglot'

Plug 'jamshedvesuna/vim-markdown-preview' 
let vim_markdown_preview_github=1

" Vue support
" Plug 'posa/vim-vue'

" Plug 'joshdick/onedark.vim'
" colorscheme onedark

Plug 'ajmwagar/vim-deus'

" Bottom status line thing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
call plug#end()
" Remapping the escape key
imap jj <Esc>
colorscheme deus

:set relativenumber
" Allow backspace to work as expected
:set backspace=indent,eol,start
"Settings for the completor vim plugin
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
