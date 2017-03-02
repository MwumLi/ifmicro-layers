Plugin 'plasticboy/vim-markdown',      { 'on': []}
Plugin 'mzlogin/vim-markdown-toc',     { 'for': ['markdown']}
Plugin 'iamcco/markdown-preview.vim',  { 'for': ['markdown']}
" Plugin 'mzlogin/vim-markdown-toc',     { 'on': []}
" Plugin 'iamcco/markdown-preview.vim',  { 'on': []}

" Load YCM for specific filetypes
function! s:invoke_vim_markdown()
    let l:supported = ['markdown']
    let l:cur_ft = &filetype

    if index(l:supported, l:cur_ft) > -1 && !exists('s:autocmd_vim_markdown')
        call plug#load('vim-markdown')
        " call plug#load('vim-markdown-toc')
        " call plug#load('markdown-preview.vim')
        let s:autocmd_vim_markdown = 1
    endif
endfunction

augroup LOAD_VIM_MARKDOWN
    autocmd!
    autocmd InsertEnter * call s:invoke_vim_markdown()
augroup END
