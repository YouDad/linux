autocmd filetype debug syntax match TimeStamp /^\[[^\]]*\]/
autocmd filetype debug syntax match TimeStamp /\[\s*\d\+\.\d\{6\}s\]/
autocmd filetype debug highlight!   TimeStamp guifg=#555555

autocmd filetype debug syntax match Pass /\[\d\+\]([^\)]\+)$/
autocmd filetype debug highlight!   Pass guifg=#81b214 gui=bold

autocmd filetype debug syntax match Param /\[\d\+\]([^\)]\+) .*$/
autocmd filetype debug highlight!   Param guifg=#00b7c2 gui=bold

autocmd filetype debug syntax match Entry /\[\d\+\]([^\)]\+) => .\+$/
autocmd filetype debug syntax match Entry /\[\d\+\]([^\)]\+) <= .\+$/
autocmd filetype debug highlight!   Entry guifg=#cd0a0a gui=bold

autocmd filetype debug syntax match _error_msg /ERROR:.*/
autocmd filetype debug syntax match _error_msg /error:.*/
autocmd filetype debug highlight!   _error_msg guibg=#ff0000 gui=undercurl,bold

autocmd filetype debug syntax match _error /Fail/
autocmd filetype debug syntax match _error /fail/
autocmd filetype debug syntax match _error /failed/
autocmd filetype debug highlight!   _error guibg=#ff0000 gui=bold

autocmd filetype debug syntax match _warn /warn/
autocmd filetype debug syntax match _warn /warning/
autocmd filetype debug syntax match _warn /WARN/
autocmd filetype debug highlight!   _warn guifg=#ffbd39 gui=italic,bold

autocmd filetype debug syntax match _keyword /register/
autocmd filetype debug syntax match _keyword /return/
autocmd filetype debug syntax match _keyword /init/
autocmd filetype debug syntax match _keyword /probe/
autocmd filetype debug syntax match _keyword /exit/
autocmd filetype debug syntax match _keyword /close/
autocmd filetype debug highlight!   _keyword guifg=#b61aae gui=italic,bold
