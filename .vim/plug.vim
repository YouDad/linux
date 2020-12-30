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
		Plug 'dracula/vim'
		Plug 'RRethy/vim-illuminate'
		Plug 'tpope/vim-surround'
		Plug 'gcmt/wildfire.vim'
		" Plug 'connorholyday/vim-snazzy'
		" Plug 'Rigellute/rigel'
		" Plug 'lmintmate/blue-mood-vim'

		if exists("g:my_module_coc") && g:my_module_coc == 1
			"coc
			Plug 'neoclide/coc.nvim', {'branch': 'release'}
		endif

		if exists("g:my_module_go") && g:my_module_go == 1
			"go
			Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
		endif

		if exists("g:my_module_web") && g:my_module_web == 1
			"html, css
			Plug 'mattn/emmet-vim'
			Plug 'JulesWang/css.vim'
			" Plug 'cakebaker/scss-syntax.vim'
			"vim highlight
			Plug 'posva/vim-vue'
			Plug 'digitaltoad/vim-pug'
			"javascript
			Plug 'pangloss/vim-javascript'
			"color
			Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
		endif

		if exists("g:my_module_markdown") && g:my_module_markdown == 1
			"markdown
			Plug 'godlygeek/tabular'
			Plug 'plasticboy/vim-markdown'
			Plug 'dhruvasagar/vim-table-mode'
			if has ("nvim")
				Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
			endif
			if exists("g:my_module_wiki") && g:my_module_wiki == 1
				"wiki
				Plug 'vimwiki/vimwiki'
			endif
			" "rst2html (deprecated)
			"Plug 'gu-fan/riv.vim'
		endif

		if exists("g:my_module_other") && g:my_module_other == 1
			"filetree
			Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
			Plug 'Xuyuanp/nerdtree-git-plugin'

			Plug 'rbgrouleff/bclose.vim'
			Plug 'francoiscabrol/ranger.vim'
			"undotree
			Plug 'mbbill/undotree'
			"bookmark
			Plug 'kshenoy/vim-signature'
			"startify
			Plug 'mhinz/vim-startify'
			"comment
			Plug 'scrooloose/nerdcommenter'
			"ack!
			Plug 'mileszs/ack.vim'
			"clipboard
			Plug 'junegunn/vim-peekaboo'
			"fzf
			Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
			Plug 'junegunn/fzf.vim'
			"clever-f
			Plug 'rhysd/clever-f.vim'
		endif

		if exists("g:my_module_translator") && g:my_module_translator == 1
			"translate
			Plug 'voldikss/vim-translator'
		endif

		if exists("g:my_module_tagbar") && g:my_module_tagbar == 1
			"taglist
			"Plug 'vim-scripts/taglist.vim'
			Plug 'majutsushi/tagbar'
		endif

		if exists("g:my_module_pdf") && g:my_module_pdf == 1
			"pdf
			Plug 'makerj/vim-pdf'
		endif
    call plug#end()

    "vim-airline
        let g:airline#extensions#coc#enabled = 1
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 1
        let g:airline#extensions#tabline#formatter = 'unique_tail'
		let g:airline#extensions#tabline#tab_nr_type = 1
		let g:airline#extensions#tabline#show_tab_nr = 1
		let g:airline#extensions#tabline#fnametruncate = 16
		let g:airline#extensions#tabline#fnamecollapse = 2
		let g:airline#extensions#tabline#buffer_idx_mode = 1
        let g:airline#extensions#tabline#buffer_nr_show = 0
        let g:airline_powerline_fonts = 0
        let g:airline_left_sep = ''
        let g:airline_right_sep = ''

    "vim-colorscheme
        if has ("nvim")
            set termguicolors
        endif

        "colorscheme snazzy
        "colorscheme rigel
        colorscheme dracula
            "启用定位光标的行列，设置行列样式
            set cursorline
            set cursorcolumn
			if has ("nvim")
				highlight CursorLine ctermfg=None ctermbg=236 guifg=None guibg=#111111
				highlight CursorColumn ctermfg=None ctermbg=236 guifg=None guibg=#222222
			else
				highlight CursorLine ctermbg=236 guibg=#111111
				highlight CursorColumn ctermbg=236 guibg=#222222
			endif
        "colorscheme blue-mood
        highlight Normal guibg=NONE ctermbg=None
		highlight comment ctermfg=DarkGreen guifg=#008800

	"vim-illuminate
		let g:Illuminate_delay = 750
		hi illuminatedWord ctermbg=236 guibg=#333333

	"wildfire.vim
		map  <enter>    <plug>(wildfire-fuel)
		vmap <c-enter>  <plug>(wildfire-water)
		let g:wildfire_objects = [
					\ "iw", "iW",
					\ "i'", "a'",
					\ "i\"", "a\"",
					\ "i)", "a)",
					\ "i]", "a]",
					\ "i}", "a}",
					\]

	if exists("g:my_module_coc") && g:my_module_coc == 1
		"coc
			set hidden
			set updatetime=100
			set shortmess+=c
			if has("patch-8.1.1564")
			  set signcolumn=number
			else
			  set signcolumn=yes
			endif
			inoremap <silent><expr> <TAB>
				  \ pumvisible() ? "\<C-n>" :
				  \ <SID>check_back_space() ? "\<TAB>" :
				  \ coc#refresh()
			inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

			function! s:check_back_space() abort
			  let col = col('.') - 1
			  return !col || getline('.')[col - 1]  =~# '\s'
			endfunction

			inoremap <silent><expr> <c-o> coc#refresh()

			if exists('*complete_info')
			  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
			else
			  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
			endif

			nmap <silent> g[ <Plug>(coc-diagnostic-prev)
			nmap <silent> g] <Plug>(coc-diagnostic-next)

			nmap <silent> gd <Plug>(coc-definition)
			nmap <silent> gy <Plug>(coc-type-definition)
			nmap <silent> gi <Plug>(coc-implementation)
			nmap <silent> gr <Plug>(coc-references)

			nnoremap <silent> K :call <SID>show_documentation()<CR>

			function! s:show_documentation()
			  if (index(['vim','help'], &filetype) >= 0)
				execute 'h '.expand('<cword>')
			  else
				call CocAction('doHover')
			  endif
			endfunction

			nmap <leader>rn <Plug>(coc-rename)

			xmap <leader>f  <Plug>(coc-format-selected)

			xmap <leader>a  <Plug>(coc-codeaction-selected)
			nmap <leader>a  <Plug>(coc-codeaction-selected)

			nmap <leader>ac  <Plug>(coc-codeaction)

			" coc-marketplace: CocList marketplace
			let g:coc_global_extensions = [
						\ 'coc-marketplace',
						\ 'coc-snippets',
						\ 'coc-actions',
						\ 'coc-lists',
						\ 'coc-pairs',
						\ 'coc-yank',
						\ 'coc-git',
						\ 'coc-json',
						\ 'coc-vimlsp'
						\]
			if exists("g:my_module_web") && g:my_module_web == 1
				let g:coc_global_extensions += ['coc-html', 'coc-css', 'coc-scssmodules']
			endif
			"'coc-tsserver', 'coc-go', 'coc-sh',
			"'coc-python', 'coc-java',

			imap <c-j> <plug>(coc-snippets-expand)
			let g:coc_snippet_next = '<c-j>'
			let g:coc_snippet_prev = '<c-k>'

			nnoremap <silent> <leader>p  :<c-u>CocList -A --normal yank<cr>

		"coc-pairs
			autocmd FileType markdown let b:coc_pairs_disabled = ['`']
	endif

	if exists("g:my_module_go") && g:my_module_go == 1
		"vim-go
			autocmd filetype go nnoremap <buffer> ga :GoInfo<cr>
			autocmd filetype go nmap     <buffer> <C-RightMouse> <C-t>
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
	endif

	if exists("g:my_module_web") && g:my_module_web == 1
		"emmet-vim
			let g:user_emmet_mode='inv'
			let g:user_emmet_install_global = 0
			autocmd filetype html,css,scss.css EmmetInstall
			au BufRead,BufNewFile *.scss set filetype=scss.css
			autocmd FileType scss set iskeyword+=-

		"vim-vue
			let g:vue_pre_processors = ['pug']

		"vim-hexokinase
			let g:Hexokinase_highlighters = ['background']
	endif

	if exists("g:my_module_markdown") && g:my_module_markdown == 1
		"vim-markdown
			let g:vim_markdown_folding_disabled = 1

		"markdown-preview.nvim
			nmap <leader>m	:MarkdownPreview<cr>
			nmap <leader>mt	:TableFormat<cr>
			"
			let g:mkdp_auto_start = 0
			let g:mkdp_auto_close = 0
			let g:mkdp_refresh_slow = 0
			let g:mkdp_command_for_global = 0
			let g:mkdp_open_to_the_world = 0
			let g:mkdp_open_ip = ''
			let g:mkdp_browser = 'firefox'
			let g:mkdp_echo_preview_url = 1
			let g:mkdp_browserfunc = ''
			let g:mkdp_markdown_css = expand('~/my/src/markdown/markdown.css')
			let g:mkdp_highlight_css = expand('~/my/src/markdown/highlight.css')
			let g:mkdp_port = ''
			let g:mkdp_page_title = '${name}'
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

		if exists("g:my_module_wiki") && g:my_module_wiki == 1
			"vimwiki
				let g:vimwiki_list = [
					 \{"path": "~/my/link/wiki/",
					 \ "syntax": "markdown",
					 \ "ext": ".md"
					 \}]
		endif

		"riv.vim
			"nmap <silent> <leader>t :Riv2HtmlAndBrowse<cr>
	endif

	if exists("g:my_module_other") && g:my_module_other == 1
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

		"nerdcommenter
			let g:NERDSpaceDelims = 1
			let g:NERDCompactSexyComs = 1
			let g:NERDDefaultAlign = 'left'
			let g:NERDAltDelims_java = 1
			let g:NERDCommentEmptyLines = 1
			let g:NERDTrimTrailingWhitespace = 1
			let g:NERDToggleCheckAllLines = 1

		"ack!
			nnoremap sa :Ack<cr>

		"clever-f
			map ; <Plug>(clever-f-repeat-forward)
			map , <Plug>(clever-f-repeat-back)
	endif

	if exists("g:my_module_translator") && g:my_module_translator == 1
		"vim-translate-me
			"<leader>w 翻译光标下的文本，在窗口中显示
			nmap <silent> <leader>w <plug>TranslateW
			vmap <silent> <leader>w <plug>TranslateWV
			"<leader>r 替换光标下的文本为翻译内容
			nmap <silent> <leader>r <plug>TranslateR
			vmap <silent> <leader>r <plug>TranslateRV
			"
			let g:vtm_default_to_lang = 'zh'
	endif

	if exists("g:my_module_tagbar") && g:my_module_tagbar == 1
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
	endif
