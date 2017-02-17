if layervim_core#PluginLoaded('easymotion/vim-easymotion')
  let g:EasyMotion_do_mapping = 0 " Disable default mappings
  let g:EasyMotion_smartcase = 1  " search ignore case, but press upper letter

  " set motion prefix
  map <Leader>j <Plug>(easymotion-prefix)

  " 替换默认搜索
  map  / <Plug>(easymotion-sn)

  " jump to single char
  map  <Leader>jc <Plug>(easymotion-bd-f)
  nmap <Leader>jc <Plug>(easymotion-overwin-f)

  " s{char}{char} to move to {char}{char}
  nmap <Leader>j2 <Plug>(easymotion-overwin-f2)

  " Jump to word
  map  <Leader>jw <Plug>(easymotion-bd-w)
  nmap <Leader>jw <Plug>(easymotion-overwin-w)
endif

if layervim_core#PluginLoaded('matze/vim-move')
  vmap <C-j> <Plug>MoveBlockDown
  vmap <C-k> <Plug>MoveBlockUp
  nmap <C-j> <Plug>MoveLineDown
  nmap <C-k> <Plug>MoveLineUp
endif
