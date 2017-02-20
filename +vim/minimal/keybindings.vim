
" Visual shifting (does not exit Visual mode) {
  vnoremap < <gv
  vnoremap > >gv
" }

" Treat long lines as break lines (useful when moving around in them) {
  nmap j gj
  nmap k gk
  vmap j gj
  vmap k gk
" }

" :W sudo saves the file
" (useful for handling the permission-denied error) {
  command! W w !sudo tee % > /dev/null
" }

" file save
nnoremap <Leader>fs :update<CR>

" Quit normal mode {
  nnoremap <Leader>q  :q<CR>
  nnoremap <Leader>Q  :qa!<CR>
" }

" Move half page faster {
  " <C-d> : 向下移动半页
  " <C-u> : 向上移动半页
" }

" Insert mode shortcut {
  inoremap <C-h> <Left>
  inoremap <C-j> <Down>
  inoremap <C-k> <Up>
  inoremap <C-l> <Right>
" }

" like bash {
  inoremap <C-a> <Home>
  inoremap <C-e> <End>
  inoremap <C-d> <Delete>
" }

" Command mode shortcut {
  cnoremap <C-h> <left>
  cnoremap <C-j> <Down>
  cnoremap <C-k> <Up>
  cnoremap <C-l> <Right>
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-d> <Delete>
" }

" Quit visual mode
vnoremap v <Esc>

" move {
  " jump to the start of line (Normal/Visual)
  noremap 1 0
  " jump to the end of line (Normal/Visual)
  noremap 0 $
  " jump to the start of line text (Normal/Visual)
  noremap H ^
  " jump loop in Pairing characters , such '( ... )', '{  }' (Normal/Visual)
  noremap 5 %
  " <C-w>H -- 跳转至左方的窗口
  " <C-w>l -- 跳转至右方的窗口
  " <C-w>k -- 跳转至上方的窗口
  " <C-w>j -- 跳转至下方的窗口
" }

" Quick command mode
nnoremap ; :

" Open shell in vim
" :shell

" Search result highlight countermand
nnoremap <Leader>sc :nohlsearch<CR>

" Toggle pastemode
nnoremap <Leader>tp :setlocal paste!<CR>

" window-split {
    " :sp 或 :new -- 上下分割窗口
    " :vsp 或 :vnew -- 左右分割窗口
" }

" buffer {
  nnoremap <Leader>bp :bprevious<CR>
  nnoremap <Leader>bn :bnext<CR>
  nnoremap <Leader>bf :bfirst<CR>
  nnoremap <Leader>bl :blast<CR>
  nnoremap <Leader>bd :bd<CR>
  nnoremap <Leader>bk :bw<CR>
  " Use Tab to switch buffer
  nnoremap <Tab> :bn<CR>
  nnoremap <S-Tab> :bp<CR>
" }

" https://github.com/ntpeters/vim-better-whitespace
" Removes all extraneous whitespace in the file {
  function! s:StripWhitespace( line1, line2 )
      " https://github.com/ntpeters/vim-better-whitespace/blob/master/whitespace_examples.txt
      " Define custom whitespace character group to include all horizontal unicode
      " whitespace characters. Vim's '\s' class only includes ASCII spaces and tabs.
      let l:whitespace_group='[\u0009\u0020\u00a0\u1680\u180e\u2000-\u200b\u202f\u205f\u3000\ufeff]'
      let l:eol_whitespace_pattern = l:whitespace_group . '\+$'

      " Save the current search and cursor position
      let _s=@/
      let l = line(".")
      let c = col(".")
      " Strip the whitespace
      silent! execute ':' . a:line1 . ',' . a:line2 . 's/' . l:eol_whitespace_pattern . '//e'

      " Restore the saved search and cursor position
      let @/=_s
      call cursor(l, c)
  endfunction

  " Run :StripWhitespace to remove end of line whitespace
  command! -range=% StripWhitespace call <SID>StripWhitespace( <line1>, <line2> )

  nnoremap <Leader>xd :StripWhitespace<CR>
" }
