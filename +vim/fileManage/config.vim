if layervim_core#PluginLoaded('scrooloose/nerdtree')
    " 是否显示隐藏文件
    let g:NERDTreeShowHidden=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeDirArrowExpandable = '➤'
    let g:NERDTreeDirArrowCollapsible = '▼'
    let g:NERDTreeIgnore=[
                \ '\.py[cd]$', '\~$', '\.swo$', '\.swp$',
                \ '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$',
                \ ]

    augroup NERDTREE
      autocmd!
      " close vim if the only window left open is a NERDTree
      autocmd bufenter * 
            \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
            \| q
            \| endif
      " open nerdtree instead of orginal file manager when open directory
      autocmd BufEnter,BufNew *
            \  if isdirectory(expand('<amatch>'))
            \|   call plug#load('nerdtree')
            \| endif
    augroup END

    nnoremap <F4> :NERDTreeToggle<CR>
    inoremap <F4> <ESC>:NERDTreeToggle<CR>
    nnoremap <Leader>ft :NERDTreeToggle<CR>

    if layervim_core#PluginLoaded('Xuyuanp/nerdtree-git-plugin')
      " https://github.com/Xuyuanp/nerdtree-git-plugin#faq
      let g:NERDTreeIndicatorMapCustom = {
                \ 'Modified'  : '✹',
                \ 'Staged'    : '✚',
                \ 'Untracked' : '✭',
                \ 'Renamed'   : '➜',
                \ 'Unmerged'  : '═',
                \ 'Deleted'   : '✖',
                \ 'Dirty'     : '✗',
                \ 'Clean'     : '✔︎',
                \ 'Unknown'   : '?'
                \ }
    endif
endif
