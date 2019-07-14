let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

" call buffer
command! -nargs=0 LoadBuffer call vpbuffer#list()

function! s:vpb_point_motion(motions) abort
	[key, dict] in items(a:motions)
endfunction
