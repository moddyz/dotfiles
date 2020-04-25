" Don't load this plugin if:
" - the plugin is already loaded.
" - compatible mode is on.
" - cmake-format executable is not discovered.
if exists('g:loaded_cmake_format') || &cp || !executable('cmake-format')
	finish
endif

" Store a variable indicating that this plugin is already loaded!
let g:loaded_cmake_format = 1

" Cache current compatibility options, which will be restored later.
let s:original_cpo = &cpo

" Reset the compatibility option(s) to vim defaults (aABceFs)
set cpo&vim

" Default variable for the cmake-format executable.
if !exists('g:cmake_format_cmd')
    let g:cmake_format_cmd = 'cmake-format'
endif

" Default variable for additional arguments to the cmake-format executable.
if !exists('g:cmake_format_args')
    let g:cmake_format_args = ''
endif

" Utility function for checking the status of the last executed system
" command.
function! s:WasLastSystemCommandSuccessful() abort
	let exit_success = (v:shell_error) == 0
	return exit_success
endfunction

" Utility function for printing out an error message.
function! s:PrintErrorMessage(result) abort
	echohl ErrorMsg
	echomsg 'cmake-format has failed to format.'
	echomsg ''
	echohl None
endfunction

" Function which automatically formats the current buffer, using cmake-format.
function! s:CMakeFormatCurrentBuffer()
    " Local variables for command name and additional arguments.
    let l:cmake_format_cmd = g:cmake_format_cmd
    let l:cmake_format_args = g:cmake_format_args

    " Create a temporary file>
    let temp_file_path=tempname()

    " Write all contents from current buffer into file.
    call writefile(getline(1, '$'), temp_file_path)

    " Run cmake-format on temporary file.
    let l:cmake_format_output = system(l:cmake_format_cmd . ' ' . l:cmake_format_args . ' ' . temp_file_path)
    if s:WasLastSystemCommandSuccessful()
        " Cache original cursor position and view state(s).
        let original_pos = a:0 >= 1 ? a:1 : getpos('.')
	    let original_view = winsaveview()

        " Split formatted output by new lines.
	    let splitted = split(l:cmake_format_output, '\n')

        " Join further changes with the previous undo block, so that they can
        " be undo-ed in a single invocation (of undo).
	    silent! undojoin

        " If the # of lines in the current buffer exceeds the # of lines
        " in the formatted output, then delete the exceeding lines from the
        " current buffer.
	    if line('$') > len(splitted)
	    	execute len(splitted) .',$delete' '_'
	    endif

        " Insert the splitted output lines into the current buffer.
	    call setline(1, splitted)

        " Restore original cursor position and view state(s).
	    call winrestview(original_view)
	    call setpos('.', original_pos)
    else
        call s:PrintErrorMessage(l:cmake_format_output)
	endif

endfunction

" Define a CMakeFormat command.
command! -bar -nargs=? CMakeFormat :call <SID>CMakeFormatCurrentBuffer()

" Restore cached compatibility options.
let &cpo = s:original_cpo

" Discard cached compatibility variable.
unlet s:original_cpo
