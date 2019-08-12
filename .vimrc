".dein.tomlをホームディレクトリに置いてvimを起動すると大体どうにかなる

set number
set backspace=indent,eol,start
set noswapfile
"set clipboard+=unnamed

"コマンドの変更{
inoremap <silent> jj <ESC>
noremap o o<ESC>
"}

"dein{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
"ロード時のあれ
let &runtimepath = s:dein_repo_dir .",". &runtimepath
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
  call dein#load_toml(s:toml_file)
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
"}
