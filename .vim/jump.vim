"cscope config
if has ("cscope")
	set cscopeverbose
	set cscopetag
	set csto=0
	if filereadable("cscope.out")
		silent cs add cscope.out
	endif
	"s  symbol:     find all references to the token under cursor
	"g  global:     find global definitions of the token under cursor
	"c  calls:      find all calls to the funtion name under cursor
	"t  text:       find all instances of the text under cursor
	"e  egrep:      egrep search for the word under cursor
	"f  file:       open the filename under cursor
	"i  incudes:    find files that incude the filename under cursor
	"d  called:     find funtions that funtion under cursor calls
	autocmd filetype c,cpp				nmap <silent> <leader>s	:cs find s <C-R>=expand("<cword>")<cr><cr>
	autocmd filetype c,cpp				nmap <silent> <leader>g	:cs find g <C-R>=expand("<cword>")<cr><cr>
	autocmd filetype c,cpp				nmap <silent> <leader>c	:cs find c <C-R>=expand("<cword>")<cr><cr>
	autocmd filetype c,cpp,javascript	nmap <silent> <leader>t	:cs find t <C-R>=expand("<cword>")<cr><cr>
	autocmd filetype c,cpp				nmap <silent> <leader>d	:cs find d <C-R>=expand("<cword>")<cr><cr>
	autocmd filetype c,cpp				nmap <silent> <leader>i	:cs find f <C-R>=strpart(expand("<cWORD>"),1,strlen(expand("<cWORD>"))-2)<cr><cr>
	autocmd filetype c,cpp				nmap <silent> <leader>f	:cs find f \<
	" autocmd filetype c,css				nmap <silent> <leader>e	:cs find e <C-R>=expand("<cword>")<cr><cr>
endif
