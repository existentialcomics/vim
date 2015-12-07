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

" switch buffers
nmap <leader>p :bp<CR>
nmap <leader>n :bn<CR>

nmap <leader>1 :b1<CR>
nmap <leader>2 :b2<CR>
nmap <leader>3 :b3<CR>
nmap <leader>4 :b4<CR>
nmap <leader>5 :b5<CR>
nmap <leader>6 :b6<CR>
nmap <leader>7 :b7<CR>
nmap <leader>8 :b8<CR>
nmap <leader>9 :b9<CR>
nmap <leader>0 :b0<CR>

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
nmap <C-k> <C-U>zz
nmap <C-j> <C-D>zz
nmap <C-h> ^
nmap <C-l> $
vmap <C-k> <C-U>zz
vmap <C-j> <C-D>zz
vmap <C-h> ^
vmap <C-l> $
" ctrl+movement key = change windows
"nnoremap j jzz
"nnoremap k kzz

nmap <Up> kkkzz
nmap <Down> jjjzz

" redo
nmap U <C-r>

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

"let perl_extended_vars=1 " highlight advanced perl vars inside strings
"let perl_fold=1
"set foldlevelstart=99
""let perl_fold_blocks=1
"set foldmethod=syntax
"set foldnestmax=10
"
"let g:php_folding=2
"
"let perl_include_pod   = 1    "include pod.vim syntax file with perl.vim
"let perl_sync_dist     = 250  "use more context for highlighting


" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

autocmd FileType php set makeprg=php\ -l\ %\ $*

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

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


filetype plugin on

"colorscheme default
colorscheme coreyColor
