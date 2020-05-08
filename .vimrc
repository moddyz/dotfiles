" Remember 700 lines of history.
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Syntax highlighting
syntax enable

" Color scheme.
colorscheme desert

" Map \s to initiate replacement of word underneath cursor.
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Map \y for copying to clipboard.
:nnoremap <Leader>y "+y

" Map \p for pasting from clipboard.
:nnoremap <Leader>p "+p

" 2 lines for the bottom command bar.
set cmdheight=2

" Show status line, with file name, line, column.
set laststatus=2
set statusline=%F%=L%l:C%c

" Style the status bar
hi StatusLine ctermbg=white ctermfg=black

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
autocmd BufWrite CMakeLists.txt :call DeleteTrailingWS()
autocmd BufWrite *.cmake :call DeleteTrailingWS()
autocmd BufWrite *.vim :call DeleteTrailingWS()

" Prioritize cpp when switching between header and source.
let g:alternateExtensions_h = "cpp,c,cc,cxx,CC"

" Switch between header and source files via F4
map <F4> :FSHere<CR>

" Run clang-format against current, optionally selected, buffer.
autocmd FileType c,cpp,objc,javascript nnoremap <buffer><F8> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,javascript vnoremap <buffer><F8> :ClangFormat<CR>

" Additional args for cmake-format.
" Forces subgroups and arguments into a vertical layout.
let g:cmake_format_args = "--max-pargs-hwrap 0 --dangle-parens true --tab-size 4"

" Run cmake-format against current, optionally selected buffer.
autocmd FileType cmake nnoremap <buffer><F8> :<C-u>CMakeFormat<CR>
autocmd FileType cmake vnoremap <buffer><F8> :CMakeFormat<CR>

" Enable doxygen syntax highlighting for C/C++.
autocmd FileType c,cpp,objc set syntax=cpp.doxygen

" 0 should jump to first character non-whitespace character.
map 0 ^

" Incremental search-as-you-type.
:set incsearch

" Highlight all matching results.
:set hlsearch

" 2 spaces per tab for yaml files.
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Keep non-current buffer around and hidden, to preserve undo history.
set hidden
:set hlsearch

" Enable doxygen syntax highlighting for C/C++.
autocmd FileType c,cpp,objc,cuda set syntax=cpp.doxygen

" Delect *.dox as doxygen.
au BufNewFile,BufRead *.dox setfiletype doxygen
