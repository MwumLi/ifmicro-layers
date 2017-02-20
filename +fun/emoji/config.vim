" vim-emoji {
    augroup LAYERVIM_EMOJI
        autocmd!
        autocmd FileType markdown setlocal completefunc=emoji#complete
    augroup END
" }
