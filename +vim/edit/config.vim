" tpope/vim-surround {
  " https://github.com/tpope/vim-surrounda
  " From String: "Hello World!"
  " cs"' => 'Hello World!'
  " cs'<q> => <q>Hello World!</q>
  " cst" => "Hello World!"
  " ds" => Hello World!
  " ysiw] => [Hello] World!      (cursor above Hello)
  " cs] { => { Hello } World!    (Let's make that braces and add some space)
  " yssb or yss) => ({ Hello } World!)  wrap the entire line in parentheses 
  " ds{ds) => Hello World!
  " ysiw<em> => <em>Hello</em> World!
  " VS<p class="important">    (行可视化模式)
  " <p class="important">
  "   <em>Hello</em> world!
  " </p>
  "
" }
if layervim_core#PluginLoaded('terryma/vim-multiple-cursors')
    " Usage: https://github.com/terryma/vim-multiple-cursors/wiki/Keystrokes-for-example-gifs
    " Default mapping
    " By default, the 'next' key is also used to enter multicursor mode
    " Press 'c' to enter edit mode
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    " Default highlighting (see help :highlight and help :highlight-link)
    highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
    highlight link multiple_cursors_visual Visual

	" if you are using Neocomplete, add this to your vimrc to prevent conflict:
	" Called once right before you start selecting multiple cursors
	function! Multiple_cursors_before()
      iunmap <C-j>
	  if exists(':NeoCompleteLock')==2
		exe 'NeoCompleteLock'
	  endif
	endfunction

	" Called once only when the multiple selection is canceled (default <Esc>)
	function! Multiple_cursors_after()
      inoremap <C-j> <Down>
	  if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	  endif
	endfunction
endif
