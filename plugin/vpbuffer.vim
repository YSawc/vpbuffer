scriptencoding utf-8

" call buffer
command! -nargs=0 LoadBuffer call vpbuffer#list()

" active when vpb_flag eq 1
if g:vpbuffer_key_map_flag == 1
endif

function! s:vpb_point_motion(motions) abort
	[key, dict] in items(a:motions)
endfunction

" point_call: {{{
call s:vpb_point_motion({
	\ 'a'				: { 'point' : 1 },
	\ 'b'				: { 'point' : 2 },
	\ 'd'				: { 'point' : 3 },
	\ 'f'				: { 'point' : 4 },
	\ 'g'				: { 'point' : 5 },
	\ })


call s:vpb_point_motion_test({
	\ 'a'				: echo 'call_a',
	\ 'b'				: echo 'call_s',
	\ 'd'				: echo 'call_d',
	\ 'f'				: echo 'call_f',
	\ 'g'				: echo 'call_g',
	\ })
" }}}
