" Put the :hi command after any :colorscheme command,
" or the colorscheme can overwrite your highlighting.
if layervim_core#PluginLoaded('liuchengxu/space-vim-dark')
  silent! color space-vim-dark
else
    silent! color molokai
    hi CursorLine term=underline ctermbg=232 guibg=#293739
    hi Visual term=reverse ctermbg=23 guibg=#007173
endif

if layervim_core#PluginLoaded('chxuan/change-colorscheme')
  nmap <LocalLeader>nc :NextColorScheme<CR>
  nmap <LocalLeader>lc :PreviousColorScheme<CR>
  nmap <LocalLeader>sc :colorscheme<CR>
endif
