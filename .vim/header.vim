autocmd BufNewFile *.sh call HEADER_SHELL()

function! HEADER_SHELL()
	call setline(1, "\#!/bin/bash")
	call setline(2, "")
	call setline(3, "")
	normal G
endfunction

autocmd BufNewFile *.md call HEADER_MARKDOWN()

function! HEADER_MARKDOWN()
	call setline(1, "[TOC]")
	call setline(2, "")
	call setline(3, "# ")
	normal GA
endfunction

