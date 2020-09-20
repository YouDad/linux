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

function! TabBufSwitch(num)
	let l:used = filter(range(1, bufnr('$')), 'buflisted(v:val)')
	execute ':'.(l:used[a:num - 1]).'b'
endfunction

"缓冲区移动键
nnoremap sw                         :b<space>
nnoremap <silent> <leader>1<leader> :call TabBufSwitch(1)<cr>
nnoremap <silent> <leader>2         :call TabBufSwitch(2)<cr>
nnoremap <silent> <leader>3         :call TabBufSwitch(3)<cr>
nnoremap <silent> <leader>4         :call TabBufSwitch(4)<cr>
nnoremap <silent> <leader>5         :call TabBufSwitch(5)<cr>
nnoremap <silent> <leader>6         :call TabBufSwitch(6)<cr>
nnoremap <silent> <leader>7         :call TabBufSwitch(7)<cr>
nnoremap <silent> <leader>8         :call TabBufSwitch(8)<cr>
nnoremap <silent> <leader>9         :call TabBufSwitch(9)<cr>
nnoremap <silent> <leader>10        :call TabBufSwitch(10)<cr>
nnoremap <silent> <leader>11        :call TabBufSwitch(11)<cr>
nnoremap <silent> <leader>12        :call TabBufSwitch(12)<cr>
nnoremap <silent> <leader>13        :call TabBufSwitch(13)<cr>
nnoremap <silent> <leader>14        :call TabBufSwitch(14)<cr>
nnoremap <silent> <leader>15        :call TabBufSwitch(15)<cr>
nnoremap <silent> <leader>16        :call TabBufSwitch(16)<cr>
nnoremap <silent> <leader>17        :call TabBufSwitch(17)<cr>
nnoremap <silent> <leader>18        :call TabBufSwitch(18)<cr>
nnoremap <silent> <leader>19        :call TabBufSwitch(19)<cr>

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
nnoremap <F5>                       :e!<cr>
inoremap jk                         <esc>

"qf即列表
autocmd filetype qf nnoremap <buffer> J j<cr>zz<c-w>j
autocmd filetype qf nnoremap <buffer> K k<cr>zz<c-w>j

nnoremap sk <nop>
nmap ska<leader>	1k
nmap sks<leader>	2k
nmap skd<leader>	3k
nmap skf<leader>	4k
nmap skg<leader>	5k
nmap skh<leader>	6k
nmap skj<leader>	7k
nmap skk<leader>	8k
nmap skl<leader>	9k
nmap ska;<leader>	10k
nmap skaa<leader>	11k
nmap skas<leader>	12k
nmap skad<leader>	13k
nmap skaf<leader>	14k
nmap skag<leader>	15k
nmap skah<leader>	16k
nmap skaj<leader>	17k
nmap skak<leader>	18k
nmap skal<leader>	19k
nmap sks;<leader>	20k
nmap sksa<leader>	21k
nmap skss<leader>	22k
nmap sksd<leader>	23k
nmap sksf<leader>	24k
nmap sksg<leader>	25k
nmap sksh<leader>	26k
nmap sksj<leader>	27k
nmap sksk<leader>	28k
nmap sksl<leader>	29k
nmap skd;<leader>	30k
nmap skda<leader>	31k
nmap skds<leader>	32k
nmap skdd<leader>	33k
nmap skdf<leader>	34k
nmap skdg<leader>	35k
nmap skdh<leader>	36k
nmap skdj<leader>	37k
nmap skdk<leader>	38k
nmap skdl<leader>	39k
nmap skf;<leader>	40k
nmap skfa<leader>	41k
nmap skfs<leader>	42k
nmap skfd<leader>	43k
nmap skff<leader>	44k
nmap skfg<leader>	45k
nmap skfh<leader>	46k
nmap skfj<leader>	47k
nmap skfk<leader>	48k
nmap skfl<leader>	49k
nmap skg;<leader>	50k
nmap skga<leader>	51k
nmap skgs<leader>	52k
nmap skgd<leader>	53k
nmap skgf<leader>	54k
nmap skgg<leader>	55k
nmap skgh<leader>	56k
nmap skgj<leader>	57k
nmap skgk<leader>	58k
nmap skgl<leader>	59k
nmap skh;<leader>	60k
nmap skha<leader>	61k
nmap skhs<leader>	62k
nmap skhd<leader>	63k
nmap skhf<leader>	64k
nmap skhg<leader>	65k
nmap skhh<leader>	66k
nmap skhj<leader>	67k
nmap skhk<leader>	68k
nmap skhl<leader>	69k
nmap skj;<leader>	70k
nmap skja<leader>	71k
nmap skjs<leader>	72k
nmap skjd<leader>	73k
nmap skjf<leader>	74k
nmap skjg<leader>	75k
nmap skjh<leader>	76k
nmap skjj<leader>	77k
nmap skjk<leader>	78k
nmap skjl<leader>	79k
nmap skk;<leader>	80k
nmap skka<leader>	81k
nmap skks<leader>	82k
nmap skkd<leader>	83k
nmap skkf<leader>	84k
nmap skkg<leader>	85k
nmap skkh<leader>	86k
nmap skkj<leader>	87k
nmap skkk<leader>	88k
nmap skkl<leader>	89k
nmap skl;<leader>	90k
nmap skla<leader>	91k
nmap skls<leader>	92k
nmap skld<leader>	93k
nmap sklf<leader>	94k
nmap sklg<leader>	95k
nmap sklh<leader>	96k
nmap sklj<leader>	97k
nmap sklk<leader>	98k
nmap skll<leader>	99k

