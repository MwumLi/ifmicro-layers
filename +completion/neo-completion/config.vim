if g:layervim_nvim
  execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/deoplete-config.vim'
else
  execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/neocomplete-config.vim'
endif

if layervim_core#PluginLoaded('Shougo/neosnippet')
  " auto select first
  if g:layervim_nvim
    let g:deoplete#enable_auto_select = 1
  else
    let g:neocomplete#enable_auto_select = 1
  endif

  " pumvisible()  =>  判断是否有匹配弹窗
  " neosnippet#expandable() ==> 判断是否可以是 snip 扩展
  function! CleverTab()
      let substr = strpart(getline('.'), 0, col('.') - 1)
      let substr = matchstr(substr, '[^ \t]*$')
      if strlen(substr) == 0
          " nothing to match on empty string
          return "\<Tab>"
      else
          " existing text matching
          if neosnippet#expandable_or_jumpable()
              return "\<Plug>(neosnippet_expand_or_jump)"
          else
              return "\<Tab>"
          endif
      endif
  endfunction

  imap <expr> <Tab> CleverTab()

  " function! CleverCr()
  "     if pumvisible()
  "         if neosnippet#expandable()
  "             let exp = "\<Plug>(neosnippet_expand)"
  "             return exp . neocomplete#smart_close_popup()
  "         else
  "             return neocomplete#smart_close_popup()
  "         endif
  "     else
  "         return "\<CR>"
  "     endif
  " endfunction

  " " <CR> close popup and save indent or expand snippet
  " imap <expr> <CR> CleverCr()

endif

