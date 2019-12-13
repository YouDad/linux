"显示行号
set number

set ttyfast "should make scrolling faster
set lazyredraw "same as above

set list
"set listchars=tab:▸\ ,trail:·
set listchars=tab:··,trail:·

"语法高亮
syntax on

"模式显示：在命令区显示当前模式
set showmode

"显示命令：在命令区显示上次执行的命令
set showcmd

"鼠标模式选项的字符决定Vim在什么模式下会使用鼠标
"n：普通模式，v：可视模式，i：插入模式，c：命令行模式
"h：在帮助文件里，以上所有模式，a等价nvich
set mouse=a

"Vim自动探测fileencodings的顺序列表
"启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式
"并且将fileencoding设置为最终探测到的字符编码方式
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"Vim所工作的终端的字符编码方式
set termencoding=utf-8

"Vim 内部使用的字符编码方式
"包括 Vim 的 buffer (缓冲区)、菜单文本、消息文本等。
set encoding=utf-8

"启用终端更丰富的颜色：256色，默认8色
set t_Co=256

"自动缩进
set autoindent

"不用空格代替Tab
set noexpandtab
"Tab键显示的宽度
set tabstop=4
set shiftwidth=4

"文本显示折行保证单词完整
set nowrap

"总是显示状态行
set laststatus=2

"打开状态栏标尺
set ruler

"高亮显示匹配的括号
set showmatch

"高亮匹配结果
set hlsearch
"搜索时默认忽略大小写
set ignorecase
"搜索时智能匹配大小写
set smartcase

"不保存备份文件
set nobackup
"不保存交换文件
set noswapfile
"保存历史文件
set undofile
"历史文件位置
set undodir=~/.vim/.undodir
"设置最大撤销记录数
set undolevels=1000

"不播放错误铃声
set noerrorbells
"显示错误铃声
set visualbell

"文件变化之后自动重读
set autoread

"启用命令行模式下自动补全
set wildmenu

"进入Vim不切换到文件所在目录
set noautochdir

"打开文件时光标返回上次离开的位置
if has("autocmd")
	autocmd BufReadPost * execute "normal g'\""
endif

"vim-gnome的细光标设置
    if has("autocmd")
      au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
      au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' | 
        \   silent execute '!echo -ne "\e[5 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[3 q"' | redraw! |
        \ endif
      au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
    endif

