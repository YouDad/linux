let g:my_module_coc=1
let g:my_module_go=1
let g:my_module_web=1
let g:my_module_markdown=1
let g:my_module_shell=1

let g:my_module_pdf=0
let g:my_module_tagbar=0
let g:my_module_translator=1
let g:my_module_other=1

source ~/.vim/header.vim
source ~/.vim/base_set.vim
source ~/.vim/key_map.vim
source ~/.vim/plug.vim
source ~/.vim/jump.vim
source ~/.vim/command.vim
source ~/.vim/temp.vim
if filereadable(".workspace.vim")
    source .workspace.vim
endif
