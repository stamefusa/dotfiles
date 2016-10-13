""""""""""""""""""""
" NeoBundle
""""""""""""""""""""
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'vim-scripts/yanktmp.vim'
"NeoBundle 'https://github.com/Shougo/neocomplcache.git'
"NeoBundle 'https://github.com/Shougo/unite.vim.git'
"NeoBundle 'https://github.com/ujihisa/unite-colorscheme.git'
"NeoBundle 'https://github.com/tpope/vim-fugitive.git'
"NeoBundle 'https://github.com/tpope/vim-surround.git'
"NeoBundle 'https://github.com/scrooloose/syntastic.git'
"NeoBundle 'https://github.com/Lokaltog/powerline.git'
"NeoBundle 'https://github.com/vim-scripts/yanktmp.vim.git'

" Colorscheme
"NeoBundle 'https://github.com/chriskempson/vim-tomorrow-theme.git'
NeoBundle 'chriskempson/vim-tomorrow-theme'

call neobundle#end()
filetype plugin indent on
filetype indent on
syntax on

NeoBundleCheck

""""""""""""""""""""
" user conf        "
""""""""""""""""""""
set number
set shiftwidth=4
set expandtab
set showmatch
set cindent
set incsearch
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start
set whichwrap=b,s,h,l,>,<,[,]
set ambiwidth=double
noremap!  

set termencoding=utf-8
set encoding=japan
set fileencodings=utf-8
set fenc=utf-8
set enc=utf-8

"colorscheme solarized 
"let g:solarized_termcolors=256
"colorscheme molokai
colorscheme Tomorrow-Night-Bright

syntax enable
set background=dark

"autocmd FileType php :set dictionary+=~/.vim/dict/php_functions.dict
"set complete+=k

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"scriptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

"""""""""""""""""""""""""""""
" Neocomplcache
"""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php'     : $HOME . '/.vim/dict/php.dict',
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"""""""""""""""""""""""""""""
" Unite.vim
"""""""""""""""""""""""""""""
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

"""""""""""""""""""""""""""""
" tmux
"""""""""""""""""""""""""""""
set t_Co=256
"set clipboard+=unnamed
"set clipboard+=autoselect

"""""""""""""""""""""""""""""
" yanktmp.vim
"""""""""""""""""""""""""""""
map <silent> oy :call YanktmpYank()<CR>
map <silent> op :call YanktmpPaste_p()<CR>
map <silent> oP :call YanktmpPaste_P()<CR>
