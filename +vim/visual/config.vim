" kshenoy/vim-signature {

"  mx           Toggle mark 'x' and display it in the leftmost column
"  dmx          Remove mark 'x' where x is a-zA-Z
"
"  m,           Place the next available mark
"  m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
"  m-           Delete all marks from the current line
"  m<Space>     Delete all marks from the current buffer
"  ]`           Jump to next mark
"  [`           Jump to prev mark
"  ]'           Jump to start of next line containing a mark
"  ['           Jump to start of prev line containing a mark
"  `]           Jump by alphabetical order to next mark
"  `[           Jump by alphabetical order to prev mark
"  ']           Jump by alphabetical order to start of next line having a mark
"  '[           Jump by alphabetical order to start of prev line having a mark
"  m/           Open location list and display marks from current buffer
"
"  m[0-9]       Toggle the corresponding marker !@#$%^&*()
"  m<S-[0-9]>   Remove all markers of the same type
"  ]-           Jump to next line having a marker of the same type
"  [-           Jump to prev line having a marker of the same type
"  ]=           Jump to next line having a marker of any type
"  [=           Jump to prev line having a marker of any type
"  m?           Open location list and display markers from current buffer
"  m<BS>        Remove all markers
" }

" {
" <Leader>ig  toggle visually displaying indent
if layervim_core#PluginLoaded('nathanaelkane/vim-indent-guides')
  nmap <Leader>ig :IndentGuidesToggle<CR>
  let g:indent_guides_start_level=2
  let g:indent_guides_guide_size=1
  if !has('gui_running')
    let g:indent_guides_auto_colors = 0
    augroup INDENT_GUIDE
      autocmd!
      autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
      autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
    augroup END
  endif
endif
" }
