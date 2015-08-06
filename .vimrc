if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
""set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

" speed up syntax highlighting
"
set nocursorcolumn
set norelativenumber
syntax sync minlines=256

" show line numbers
"autocmd FileType perl set number

"set number              " turn on line numbers
"set numberwidth=5       " We are good up to 99999 lines

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

" comment/uncomment blocks of code (in vmode)
"vmap _c :s/^/#/gi<Enter>
"vmap _C :s/^#//gi<Enter>

" Don't use Ex mode, use Q for formatting
map Q gq

" open new windows towards the bottom and right
set splitbelow
set splitright

" resize with +/-
if bufwinnr(1)
  map + 3<C-W>>
  map - 3<C-W><
endif

" better tab completion
set wildmode=longest,list,full
set wildmenu

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
  "set t_Co=8
  set t_Sb=^[4%dm
  set t_Sf=^[3%dm
endif

" force it to 256 mode
set t_Co=256

" some extra commands for HTML editing
nmap ,mh wbgueyei<<ESC>ea></<ESC>pa><ESC>bba
nmap ,h1 _i<h1><ESC>A</h1><ESC>
nmap ,h2 _i<h2><ESC>A</h2><ESC>
nmap ,h3 _i<h3><ESC>A</h3><ESC>
nmap ,h4 _i<h4><ESC>A</h4><ESC>
nmap ,h5 _i<h5><ESC>A</h5><ESC>
nmap ,h6 _i<h6><ESC>A</h6><ESC>
nmap ,hb wbi<b><ESC>ea</b><ESC>bb
nmap ,he wbi<em><ESC>ea</em><ESC>bb
nmap ,hi wbi<i><ESC>ea</i><ESC>bb
nmap ,hu wbi<u><ESC>ea</i><ESC>bb
nmap ,hs wbi<strong><ESC>ea</strong><ESC>bb
nmap ,ht wbi<tt><ESC>ea</tt><ESC>bb
nmap ,hx wbF<df>f<df>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set expandtab      " no real tabs please!
set noexpandtab    " real tabs
set shiftwidth=4   " auto-indent amount when using cindent,
                   " >>, << and stuff like that
set softtabstop=4  " auto-indent amount when using cindent,
set tabstop=4      " real tabs should be 6, and they will show with
                   " set list on
set smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change shift and control movement keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap K <C-U>zz
nmap J <C-D>zz
nmap H ^
nmap L $
vmap K <C-U>zz
vmap J <C-D>zz
vmap H ^
vmap L $
" ctrl+movement key = change windows
nmap <C-h> <C-w><Left>
nmap <C-l> <C-w><Right>
nmap <C-k> <C-w><Up>
nmap <C-j> <C-w><Down>
vmap <C-h> <C-w><Left>
vmap <C-l> <C-w><Right>
vmap <C-k> <C-w><Up>
vmap <C-j> <C-w><Down>
"nnoremap j jzz
"nnoremap k kzz

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

set lbr
set tw=400

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" show the name of file in the status bar
"set laststatus=2
"set statusline=%f "tail of the filename

"******* PERL specific settings

let perl_extended_vars=1 " highlight advanced perl vars inside strings
let perl_fold=1
set foldlevelstart=99
"let perl_fold_blocks=1
set foldmethod=syntax
set foldnestmax=10

let g:php_folding=2

let perl_include_pod   = 1    "include pod.vim syntax file with perl.vim
let perl_sync_dist     = 250  "use more context for highlighting

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -dws -ce -l=150 -i=3 -q<Enter>
vnoremap <silent> _t :!perltidy -dws -ce -l=150 -i=3 -q<Enter>

" Create a command :Tidy to invoke perltidy.
" By default it operates on the whole file, but you can give it a
" range or visual range as well if you know what you're doing.
"command -range=% -nargs=* Tidy <line1>,<line2>!
"    \perltidy -dws -ce -l=150 -i=3 -q

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

"Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>


set nocursorline
"set filetype=background

augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter,BufEnter * setlocal cursorline
	"autocmd WinEnter,BufWinEnter * setlocal cursorline
	autocmd BufWinEnter,WinLeave * setlocal nocursorline
augroup END

"autocmd VimEnter,WinEnter,BufWinEnter * setfiletype background
"autocmd BufWinEnter * setfiletype background


let g:diminactive_use_colorcolumn = 1
let g:diminactive_use_syntax = 0

set laststatus=2

"nnoremap <C-g>f :echo cfi#format("%s", "")<CR>
let mapleader = ","
" display the current function
nnoremap <leader>f :echo cfi#format("%s", "")<CR>

map <leader>c :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"let &statusline='%<%f %(%h%m%r %)%=%{cfi#format("%s", "")}  %-15.15(%l,%c%V%)%P'

"TODO: have it save filetype and load it, rather than detect every time, for effciency
"augroup ColorOnlyInActiveWindow
"	autocmd!
"	autocmd WinLeave *.php setlocal filetype=phpFade
"	"autocmd WinLeave * setlocal filetype=background
"	autocmd WinEnter,VimEnter,BufWinEnter * filetype detect
"	"autocmd BufWinEnter,WinLeave * setlocal filetype=phpFade
"augroup END

"augroup BufferColorScheme
"  autocmd!
"  autocmd VimEnter,WinEnter,BufWinEnter * execute "colorscheme coreyColor"
"  autocmd WinLeave * setlocal execute "colorscheme default"
"augroup END

filetype plugin on

"colorscheme default
colorscheme coreyColor
