scriptencoding utf-8

" call buffer
command! -nargs=0 LoadBuffer call vpbuffer#list()

" active when vpb_flag eq 1 {{{
if g:vpbuffer_key_map_flag == 1

endif
" }}}

function! s:vpb_point_motion(motions) abort
	" [key, dict] in items(a:motions)
endfunction

function! s:vpb_point_motion_test(motions) abort
	" [key, dict] in items(a:motions)
endfunction


" point_call: {{{
" defalult key_mapping
call s:vpb_point_motion({
	\ 'a'				: { 'point' : 1 },
	\ 'b'				: { 'point' : 2 },
	\ 'd'				: { 'point' : 3 },
	\ 'f'				: { 'point' : 4 },
	\ 'g'				: { 'point' : 5 },
	\ })
" }}}

" point_call_test: {{{
" defalult key_mapping
" }}}

" TODO: location buffer can call but not display this (with flag)
