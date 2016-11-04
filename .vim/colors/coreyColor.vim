" Vim color file
" Maintainer:   Corey Mohler
" Last Change:  2015

" This color scheme uses a black background.

" First remove all existing highlighting.
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "coreyColor"

hi Cursor                              guifg=Black      guibg=#FFBF00
hi Normal          ctermfg=Grey				 ctermbg=232			guifg=#A4A090    guibg=Black

hi Comment         ctermfg=DarkGrey    guifg=DarkGrey
									 " grey11

hi Constant        ctermfg=DarkRed     guifg=#FF0000
hi String          ctermfg=DarkRed     guifg=DarkRed
hi Special         ctermfg=Magenta     guifg=DarkRed
hi Define  				 ctermfg=DarkYellow	
hi Include				 ctermfg=DarkYellow
hi Number			  	 ctermfg=DarkRed
hi Float  				 ctermfg=DarkRed
"RoyalBlue1
hi Function				 ctermfg=063
"hi x227_LightGoldenrod1 ctermfg=227 guifg=#ffff5f "rgb=255,255,95
hi Repeat		  		 ctermfg=227	
"hi x227_LightGoldenrod1 ctermfg=227 guifg=#ffff5f "rgb=255,255,95
hi Conditional				 ctermfg=227
"hi x114_PaleGreen3 ctermfg=114 guifg=#87d787 "rgb=135,215,135
hi Label		  		 ctermfg=114
" pink
hi SpecialChar				 ctermfg=126	
"Green
hi Delimiter				 ctermfg=Green	
hi Error  				 ctermfg=160 ctermbg=3
hi Todo   				 ctermfg=234 ctermbg=3
"hi x105_LightSlateBlue ctermfg=105 guifg=#8787ff "rgb=135,135,255
hi Boolean				 ctermfg=105	
hi Structure				 ctermfg=DarkYellow
										" teal
hi Identifier      ctermfg=037			cterm=NONE term=NONE    guifg=#40D8D0
hi Statement       ctermfg=DarkYellow  guifg=Yellow  gui=NONE
" purple
hi PreProc         ctermfg=063     guifg=Green
hi Type            ctermfg=White   cterm=bold    guifg=White   gui=NONE
hi Ignore          ctermfg=DarkGrey    guifg=#22201C
hi FoldColumn                          guifg=#C4C0B0    guibg=#42403C
hi Folded                              guifg=#C4C0B0    guibg=#22201C


hi DiffAdd         ctermbg=52                    guifg=White      guibg=DarkBlue
hi DiffDelete      ctermbg=23                    guifg=Black      guibg=LightCyan
					" dark red
hi DiffText        ctermbg=18                    guifg=White      guibg=DarkRed    gui=NONE
					" dark yellow
hi DiffChange      ctermbg=94                    guifg=Black      guibg=LightYellow

hi LineNr		   ctermfg=68	ctermbg=235	
hi Visual          ctermbg=234  cterm=standout,bold                    guifg=Black      guibg=#C4C090  gui=NONE

if v:version >= 700

hi CursorLine     cterm=NONE      ctermbg=233                         guibg=#403820
hi CursorColumn                                    guibg=#403820

hi ColorColumn ctermbg=0 guibg=#eee8d5

hi Search		cterm=bold,standout ctermfg=100 ctermbg=052

hi MatchParen		cterm=bold      ctermfg=White      guifg=White      guibg=DarkGreen    ctermbg=none

hi SpellBad cterm=standout

hi Pmenu                          guifg=Black      guibg=#C4C090
hi PmenuSel                       guifg=Black      guibg=#FFBF00
hi PmenuSbar                      guifg=Black      guibg=LightGray
hi PmenuThumb                     guifg=Black      guibg=White        gui=NONE

hi TabLine                        guifg=Black      guibg=#A4A090      gui=NONE
hi TabLineFill                    guifg=Black      guibg=#A4A090      gui=NONE
hi TabLineSel                     guifg=White      guibg=Black

endif

" vim: ts=2 sw=2
