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
        "Plug 'vim-scripts/taglist.vim'
		Plug 'majutsushi/tagbar'

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

		"ack!
		Plug 'mileszs/ack.vim'

		"clipboard
		Plug 'junegunn/vim-peekaboo'

		"pdf
		Plug 'makerj/vim-pdf'
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
		"
        let g:mkdp_auto_start = 0
        let g:mkdp_auto_close = 1
        let g:mkdp_refresh_slow = 0
        let g:mkdp_command_for_global = 0
        let g:mkdp_open_to_the_world = 0
        let g:mkdp_open_ip = ''
        let g:mkdp_browser = 'firefox'
        let g:mkdp_echo_preview_url = 1
        let g:mkdp_browserfunc = ''
        let g:mkdp_markdown_css = ''
        let g:mkdp_highlight_css = ''
        let g:mkdp_port = ''
        let g:mkdp_page_title = '「${name}」'
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
		"
        let g:vtm_default_mapping = 0
        let g:vtm_default_to_lang = 'zh'
        let g:vtm_default_engines = ['bing', 'ciba', 'youdao']
        let g:vtm_proxy_url= ''
        let g:vtm_enable_history= 1
        let g:vtm_max_history_count= 100
		" let g:vtm_history_dir=

    "riv.vim
        "nmap <silent> <leader>t :Riv2HtmlAndBrowse<cr>

    "vim-signature
        let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'DeleteMark'         :  "sd",
            \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'ListLocalMarks'     :  "m/",
            \ }

    "fzf
        nmap sp :FZF<CR>

    "coc
	    let g:coc_global_extensions = [
					\ 'coc-yank',
					\ 'coc-git',
					\ 'coc-json',
					\ 'coc-go',
					\ 'coc-lists',
					\ ]
		"
		nnoremap <leader>rn <Plug>(coc-rename)
		nnoremap <leader>p  :<c-u>CocList -A --normal yank<cr>
		set hidden
		set nobackup
		set nowritebackup
		set cmdheight=2
		set updatetime=300

    "tagbar
		nnoremap sg :TagbarToggle<cr>
		"
		let g:tagbar_width = 50
		let g:tarbar_autoclose = 1
		let g:tarbar_autofocus = 0
		let g:tarbar_sort = 0
		let g:tarbar_indent = 1
		let g:tarbar_foldlevel = 1
		let g:tarbar_autoshowtag = 0
		let g:tarbar_autopreview = 0

    "emmet-vim
        let g:user_emmet_mode='inv'
        let g:user_emmet_install_global = 0
        autocmd filetype html,css EmmetInstall

    "nerdcommenter
        let g:NERDSpaceDelims = 1
        let g:NERDCompactSexyComs = 1
        let g:NERDDefaultAlign = 'left'
        let g:NERDAltDelims_java = 1
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
		autocmd filetype go nnoremap <buffer> gr :GoReferrers<cr>
		autocmd filetype go nnoremap <buffer> ga :GoInfo<cr>
		autocmd filetype go nmap     <buffer> <C-RightMouse> <C-t>
		"
		inoremap <silent><expr> <TAB>
					\ pumvisible() ? "\<C-n>" :
					\ <SID>check_back_space() ? "\<TAB>" :
					\ coc#refresh()
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
		"
		function! s:check_back_space() abort
			let col = col('.') - 1
			return !col || getline('.')[col - 1]  =~# '\s'
		endfunction
		"
		let g:go_template_autocreate                 = 0
		let g:go_textobj_enabled                     = 0
		let g:go_auto_type_info                      = 0
		"
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
		"
		let g:go_highlight_diagnostic_errors         = 0
		let g:go_highlight_diagnostic_warnings       = 0

	"ack!
		nnoremap sa :Ack<cr>
