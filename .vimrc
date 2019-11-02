" Remember 700 lines of history.
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Syntax highlighting
syntax enable

" Map \s to initiate replacement of word underneath cursor.
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" 2 lines for the bottom command bar.
set cmdheight=2

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Delete trailing whitespace on save.
func! DeleteTrailingWS()
 exe "normal mz"
 %s/\s\+$//ge
 exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.cc :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.hh :call DeleteTrailingWS()

" Switch between header and source files.
map <F5> :call CurtineIncSw()<CR>

" 0 should jump to first character non-whitespace character.
map 0 ^
