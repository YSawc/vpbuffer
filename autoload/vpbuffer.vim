scriptencoding utf-8

if !exists('g:vpbuffer_key_map_flag')
	let g:vpbuffer_key_map_flag = 0
endif

function! s:_set_buffer_list_before() abort
	let s:buffer_ls_list = split(execute('ls'), '\n')
	" TODO" ex.. buffer list = {num, [buffer_name, buffer_file_type]}
		" ex ) "3  a-  "[ロケーションリスト]"         行 0"
		" 3:num a-:buf_type "[ロケーションリスト]":buf_name
let s:buffer_list = []
	let s:buffer_num_list = []
	let s:buffer_dict = {}
	let s:buffer_num_integer_list = []
	echo s:buffer_ls_list

	for i in range(len(s:buffer_ls_list))
		echo s:buffer_ls_list[i]

		" return if filetype is qf
		if s:buffer_ls_list[i]

		endif

		call add(s:buffer_num_list, matchstr(s:buffer_ls_list[i], '\d\+'))
		call add(s:buffer_list, matchstr(s:buffer_ls_list[i], '\"\zs.*\ze\"'))
		let s:buffer_dict[s:buffer_num_list[i]] = matchstr(s:buffer_ls_list[i], '\"\zs.*\ze\"')
		call add(s:buffer_num_integer_list, str2nr(s:buffer_num_list[i], 10))
	endfor
endfunction

function! s:_call_buffer(buffer_ls_list, id, idx) abort
	if a:idx ==# -1
		return
	endif
	execute 'silent b ' . s:buffer_num_list[a:idx-1]
endfunction

function! vpbuffer#list() abort
	execute s:_set_buffer_list_before()

	let l:vpbuffer_key_map_flag = 1

	call popup_menu(s:buffer_list, {
			\ 'filter': 'popup_filter_menu',
			\ 'borderchars': [' ',' ',' ',' ','*','*','*','*'],
			\ 'callback': function('s:_call_buffer', [s:buffer_ls_list])
			\ })

	let l:vpbuffer_key_map_flag = 0

endfunction
