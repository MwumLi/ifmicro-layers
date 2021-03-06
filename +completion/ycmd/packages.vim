Plugin 'rdnetto/YCM-Generator',  { 'on': ['YcmGenerateConfig', 'CCGenerateConfig'], 'branch': 'stable' }

function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status ==# 'installed' || a:info.force
        !./install.py --clang-completer
    endif
endfunction

Plugin 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'on': [] }

" Load YCM for specific filetypes
function! s:invoke_ycm()
    let l:supported = ['c', 'cpp', 'python', 'vim', 'js', 'go', 'sh']
    let l:cur_ft = &filetype
    if index(l:supported, l:cur_ft) > -1
        call plug#load('YouCompleteMe')
        call plug#load('SirVer/ultisnips')
    endif
endfunction

augroup LOAD_YCM
    autocmd!
    autocmd InsertEnter * call s:invoke_ycm()
augroup END

Plugin 'SirVer/ultisnips', { 'on': [] } 
Plugin 'honza/vim-snippets'


