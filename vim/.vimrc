
"Random config settings that should be organized
syntax on                   " enable syntax processing                       

" Spaces and Tabs
set tabstop=4               " number of visual spaces per tab
set softtabstop=4           " number of spaces in tab when editing               
set expandtab               " tabs are spaces
set shiftwidth=4            " number of spaces used for autoindent
set autoindent              " compy indenty from current line to new line
set cindent                 " indent based on C indenting rules    

" UI Config
set number                  " show line numbers
set cursorline              " highlight current line
set ruler                   " show the line and column number of cursor
set wildmenu                " visual autocomplete for command menu    
set lazyredraw              " redraw only when need to

" Searching
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set ignorecase              " ignore case when searching
set smartcase               " only match lowercase if all lowercase pattern
" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

" Folding 
set foldenable		    " enable folding 
set foldmethod=indent 	" fold based on indent level
set foldnestmax=10		" 10 nested fold max 
set foldlevelstart=10   " open most folds by default
" space open/close folds
nnoremap <space> za

" Movement
" highlight last inserted text
nnoremap gV `[v`]

"Setting status line
set laststatus=2 
set statusline+=%f			"file name
set statusline+=%1*%=%5l%*	"current line
set statusline+=%2*/%L%*	"total lines

" Set up for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" ghcmod-vim for syntax checking
Plugin 'eagletmt/ghcmod-vim.git'

" vimproc
Plugin 'Shougo/vimproc.vim'

" denite
Plugin 'Shougo/denite.nvim'

"vim-javascript
Plugin 'pangloss/vim-javascript'


"For coding in RUST
filetype on
au BufNewFile,BufRead *.rs set filetype=rust

"For coding in nasm
au BufNewFile,BufRead *.nasm set filetype=nasm


"Makes the syntax highlighting not an eyesore
hi MatchParen cterm=none ctermbg=none ctermfg=red
hi Search cterm=NONE ctermfg=red ctermbg=black

"Syntastic options
"Only what was recommended by Git

set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()};
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_cpp_check_header = 1    " check C++ header files

"Set assembly dialect to intel
let g:synstastic_asm_compiler_options = '-mtune-native'
let g:synstastic_asm_dialect = 'intel'

"Enables spell checking
"Mildly annoying while coding
"setlocal spell


"NERDTree settings
let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '▸'

"Additional Solarized options
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"

"Enabling pathogen and solarized
set nocompatible
set t_Co=16
cal pathogen#infect()
set background=dark " dark | light "
colorscheme solarized
filetype plugin on

set cursorline

