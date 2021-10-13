
let g:python_host_prog="/Users/chadlamb/.virtualenvs/neovim/bin/python"

"Plugins

call plug#begin()

"Git things
    Plug 'tpope/vim-fugitive' 
    Plug 'airblade/vim-gitgutter'
    nmap ]h <Plug>(GitGutterNextHunk)
    nmap [h <Plug>(GitGutterPrevHunk)

" code completing things
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'alvan/vim-closetag'
    Plug 'editorconfig/editorconfig-vim'

" Time tracker
    Plug 'wakatime/vim-wakatime'

" Great utils
    Plug 'mbbill/undotree'
    Plug 'kyazdani42/nvim-tree.lua'
" Movement helpers
    Plug 'wellle/targets.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
" Language specifics
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'L3MON4D3/LuaSnip'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'windwp/nvim-autopairs'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer' 
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'onsails/lspkind-nvim'
" Python
    Plug 'plytophogy/vim-virtualenv'
" flutter Dart   
    Plug 'akinsho/flutter-tools.nvim'
" colour
    Plug 'rakr/vim-one'
    Plug 'rakr/vim-two-firewatch'
    Plug 'romainl/flattened'
    Plug 'danilo-augusto/vim-afterglow'
    Plug 'franbach/miramare'
    Plug 'ajmwagar/vim-deus'
    Plug 'sonph/onehalf'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/sonokai'
    Plug 'kaicataldo/material.vim'
    Plug 'hzchirs/vim-material'
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'mhartington/oceanic-next'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sainnhe/gruvbox-material'

" Ui tweaks
    Plug 'folke/zen-mode.nvim'
    " lua require("zen-mode").setup{}
    Plug 'kyazdani42/nvim-web-devicons'
" Bottom status line thing
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()






" sane defaults
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set encoding=utf-8
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
" Add code folding
set foldmethod=syntax
set splitbelow splitright
" trim all excess white space
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>


" Telescope keybindings
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-p> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader><C-f> <cmd>Telescope file_browser<cr>



"Base vim keybindings
imap jj <Esc>
let mapleader = "\<Space>"


"LOOK AND FEEL
set termguicolors
set nowrap
set background=dark
colorscheme gruvbox-material
let g:gruvbox_material_background='soft'
let g:airline_theme='gruvbox_material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
" File tree things
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly
set hidden
" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


autocmd BufNewFile,BufReadPost *.axml set filetype=html


"snippet things
nnoremap <leader>tt :pu=strftime('%c')<CR>
lua require('lsp')
lua require('file-tree')
lua require('tree-sitter')

