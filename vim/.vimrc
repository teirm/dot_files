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

" ctags configuration
set tags=tags;

" cscope configuration
set csprg=/usr/bin/cscope

" This function will load the cscope db from a 
" relative location.
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

" Enable file detection
filetype on
filetype plugin on

" Movement
" highlight last inserted text
nnoremap gV `[v`]

"Setting status line
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

" vim-javascript
Plugin 'pangloss/vim-javascript'

" solarized
Plugin 'altercation/solarized'

Plugin 'vim-syntastic/syntastic'

" vim-solarized
Plugin 'altercation/vim-colors-solarized'

" vim-go
Plugin 'fatih/vim-go'

call vundle#end()

" Makes the syntax highlighting not an eyesore
hi MatchParen cterm=none ctermbg=none ctermfg=red
hi Search cterm=NONE ctermfg=red ctermbg=black

" Syntastic options
" Only what was recommended on git

set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()};
set statusline+=%*

" disable syntatic on the statusline
let g:statline_syntastic = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_c_include_dirs = ["include"] " Use include directory for C headers
let g:syntastic_cpp_check_header = 1    " check C++ header files
let g:syntastic_cpp_include_dirs = ["include"] " Include include directory files 

" Set assembly dialect to intel
let g:synstastic_asm_compiler_options = '-mtune-native'
let g:synstastic_asm_dialect = 'intel'

set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()};
set statusline+=%*

" Use nasm for all .nasm files
autocmd BufNewFile,BufRead *.nasm set filetype=nasm

" Do not expand tabs for Makefiles

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Additional Solarized Options
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256 
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"

" Go auto formating
let g:go_fmt_autosave = 1 

" Go syntax highlighting
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Solarized settings
set background=dark
set t_Co=256
colorscheme solarized

" Enables spell checking
" Mildly annoying while coding
"setlocal spell