nnoremap sj <nop>
nmap sja<leader>	1j
nmap sjs<leader>	2j
nmap sjd<leader>	3j
nmap sjf<leader>	4j
nmap sjg<leader>	5j
nmap sjh<leader>	6j
nmap sjj<leader>	7j
nmap sjk<leader>	8j
nmap sjl<leader>	9j
nmap sja;<leader>	10j
nmap sjaa<leader>	11j
nmap sjas<leader>	12j
nmap sjad<leader>	13j
nmap sjaf<leader>	14j
nmap sjag<leader>	15j
nmap sjah<leader>	16j
nmap sjaj<leader>	17j
nmap sjak<leader>	18j
nmap sjal<leader>	19j
nmap sjs;<leader>	20j
nmap sjsa<leader>	21j
nmap sjss<leader>	22j
nmap sjsd<leader>	23j
nmap sjsf<leader>	24j
nmap sjsg<leader>	25j
nmap sjsh<leader>	26j
nmap sjsj<leader>	27j
nmap sjsj<leader>	28j
nmap sjsl<leader>	29j
nmap sjd;<leader>	30j
nmap sjda<leader>	31j
nmap sjds<leader>	32j
nmap sjdd<leader>	33j
nmap sjdf<leader>	34j
nmap sjdg<leader>	35j
nmap sjdh<leader>	36j
nmap sjdj<leader>	37j
nmap sjdk<leader>	38j
nmap sjdl<leader>	39j
nmap sjf;<leader>	40j
nmap sjfa<leader>	41j
nmap sjfs<leader>	42j
nmap sjfd<leader>	43j
nmap sjff<leader>	44j
nmap sjfg<leader>	45j
nmap sjfh<leader>	46j
nmap sjfj<leader>	47j
nmap sjfk<leader>	48j
nmap sjfl<leader>	49j
nmap sjg;<leader>	50j
nmap sjga<leader>	51j
nmap sjgs<leader>	52j
nmap sjgd<leader>	53j
nmap sjgf<leader>	54j
nmap sjgg<leader>	55j
nmap sjgh<leader>	56j
nmap sjgj<leader>	57j
nmap sjgk<leader>	58j
nmap sjgl<leader>	59j
nmap sjh;<leader>	60j
nmap sjha<leader>	61j
nmap sjhs<leader>	62j
nmap sjhd<leader>	63j
nmap sjhf<leader>	64j
nmap sjhg<leader>	65j
nmap sjhh<leader>	66j
nmap sjhj<leader>	67j
nmap sjhk<leader>	68j
nmap sjhl<leader>	69j
nmap sjj;<leader>	70j
nmap sjja<leader>	71j
nmap sjjs<leader>	72j
nmap sjjd<leader>	73j
nmap sjjf<leader>	74j
nmap sjjg<leader>	75j
nmap sjjh<leader>	76j
nmap sjjj<leader>	77j
nmap sjjk<leader>	78j
nmap sjjl<leader>	79j
nmap sjk;<leader>	80j
nmap sjka<leader>	81j
nmap sjks<leader>	82j
nmap sjkd<leader>	83j
nmap sjkf<leader>	84j
nmap sjkg<leader>	85j
nmap sjkh<leader>	86j
nmap sjkj<leader>	87j
nmap sjkk<leader>	88j
nmap sjkl<leader>	89j
nmap sjl;<leader>	90j
nmap sjla<leader>	91j
nmap sjls<leader>	92j
nmap sjld<leader>	93j
nmap sjlf<leader>	94j
nmap sjlg<leader>	95j
nmap sjlh<leader>	96j
nmap sjlj<leader>	97j
nmap sjlk<leader>	98j
nmap sjll<leader>	99j
