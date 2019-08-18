"必要；{
"python3,pyvimのインストール(deoplete用)
".dein.tomlと.dein_lazy.tomlをホームに置く
"}

set number
set backspace=indent,eol,start
set noswapfile
"set clipboard+=unnamed
set splitright
syntax enable


"コマンドの変更{
inoremap <silent> jj <ESC>
inoremap <silent> ｊｊ <ESC>
noremap oo o<ESC>
noremap OO O<ESC>
imap <C-f> <Right>
noremap ra ggvG"+y
"}

" tab{
" Tab文字の表示幅（スペースいくつ分）
set tabstop=4
" Tabを入力したときに何文字の空白を入力するか
set softtabstop=4
" 自動インデント時の空白数
set shiftwidth=4
" 改行時に次の行のインデントを調整
set smartindent

set autoindent
"}

" カッコ補完{
inoremap { {}<Left>
inoremap {<CR> {}<Left><CR><ESC><S-o>
inoremap ( ()<Left>
"中括弧エンターみたいな挙動にしたいが同じ方法ではうまくいかないので仕方なくこうしている
inoremap (<CR> (<CR><BS><BS>)<ESC><S-o><BS>
inoremap [ []<Left>
inoremap '' ''<Left>
inoremap "" ""<Left>
"}

"dein{
"dein自体の自動インストール
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
  let s:toml_lazy_file = fnamemodify(expand('<sfile>'), ':h').'/.dein_lazy.toml'
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:toml_lazy_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
"なぜかここに書かないとシンタックスハイライトが効かない
filetype plugin indent on
"無いプラグインを自動インストール
if dein#check_install()
  call dein#install()
endif
"プラグインが変なときに呼ぶとどうにかなりがちなコマンド長スギ
command! Recache call dein#recache_runtimepath()
"}
