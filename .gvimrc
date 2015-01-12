syntax on
set guifont=MigMix1M\ 12
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set columns=100
set lines=30

" ToolBar-tabnew
tmenu ToolBar.tabnew New Tab
amenu ToolBar.tabnew :tabnew<CR>

" ToolBar-tabclose
tmenu ToolBar.tabclose Close Tab
amenu ToolBar.tabclose :close<CR>

"autocmd VimEnter * tab all
"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
