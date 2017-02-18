if layervim_core#PluginLoaded('luochen1990/rainbow')
  let g:rainbow_active = 1
  let g:rainbow_conf = {
  \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  \   'operators': '_,\|;\|+\|-\|*\|\/\|===\|!==_',
  \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \   'separately': {
  \       '*': {},
  \       'tex': {
  \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \       },
  \       'lisp': {
  \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \       },
  \       'vim': {
  \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \       },
  \       'html': {
  \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \       },
  \       'css': 0,
  \   }
  \}
endif

" rainbow_parentheses.vim {
if layervim_core#PluginLoaded('junegunn/rainbow_parentheses.vim')
    augroup rainbow_lisp
        autocmd!
        autocmd FileType lisp,clojure,scheme RainbowParentheses
    augroup END
endif
" }


" asyncrun.vim {
if layervim_core#PluginLoaded('skywind3000/asyncrun.vim')
    nnoremap <F5> :call <SID>compile_and_run()<CR>
    augroup LAYERVIM_ASYNCRUN
        autocmd!
        autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
    augroup END
    function! s:compile_and_run()
        exec 'w'
        if &filetype == 'c'
            exec "AsyncRun! gcc % -o %<; time ./%<"
        elseif &filetype == 'cpp'
            exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
        elseif &filetype == 'java'
            exec "AsyncRun! javac %; time java %<"
        elseif &filetype == 'sh'
            exec "AsyncRun! time bash %"
        elseif &filetype == 'python'
            exec "AsyncRun! time python %"
        endif
    endfunction
endif
" }

if layervim_core#PluginLoaded('scrooloose/nerdcommenter')
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Add your own custom formats or override the defaults
  " let g:NERDCustomDelimiters = { 'c': { 'left': '//'} }
  nmap <Leader>;; <Plug>NERDCommenterToggle
  omap <Leader>;; <Plug>NERDCommenterToggle
  vmap <Leader>;; <Plug>NERDCommenterToggle
endif

" https://github.com/Chiel92/vim-autoformat#default-formatprograms
if layervim_core#PluginLoaded('Chiel92/vim-autoformat')
  let g:autoformat_autoindent = 0
  noremap <Leader>af :Autoformat<CR>
endif
