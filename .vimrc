set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "カッコ入力時に対応するカッコを表示
syntax on "コードの色分け
set wildmenu "コマンドライン補完を便利に
set showcmd "タイプ途中のコマンドを画面下行に表示
set hlsearch "検索語を強調表示、<C-L>で解除"

" ---------
" NeoBundle
" ---------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'szw/vim-tags'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
"function! UniteRailsSetting()
"nnoremap <buffer><C-H><C-H><C-H> :<C-U>Unite rails/view<CR>
"nnoremap <buffer><C-H><C-H> :<C-U>Unite rails/model<CR>
"nnoremap <buffer><C-H> :<C-U>Unite rails/controller<CR>
"nnoremap <buffer><C-H>c :<C-U>Unite rails/config<CR>
"nnoremap <buffer><C-H>s :<C-U>Unite rails/spec<CR>
"nnoremap <buffer><C-H>m :<C-U>Unite rails/db -input=migrate<CR>
"nnoremap <buffer><C-H>l :<C-U>Unite rails/lib<CR>
"nnoremap <buffer><expr><C-H>g ':e '.b:rails_root.'/Gemfile<CR>'
"nnoremap <buffer><expr><C-H>r ':e '.b:rails_root.'/config/routes.rb<CR>'
"nnoremap <buffer><expr><C-H>se ':e '.b:rails_root.'/db/seeds.rb<CR>'
"nnoremap <buffer><C-H>ra :<C-U>Unite rails/rake<CR>
"nnoremap <buffer><C-H>h :<C-U>Unite rails/heroku<CR>
"endfunction
"aug MyAutoCmd
"au User Rails call UniteRailsSetting()
"aug END
"}}}

"------------------------------------
" neocomplete.vim
"------------------------------------
"use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"

"------------------------------------
" smartinput_endwise
"------------------------------------
call smartinput_endwise#define_default_rules()

"------------------------------------
" vim-indent-guides
"------------------------------------
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#f0f0f0 ctermbg=4
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

"------------------------------------
" vim-ctags
"------------------------------------
let g:vim_tags_project_tags_command = '/usr/bin/ctags --langmap=RUBY:.rb --exclude="*.js" --exclude=".git*" -R {OPTIONS} {DIRECTORY}'
let g:vim_tags_gems_tags_command = "/usr/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

"------------------------------------
" 全角スペースの可視化
"------------------------------------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" コマンドラインでTABで補完
set nocompatible
