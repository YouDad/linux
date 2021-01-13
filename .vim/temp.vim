" 替换光标下的词
let b:coc_root_patterns = ['.git', '.env']

autocmd filetype go,c set fdm=syntax
autocmd filetype go,c set foldnestmax=1
autocmd filetype go,c set nofoldenable
autocmd filetype go,c nnoremap <buffer> sc :set foldenable!<cr>

autocmd filetype c,cpp set colorcolumn=80
autocmd filetype markdown set expandtab

autocmd filetype gn set expandtab
autocmd filetype gn set shiftwidth=2
autocmd BufRead,BufNewFile Harmonyos.build set expandtab
autocmd BufRead,BufNewFile Harmonyos.build set shiftwidth=2

autocmd filetype debug syntax match _pid /.*\[pid\].*/
autocmd filetype debug highlight!   _pid guifg=#282A36
