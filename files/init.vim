set encoding=utf-8
set autoindent
set ruler
set number
set relativenumber
set syntax=on
set mouse=a

autocmd FileType c,cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab splitbelow

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

call plug#begin()

Plug 'https://github.com/42Paris/42header'              " 42 Header for Students
Plug 'https://github.com/cacharle/c_formatter_42.vim'   " 42 C Formatter for Students
Plug 'https://github.com/ryanoasis/vim-devicons'        " Developer Icons
Plug 'https://github.com/preservim/nerdtree'            " NERDTree
Plug 'https://github.com/vim-airline/vim-airline'       " Status bar
Plug 'https://github.com/preservim/tagbar'              " Tagbar for code navigation
Plug 'https://github.com/tc50cal/vim-terminal'          " Vim Terminal
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ap/vim-css-color'              " CSS Color Preview
Plug 'https://github.com/tpope/vim-surround'            " Surrounding ysw
Plug 'https://github.com/mg979/vim-visual-multi'        " CTRL + N for multiple cursors

call plug#end()

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Loads the custom keybindings
lua require('configs.keymaps')

" Config for 42 Header
let g:user42 = 'INTRAUSER'
let g:mail42 = 'INTRAUSER@student.42malaga.com'