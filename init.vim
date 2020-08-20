let g:python_host_prog=$NVIM_PYTHON_PATH

" Plugin manager
call plug#begin()

"time tracker thing
Plug 'wakatime/vim-wakatime'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Disabled as it conflicts with coc
" let g:deoplete#enable_at_startup = 1
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'

" ----------------------------------------
" CoC things
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set hidden
nnoremap ga :CocAction<cr>
nnoremap ge :CocList diagnostics<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nmap <silent> ge <Plug>(coc-list-diagnostics)
nmap <silent> <leader>a <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>ne <Plug>(coc-diagnostic-next)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

vmap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" Git tools
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

Plug 'craigemery/vim-autotag'

Plug 'mbbill/undotree'

" Vim wiki - note taking tool
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
au BufNewFile ~/Dropbox/vimwiki/diary/*.md :silent 0r !~/Dropbox/vimwikiUtils/diaryTemplate '%'
Plug 'editorconfig/editorconfig-vim'
Plug 'plytophogy/vim-virtualenv'
" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" support for a bunch of syntax highlighting
Plug 'sheerun/vim-polyglot'

" flutter things
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'


" golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" Auto close tags
Plug 'alvan/vim-closetag'

" C# support
Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp' 
let g:OmniSharp_server_stdio = 0
let g:OmniSharp_start_without_solution = 1

function SetCSSettings()

    " Use deoplete.
    call deoplete#enable()

    " Use smartcase.
    call deoplete#custom#option('smart_case', v:true)

    " Use OmniSharp-vim omnifunc 
    call deoplete#custom#source('omni', 'functions', { 'cs':  'OmniSharp#Complete' })

    " Set how Deoplete filters omnifunc output.
    call deoplete#custom#var('omni', 'input_patterns', {
        \ 'cs': '[^. *\t]\.\w*',
        \})

    " ... then goes your mappings for :OmniSharp* functions, see its doc
    nnoremap ga :OmniSharpGetCodeActions<cr>
    nnoremap gd :OmniSharpGotoDefinition<cr>
    nnoremap gy :OmniSharpTypeLookup<cr> 
    nnoremap gi :OmniSharpFindImplementations<cr>
    nnoremap gr :OmniSharpFindUsages<cr>
endfunction

augroup csharp_commands
    autocmd!

    " Use smartcase.
    " call deoplete#custom#option('smart_case', v:true) 
    autocmd FileType cs call SetCSSettings()
    
augroup END

" omnisharp shorcuts
autocmd FileType cs nnoremap <buffer> <leader>gd :OmniSharpGotoDefinition<CR>


Plug 'jamshedvesuna/vim-markdown-preview' 
let vim_markdown_preview_github=1

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-surround'

" shortcut for commenting lines
Plug 'tpope/vim-commentary'

" colour
Plug 'ajmwagar/vim-deus'
Plug 'sonph/onehalf'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'kaicataldo/material.vim'
Plug 'hzchirs/vim-material'
set termguicolors


" Bottom status line thing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" colorscheme deus
" colorscheme sonokai
"
let g:material_style='palenight'
set nowrap
set background=dark
colorscheme gruvbox

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'

set encoding=utf-8

" Remapping the escape key
imap jj <Esc>
let mapleader = "\<Space>"

" NerdTree
nnoremap <leader>ft :NERDTreeToggle<cr>


" delete word without affecting register
nnoremap <leader>d "_d

" undo tree
nnoremap <leader>u :UndotreeShow<CR>

" Allow moving of lines easily with alt and direction key
" down
nnoremap ê :m .+1<cr>==
" up
nnoremap ë :m .-2<cr>==

" insert time and date into buffer. useful for notes.
nnoremap <leader>tt :pu=strftime('%c')<CR>

" FZF maps

silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
  noremap <C-F> :GFiles --cached --others --exclude-standard<CR>
else
  noremap <C-F> :Files<CR>
endif


" AG maps
nnoremap <C-P> :Ag<CR>

" some spacing stuff
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4 softtabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smartindent
set noswapfile
set incsearch

:set number relativenumber
set cursorline
" Allow backspace to work as expected
:set backspace=indent,eol,start
"Settings for the completor vim plugin
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Add code folding
set foldmethod=syntax
set splitbelow splitright
let g:go_fmt_command = "goimports"


" trim all excess white space
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>


autocmd BufNewFile,BufReadPost *.TODO,TODO,*.todo,*.todolist,*.taskpaper,*.tasks,*.todo.wiki set filetype=tasks 
autocmd BufNewFile,BufReadPost *.TODO,TODO,*.todo,*.todolist,*.taskpaper,*.tasks,*.todo.wiki set syntax=tasks



nnoremap <C-B> :Buffers<CR>


" STARTIFY THINGS
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

