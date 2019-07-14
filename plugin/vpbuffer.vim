let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

" call buffer
command! -nargs=0 LoadBuffer call vpbuffer#list()

" active when vpb_flag eq 1 {{{
if g:vpbuffer_key_map_flag == 0
	echo g:vpbuffer_key_map_ex
endif
" }}}

function! s:vpb_point_motion(motions) abort
	" echo a:motions.0
	" [key, dict] in items(a:motions)
endfunction

function! s:vpb_point_motion_test(motions) abort
	" [key, dict] in items(a:motions)
endfunction

command! -nargs=1 CallWithKey call vpbuffer#call_with_key(<f-args>)

" point_call: {{{
" defalult key_mapping
call s:vpb_point_motion({
	\ '0'				: { 'point' : 1 },
	\ '1'				: { 'point' : 2 },
	\ '2'				: { 'point' : 3 },
	\ '3'				: { 'point' : 4 },
	\ '4'				: { 'point' : 5 },
	\ })
" }}}


" point_call_test: {{{
" defalult key_mapping
" }}}

" TODO: location buffer can call but not display this (with flag)
