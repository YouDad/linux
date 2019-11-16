" 查看当前光标下时间戳所代表的时间
function! A_Timestamp()
	let timestamp = expand("<cword>")
	exec "!date -d @" . timestamp
endfunction
command! LUWHtimestamp call A_Timestamp()

" 刷新当前所用的CSCOPE
function! A_FlushCscope()
	exec "cs kill -1"
	exec "!cscope -Rbq"
	exec "cs add cscope.out"
endfunction
command! LUWHFlushCscope call A_FlushCscope()

" 刷新js&html的cscope
function! A_FlushJsCscope()
    exec "!find html js -name '*.js' -or -name '*.html' > cscope.files"
    exec "!cscope -bkq -i cscope.files"
    exec "cs add cscope.out"
endfunction
command! LUWHFlushJsCscope call A_FlushJsCscope()

" 让修改过的Log重新变成root的
function! A_Log2Root()
	exec "!sudo chown root.root %"
endfunction
command! LUWHLog2Root call A_Log2Root()

" 强行保存
function! A_SudoWrite()
	exec "write !sudo tee %"
endfunction
command! LUWHSudoWrite call A_SudoWrite()

function! A_F2_FormatCode()
	if &filetype == 'c' || &filetype == 'h'
		exec "w"
		exec "!astyle --options=$HOME/.c_astylerc %"
		exec "e!"
	elseif &filetype == 'cpp'
		exec "w"
		exec "!astyle --options=$HOME/.c_astylerc %"
		exec "e!"
	endif
endfunction
map <F2> :call A_F2_FormatCode()<cr>

function! A_F3_FormatCode()
	if &filetype == 'c' || &filetype == 'h'
		exec "w"
		exec "!astyle --options=$HOME/.kernel_c_astylerc %"
		exec "e!"
	endif
endfunction
map <F3> :call A_F3_FormatCode()<cr>
