scriptencoding utf-8

" key map configuration {{{
nnoremap <silent> <Plug>(vpbuffer-list) :<C-u>call vpbuffer#list<CR>
" }}}

" call buffer
command! -nargs=0 LoadBuffer call vpbuffer#list()
