"# 改键映射

"修改默认键
nnoremap Y y$

"Leader键设置为空格键
let mapleader=' '
nmap <leader>                       <nop>

"s相当于自定义键的前缀，所以是<nop>
nmap s                              <nop>
nmap ss                             <nop>

"Ctrl+s和Ctrl+q可以随便设置，暂时没用上
map <c-s>                           <nop>
map <c-q>                           <nop>
nmap <c-s>                          :w<cr>
nmap <c-q>                          :q<cr>

"缓冲区移动键
nnoremap <silent> <leader>1<leader> :b 1<cr>
nnoremap <silent> <leader>2         :b 2<cr>
nnoremap <silent> <leader>3         :b 3<cr>
nnoremap <silent> <leader>4         :b 4<cr>
nnoremap <silent> <leader>5         :b 5<cr>
nnoremap <silent> <leader>6         :b 6<cr>
nnoremap <silent> <leader>7         :b 7<cr>
nnoremap <silent> <leader>8         :b 8<cr>
nnoremap <silent> <leader>9         :b 9<cr>
nnoremap <silent> <leader>10        :b 10<cr>
nnoremap <silent> <leader>11        :b 11<cr>
nnoremap <silent> <leader>12        :b 12<cr>
nnoremap <silent> <leader>13        :b 13<cr>
nnoremap <silent> <leader>14        :b 14<cr>
nnoremap <silent> <leader>15        :b 15<cr>
nnoremap <silent> <leader>16        :b 16<cr>
nnoremap <silent> <leader>17        :b 17<cr>
nnoremap <silent> <leader>18        :b 18<cr>
nnoremap <silent> <leader>19        :b 19<cr>

"在多窗口之间移动光标
nnoremap <leader>h                  <c-w>h
nnoremap <leader>j                  <c-w>j
nnoremap <leader>k                  <c-w>k
nnoremap <leader>l                  <c-w>l

"按sn去掉高亮
nnoremap <silent> sn                :nohl<cr>
"按sq关闭当前缓冲区
nnoremap <silent> sq                :bd<cr>
"按se反转wrap
nnoremap se                         :set wrap!<cr>
"sf定义文件类型
nnoremap sf                         :set filetype=

"窗口跟随移动
nnoremap j                          jzz
nnoremap k                          kzz
nnoremap {                          {zz
nnoremap }                          }zz
nnoremap [[                         [[zz
nnoremap ]]                         ]]zz
nnoremap G                          Gzz
nnoremap n                          nzz
nnoremap N                          Nzz
nnoremap w                          wzz
nnoremap b                          bzz
nnoremap *                          *zz
nnoremap #                          #zz
nnoremap %                          %zz
nnoremap zi                         zizz
nnoremap <c-d>                      <c-d>zz
nnoremap <c-u>                      <c-u>zz
nnoremap _                          -zz
nnoremap +                          +zz
nnoremap ``                         ``zz

"4/8缩进(user/kernel)
nnoremap ss4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set cc=100<cr>:highlight ColorColumn ctermbg=5<cr>
nnoremap ss8 :set tabstop=8<cr>:set shiftwidth=8<cr>:set cc=80<cr>:highlight ColorColumn ctermbg=5<cr>

"把反斜杠重定义为调用宏
nnoremap \                          @q
nnoremap \|                         @w

"编辑Vim映射
nnoremap <leader>v                  :vs ~/.vim/temp.vim<cr>
nnoremap <leader>z                  :vs ~/.vim/temp<cr><c-w>L
nnoremap <leader>V                  :so %<cr>
inoremap jk                         <esc>

"qf即列表
autocmd filetype qf nnoremap <buffer> J j<cr>zz<c-w>j
autocmd filetype qf nnoremap <buffer> K k<cr>zz<c-w>j

