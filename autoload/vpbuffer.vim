scriptencoding utf-8

function! s:_set_buffer_list_before() abort
	let s:buffer_ls_list = split(execute('ls'), '\n')
	let s:buffer_list = []
	let s:buffer_num_list = []
	let s:buffer_dict = {}
	let s:buffer_num_integer_list = []

	for i in range(len(s:buffer_ls_list))
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
	execute 'b ' . s:buffer_num_list[a:idx-1]
endfunction

function! vpbuffer#list() abort
	execute s:_set_buffer_list_before()

	call popup_menu(s:buffer_list, {
			\ 'filter': 'popup_filter_menu',
			\ 'borderchars': [' ',' ',' ',' ','*','*','*','*'],
			\ 'callback': function('s:_call_buffer', [s:buffer_ls_list])
			\ })
endfunction
