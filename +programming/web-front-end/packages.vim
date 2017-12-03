Plugin 'mattn/emmet-vim', { 'for': ['markdown', 'html', 'xml', 'javascript', 'css', 'vue.html.javascript.css', 'javascript.jsx']}

" color preview for vim
Plugin 'gko/vim-coloresque', { 'on': [] }

" Load YCM for specific filetypes
function! s:invoke_vim_coloresque()
    let l:supported = ['markdown', 'html', 'javascript', 'css', 'scss', 'sass', 'less', 'vue']
    let l:cur_ft = &filetype
    if index(l:supported, l:cur_ft) > -1 && !exists('s:autocmd_exist_vim_coloresque')
        call plug#load('vim-coloresque')
        let s:autocmd_exist_vim_coloresque = 1
    endif
endfunction

augroup LOAD_VIM_COLORESQUE
    autocmd!
    autocmd InsertEnter * call s:invoke_vim_coloresque()
augroup END
