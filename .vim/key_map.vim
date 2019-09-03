"改键映射
    "Leader键设置为空格键
        let mapleader=' '

    "s相当于自定义键的前缀，所以是<nop>
        nmap s			<nop>
        nmap ss			<nop>

    "Ctrl+s和Ctrl+q可以随便设置，暂时没用上
        map <c-s>		<nop>
        map <c-q>		<nop>
		nmap <c-s>		:w<cr>

    "缓冲区移动键
        nmap <silent> <leader>1	:b 1<cr>
        nmap <silent> <leader>2	:b 2<cr>
        nmap <silent> <leader>3	:b 3<cr>
        nmap <silent> <leader>4	:b 4<cr>
        nmap <silent> <leader>5	:b 5<cr>
        nmap <silent> <leader>6	:b 6<cr>
        nmap <silent> <leader>7	:b 7<cr>
        nmap <silent> <leader>8	:b 8<cr>
        nmap <silent> <leader>9	:b 9<cr>
        nmap <silent> <leader>10	:b 10<cr>
        nmap <silent> <leader>11	:b 11<cr>
        nmap <silent> <leader>12	:b 12<cr>
        nmap <silent> <leader>13	:b 13<cr>
        nmap <silent> <leader>14	:b 14<cr>
        nmap <silent> <leader>15	:b 15<cr>
        nmap <silent> <leader>16	:b 16<cr>
        nmap <silent> <leader>17	:b 17<cr>
        nmap <silent> <leader>18	:b 18<cr>
        nmap <silent> <leader>19	:b 19<cr>

    "在多窗口之间移动光标
        nmap <leader>h	<c-w>h
        nmap <leader>j	<c-w>j
        nmap <leader>k	<c-w>k
        nmap <leader>l	<c-w>l

    "重载方向键为改变布局的键
        nmap <up>		:resize -3<cr>
        nmap <down>		:resize +3<cr>
        nmap <left>		:vertical resize -3<cr>
        nmap <right>	:vertical resize +3<cr>

    "按sn去掉高亮
        nmap <silent> sn		:nohl<cr>
    "按sq关闭当前缓冲区
        nmap <silent> sq		:bd<cr>
	"sf定义文件类型
		nmap sf	:set filetype=

    "窗口跟随移动
        nnoremap j		jzz
        nnoremap k		kzz
        nnoremap {		{zz
        nnoremap }		}zz
        nnoremap [[		[[zz
        nnoremap ]]		]]zz
        nnoremap G		Gzz
        nnoremap n		nzz
        nnoremap N		Nzz
		nnoremap w		wzz
		nnoremap b		bzz
		nnoremap *		*zz
		nnoremap #		#zz
		nnoremap %		%zz

    "4/8缩进(user/kernel)
        nmap ss4		:set tabstop=4<cr>:set shiftwidth=4<cr>:set cc=160<cr>:highlight ColorColumn ctermbg=5<cr>
        nmap ss8		:set tabstop=8<cr>:set shiftwidth=8<cr>:set cc=80<cr>:highlight ColorColumn ctermbg=5<cr>

