autocmd BufNewFile *.sh call HEADER_SHELL()

function! HEADER_SHELL()
	call setline(1, "\#!/bin/bash")
	call setline(2, "")
	call setline(3, "")
	normal 3G
endfunction

autocmd BufNewFile *.md call HEADER_MARKDOWN()

function! HEADER_MARKDOWN()
	call setline(1, "[TOC]")
	call setline(2, "")
	call setline(3, "# ")
	normal 3GA
endfunction

autocmd BufNewFile *.vue call HEADER_VUE()

function! HEADER_VUE()
	call setline(1, '<template lang="pug">')
	call setline(2, '')
	call setline(3, '</template>')
	call setline(4, '')
	call setline(5, '<script lang="ts">')
	call setline(6, "import Vue from 'vue'")
	call setline(7, '')
	call setline(8, 'export default Vue.extend({')
	call setline(9, '')
	call setline(10, '})')
	call setline(11, '</script>')
	call setline(12, '')
	call setline(13, '<style lang="less" scoped>')
	call setline(14, '')
	call setline(15, '</style>')
	normal 2G
endfunction
