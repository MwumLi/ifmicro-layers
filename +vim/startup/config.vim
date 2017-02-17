" vim-startify {
if layervim_core#PluginLoaded('mhinz/vim-startify')
    let g:startify_custom_header = [
                \'   _                                 _',
                \'  | | __ _ _   _  ___ _ __    __   _(_)_ __ ___',
                \'  | |/ _` | | | |/ _ \ |__|___\ \ / / |  _   _ \',
                \'  | | (_| | |_| |  __/ | |_____\ V /| | | | | | |',
                \'  |_|\__,_|\__, |\___|_|        \_/ |_|_| |_| |_|',
                \'           |___/',
                \'                  [ layer-vim ' . g:layervim_version . ' ＠' . v:version . ' ]',
                \]

    let g:startify_custom_footer = [
                \'',
                \'  layer-vim is maintained by MwumLi',
                \'  http://www.ifmicro.com'
                \]

    augroup SPACEVIM_START
        autocmd!
        autocmd VimEnter *
                    \   if !argc() && exists(':Startify')
                    \|      Startify
                    \|  endif
    augroup END

    let g:startify_list_order = [
                \ ['   My most recently used files'],
                \ 'files',
                \ ['   My most recently used files in the current directory:'],
                \ 'dir',
                \ ['   These are my sessions:'],
                \ 'sessions',
                \ ['   These are my bookmarks:'],
                \ 'bookmarks',
                \ ['   These are my commands:'],
                \ 'commands',
                \ ]

    let g:startify_bookmarks = [
                \'~/shared_folder/angular2/v2',
                \]
endif
" }

