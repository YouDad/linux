" 替换光标下的词
nnoremap <leader>p	viwpyiw
nnoremap <F5> :e!<cr>
if &filetype == 'c'
	set fdm=syntax
	set foldnestmax=1
endif
