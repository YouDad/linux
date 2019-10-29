" 替换光标下的词
nnoremap <leader>p	viwpyiw
set fdm=syntax
set foldnestmax=1

function! A_Uncomment()
	if &filetype == 'c' || &filetype == 'h' || &filetype == 'cpp'
		exec "norm ^xx"
		exec "norm j"
	elseif &filetype == 'vim'
		exec "norm ^x"
		exec "norm j"
	elseif &filetype == 'bash' || &filetype == 'sh'
		exec "norm ^x"
		exec "norm j"
	endif
endfunction
nnoremap <c-n> :call A_Uncomment()<cr>

function! A_Comment()
	if &filetype == 'c' || &filetype == 'h' || &filetype == 'cpp'
		exec "norm gI//"
		exec "norm j"
	elseif &filetype == 'vim'
		exec "norm gI\""
		exec "norm j"
	elseif &filetype == 'bash' || &filetype == 'sh'
		exec "norm gI#"
		exec "norm j"
	endif
endfunction
nnoremap <c-m> :call A_Comment()<cr>
