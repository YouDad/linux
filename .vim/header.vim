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
	call setline(2, '</template>')
	call setline(3, '')
	call setline(4, '<script>')
	call setline(5, "import Vue from 'vue'")
	call setline(6, '')
	call setline(7, 'export default Vue.extend({')
	call setline(8, '	name: "", // MyName')
	call setline(9, "	components: {}, // 'my-name': Components,")
	call setline(10, '	props: {}, // props: Object')
	call setline(11, '	created() {},')
	call setline(12, '	watch: {},')
	call setline(13, '	data() {')
	call setline(14, '		return {')
	call setline(15, '		}')
	call setline(16, '	},')
	call setline(17, '	computed: {')
	call setline(18, '	},')
	call setline(19, '	methods: {')
	call setline(20, '	},')
	call setline(21, '})')
	call setline(22, '</script>')
	call setline(23, '')
	call setline(24, '<style lang="scss" scoped>')
	call setline(25, '</style>')
	normal 2G
endfunction
