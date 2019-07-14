let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

if !exists('g:vpbuffer_key_map_flag')
	let g:vpbuffer_key_map_flag = 0
endif

let g:vpbuffer_key_map_ex= {'a' : 1}

function! s:_set_buffer_list_before() abort
	" echo snext_var
	let s:buffer_ls_list = split(execute('ls'), '\n')
	" TODO" ex.. buffer list = {num, [buffer_name, buffer_file_type]}
		" ex ) "3  a-  "[ロケーションリスト]"         行 0"
		" 3:num a-:buf_type "[ロケーションリスト]":buf_name
		" echo matchstr('3 a- "tst"', '\(\d\+\s\+\)\zs\S\+')
	let s:buffer_list = []
	let s:buffer_num_list = []
	let s:buffer_dict = {}
	let s:buffer_num_integer_list = []
	echo s:buffer_ls_list

	let s:buffer_ls_list = split(execute('ls'), '\n')
	for i in range(len(s:buffer_ls_list))

		" echo getbufinfo(i)
		" echo matchstr(s:buffer_ls_list[i], '\(\d\+\s\+\)\zs\S\.\{-})-\@!.*\(\s\)\ze')
		" echo s:buffer_ls_list[i]

		" return if filetype is qf
		" if s:buffer_ls_list[i]

		" endif

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

function! _call_with_key(key)
	" echo g:vpbuffer_key_map_ex[a:key]
	" call 'silent b ' . s:buffer_num_list[vpbuffer_key_map_ex[a:key]]
	" call 'silent b ' . s:buffer_num_list[g:vpbuffer_key_map_ex[a:key]]
	" echo type(g:vpbuffer_key_map_ex[a:key])
endfunction

function! vpbuffer#call_with_key(key)
	execute s:_set_buffer_list_before()
	" call _call_with_key(a:key)
	" echo g:vpbuffer_key_map_ex[a:key]
	execute 'silent b ' . s:buffer_num_list[g:vpbuffer_key_map_ex[a:key]]
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
