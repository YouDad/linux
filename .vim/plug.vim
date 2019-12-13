"插件区
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "让插件正常工作的一些设置
        set nocompatible
        filetype on
        filetype indent on
        filetype plugin on
        filetype plugin indent on

    "插件的声明区
    call plug#begin('~/.vim/plugged')
        "appearance
        Plug 'vim-airline/vim-airline'
        Plug 'connorholyday/vim-snazzy'
        Plug 'Rigellute/rigel'
        Plug 'dracula/vim'
        Plug 'lmintmate/blue-mood-vim'

        "filetree
        Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'Xuyuanp/nerdtree-git-plugin'

        "undotree
        Plug 'mbbill/undotree'

        "markdown
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
        Plug 'dhruvasagar/vim-table-mode'
        if has ("nvim")
        	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
        endif

        "translate
        Plug 'voldikss/vim-translate-me'

        "rst2html (deprecated)
        "Plug 'gu-fan/riv.vim'

        "bookmark
        Plug 'kshenoy/vim-signature'

        "fzf
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

        "startify
        Plug 'mhinz/vim-startify'

        "coc
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        "taglist
        Plug 'vim-scripts/taglist.vim'

        "html, css
        Plug 'mattn/emmet-vim'

        "comment
        Plug 'scrooloose/nerdcommenter'

        "javascript
        Plug 'pangloss/vim-javascript'

		"wiki
		Plug 'vimwiki/vimwiki'

		"go
		Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    call plug#end()

    "vim-airline
        let g:airline#extensions#coc#enabled = 0
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 1
        let g:airline#extensions#tabline#formatter = 'unique_tail'
        let g:airline#extensions#tabline#buffer_nr_show = 1
        let g:airline_powerline_fonts = 0
        let g:airline_left_sep = ''
        let g:airline_right_sep = ''
        let g:airline_mode_map = {
              \ 'n'  : 'N',
              \ 'i'  : 'I',
              \ 'R'  : 'R',
              \ 'c'  : 'C',
              \ 'v'  : 'V',
              \ 'V'  : 'L',
              \ '' : 'B',
              \ }

    "vim-colorscheme
        if has ("nvim")
            set termguicolors
        endif

        "colorscheme snazzy
        "colorscheme rigel
        colorscheme dracula
            "启用定位光标的行列，设置行列样式
            set cursorline
            highlight CursorLine ctermfg=None ctermbg=236 guifg=None guibg=#224466
            set cursorcolumn
            highlight CursorColumn ctermfg=None ctermbg=236 guifg=None guibg=#224466
        "colorscheme blue-mood
        highlight Normal guibg=NONE ctermbg=None


    "nerdtree
        map st			:NERDTreeToggle<cr>

    "nerdtree-git-plugin
        let g:NERDTreeIndicatorMapCustom = {
            \ "Modified" : "✹",
            \ "Staged"   : "✚",
            \ "Untracked": "✭",
            \ "Renamed"  : "➜",
            \ "Unmerged" : "═",
            \ "Deleted"  : "✖",
            \ "Dirty"    : "✗",
            \ "Clean"    : "✔︎",
            \ "Unknown"  : "?"
        \ }

    "undotree
        map su			:UndotreeToggle<cr>

    "vim-markdown
        let g:vim_markdown_folding_disabled = 1

    "markdown-preview.nvim
        nmap <leader>m	:MarkdownPreview<cr>
        nmap <leader>mt	:TableFormat<cr>
        "set to 1, nvim will open the preview window after entering the markdown buffer default: 0
        let g:mkdp_auto_start = 0
        "set to 1, the nvim will auto close current preview window when change from markdown buffer to another buffer default: 1
        let g:mkdp_auto_close = 1
        "set to 1, the vim will refresh markdown when save the buffer or leave from insert mode, default 0 is auto refresh markdown as you edit or move the cursor default: 0
        let g:mkdp_refresh_slow = 0
        "set to 1, the MarkdownPreview command can be use for all files, by default it can be use in markdown file default: 0
        let g:mkdp_command_for_global = 0
        "set to 1, preview server available to others in your network by default, the server listens on localhost (127.0.0.1) default: 0
        let g:mkdp_open_to_the_world = 0
        "use custom IP to open preview page useful when you work in remote vim and preview on local browser more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9 default empty
        let g:mkdp_open_ip = ''
        "specify browser to open preview page default: ''
        let g:mkdp_browser = 'firefox'
        "set to 1, echo preview page url in command line when open preview page default is 0
        let g:mkdp_echo_preview_url = 1
        "a custom vim function name to open preview page this function will receive url as param default is empty
        let g:mkdp_browserfunc = ''
        "use a custom markdown style must be absolute path
        let g:mkdp_markdown_css = ''
        "use a custom highlight style must absolute path
        let g:mkdp_highlight_css = ''
        "use a custom port to start server or random for empty
        let g:mkdp_port = ''
        "preview page title ${name} will be replace with the file name
        let g:mkdp_page_title = '「${name}」'
        "options for markdown render
        "mkit: markdown-it options for render
        "katex: katex options for math
        "uml: markdown-it-plantuml options
        "maid: mermaid options
        "disable_sync_scroll: if disable sync scroll, default 0
        "sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
        "  middle: mean the cursor position alway show at the middle of the preview page
        "  top: mean the vim top viewport alway show at the top of the preview page
        "  relative: mean the cursor position alway show at the relative positon of the preview page
        "hide_yaml_meta: if hide yaml metadata, default is 1
        "sequence_diagrams: js-sequence-diagrams options
        let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {}
            \ }

    "vim-translate-me
        "<leader>w 翻译光标下的文本，在窗口中显示
        nmap <silent> <leader>w <plug>TranslateW
        vmap <silent> <leader>w <plug>TranslateWV
        "<leader>r 替换光标下的文本为翻译内容
        nmap <silent> <leader>r <plug>TranslateR
        vmap <silent> <leader>r <plug>TranslateRV

        vmap <leader>j dmaPV`akJpkV<leader>r

        "	是否使用默认快捷键 默认：1
        let g:vtm_default_mapping = 0
        "	默认翻译的目标语言 可选：参考各 engine 支持语言列表 默认：'zh'
        let g:vtm_default_to_lang = 'zh'
        "	默认翻译接口 可选：'bing', 'ciba', 'google'(可直连), youdao。可选多个 默认：['ciba', 'youdao']
        let g:vtm_default_engines = ['bing', 'ciba', 'youdao']
        "	代理地址，如 let g:vtm_proxy_url = 'socks5://127.0.0.1:1080' 默认：''
        let g:vtm_proxy_url= ''
        "	是否保存查询历史记录 默认：1
        let g:vtm_enable_history= 1
        "	保存查询记录的数目 默认：5000
        let g:vtm_max_history_count= 100
        "	历史记录文件的目录 默认：插件根目录
		" let g:vtm_history_dir=

    "riv.vim
        "nmap <silent> <leader>t :Riv2HtmlAndBrowse<cr>

    "vim-signature
        let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "",
            \ 'PurgeMarksAtLine'   :  "",
            \ 'DeleteMark'         :  "sd",
            \ 'PurgeMarks'         :  "",
            \ 'PurgeMarkers'       :  "",
            \ 'GotoNextLineAlpha'  :  "",
            \ 'GotoPrevLineAlpha'  :  "",
            \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
            \ 'GotoPrevSpotAlpha'  :  "",
            \ 'GotoNextLineByPos'  :  "",
            \ 'GotoPrevLineByPos'  :  "",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "",
            \ 'GotoPrevMarker'     :  "",
            \ 'GotoNextMarkerAny'  :  "",
            \ 'GotoPrevMarkerAny'  :  "",
            \ 'ListLocalMarks'     :  "m/",
            \ 'ListLocalMarkers'   :  ""
            \ }

    "fzf
        nmap sp :FZF<CR>

    "coc
        "nmap <leader>rn <Plug>(coc-rename)

    "taglist
        nmap sg	:TlistToggle<CR>
        let g:Tlist_Use_Right_Window = 1
        let g:Tlist_WinWidth = 50

    "emmet-vim
        let g:user_emmet_mode='inv'
        let g:user_emmet_install_global = 0
        autocmd filetype html,css EmmetInstall

    "nerdcommenter
        let g:NERDSpaceDelims = 1
        let g:NERDCompactSexyComs = 1
        let g:NERDDefaultAlign = 'left'
        let g:NERDAltDelims_java = 1
        let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
        let g:NERDCommentEmptyLines = 1
        let g:NERDTrimTrailingWhitespace = 1
        let g:NERDToggleCheckAllLines = 1

	"vimwiki
		let g:vimwiki_list = [
			 \{"path": "~/my/link/wiki/",
			 \ "syntax": "markdown",
			 \ "ext": ".md"
			 \}]

	"vim-go
		autocmd filetype go nnoremap gr :GoReferrers<cr>
		autocmd filetype qf nnoremap J j<cr>zz<c-w>j
		autocmd filetype qf nnoremap K k<cr>zz<c-w>j
		autocmd filetype go nnoremap ga :GoInfo<cr>
		autocmd filetype go nmap <C-RightMouse> <C-t>
		let g:go_template_autocreate = 0
		let g:go_textobj_enabled = 0
		let g:go_auto_type_info = 0
		"let g:go_def_mapping_enabled = 1
		let g:go_highlight_array_whitespace_error    = 1
		let g:go_highlight_build_constraints         = 1
		let g:go_highlight_chan_whitespace_error     = 1
		let g:go_highlight_extra_types               = 1
		let g:go_highlight_fields                    = 1
		let g:go_highlight_format_strings            = 1
		let g:go_highlight_function_calls            = 1
		let g:go_highlight_function_parameters       = 1
		let g:go_highlight_functions                 = 1
		let g:go_highlight_generate_tags             = 1
		let g:go_highlight_methods                   = 1
		let g:go_highlight_operators                 = 1
		let g:go_highlight_space_tab_error           = 1
		let g:go_highlight_string_spellcheck         = 1
		let g:go_highlight_structs                   = 1
		let g:go_highlight_trailing_whitespace_error = 1
		let g:go_highlight_types                     = 1
		let g:go_highlight_variable_assignments      = 0
		let g:go_highlight_variable_declarations     = 0
