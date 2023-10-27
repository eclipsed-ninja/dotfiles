" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.local/share/nvim/plugged')

" Initialize plugin system

" Theme Installation
Plug 'arcticicestudio/nord-vim'

" LeftBar Folder Explorer
" Easily see folder tree
Plug 'scrooloose/nerdtree'

" Quick Comment Plugin
" Comment code easily with <leader>cc, <leader>c<space>
Plug 'scrooloose/nerdcommenter'

" Git Plugin
" Allows to execute git commands from vim :Git
Plug 'tpope/vim-fugitive'

" VIM Status, a bit more graphical
Plug 'vim-airline/vim-airline'
" Themes for VIM Status
Plug 'vim-airline/vim-airline-themes'

" Status of git added / modified / removed lines in gutter
Plug 'mhinz/vim-signify'

" Multi-Language Support Pack
Plug 'sheerun/vim-polyglot'

" Fuzzy File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Volt Syntax Highlight
Plug 'Glench/Vim-Jinja2-Syntax'

" Code Completion Engine
" Is LSP good enough yet ?, If it ain't broke dont fix
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Surround Quotes and Brackets
Plug 'tpope/vim-surround'

" MultiCursor select
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Enuch, Quick shell copy move rename
Plug 'tpope/vim-eunuch'

" Editor Config
" Helps with indent configuration
Plug 'editorconfig/editorconfig-vim'

" Lint Engine
Plug 'dense-analysis/ale'

" Git Blame
Plug 'tveskag/nvim-blame-line'

" Icons NerdTree
Plug 'ryanoasis/vim-devicons'

" Syntax checking
"Plug 'scrooloose/syntastic'

" PHP Debug
Plug 'vim-vdebug/vdebug'

" GDB
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()


" For Neovim 0.1.3 and 0.1.4
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
    "set termguicolors
endif

" Theme
syntax enable
"colorscheme OceanicNext
colorscheme nord
" Automatically fire up NerdTree when nvim starts
" autocmd vimenter * NERDTree

" Automatically close if NerdTree is the only window open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" General
set number  " Show line numbers
set linebreak   " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set showmatch   " Highlight matching brace
set visualbell  " Use visual bell (no beeping)

set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally

set autoindent  " Auto-indent new lines
set shiftwidth=4    " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab

" Advanced
set ruler   " Show row and column ruler information

set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" Yank on system clipboard
set clipboard+=unnamedplus

" Auto Refresh VIM buffers
set autoread

" Tab replacement width
set tabstop=4 shiftwidth=4 expandtab

" Folding Configuration
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" MISC "
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

filetype plugin indent on

" Set up Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Map Leader Key
let mapleader = "`"

" Disable Ale LSP
let g:ale_disable_lsp = 1

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Reduce Update time for async update for signify
set updatetime=100

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" Remove annoying gutter message
let g:gitgutter_max_signs=9999

" Airline THeme
let g:airline_theme='nord'
"let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
" Hide repetiive status update
set noshowmode

" Prettier Config
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
"let g:prettier#config#parser = 'babylon'
" Disables quick-fix to auto open when files have errors
"let g:prettier#quickfix_enabled=0
" KEYBINDS "

" Show hidden files in NerdTree
let NERDTreeShowHidden=1

" Command to open nerdtree "
map <C-o> :NERDTreeToggle<CR>
" Quick View files shortcut"
map <C-f> :Files<CR>

" NerdCommenter Config
let g:NERDCreateDefaultMappings = 0
map <C-k> :call nerdcommenter#Comment('x', 'toggle')<CR>

" Git Blame quick view
map <C-b> :ToggleBlameLine<CR>

au BufRead,BufNewFile *.volt setfiletype html

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"function! SetupDebug()
"  let g:vdebug_options['path_maps'] = {'/home/ashish/PublicHTML': call('projectroot#get', a:000)}
"  " Hack to override vdebug options
"endfunction
"autocmd VimEnter * :call SetupDebug()
