" 替换光标下的词
nnoremap <F5> :e!<cr>

autocmd filetype go,c set fdm=syntax
autocmd filetype go,c set foldnestmax=1
autocmd filetype go,c set nofoldenable
autocmd filetype go,c nnoremap <buffer> sc :set foldenable!<cr>
