if g:layervim_vim8 || g:layervim_nvim
    Plugin 'w0rp/ale'
else
    Plugin 'scrooloose/syntastic',     { 'on': 'SyntasticCheck' }
endif
