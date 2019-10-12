function! LuwhTimestamp()
	let timestamp = expand("<cword>")
	exec "!date -d @" . timestamp
endfunction
command Luwhtimestamp call LuwhTimestamp()
"function! LuwhTimestamp(timestamp)
"	exec silent "!date -d @" . a:timestamp
"endfunction
