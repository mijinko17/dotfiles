"必要:{
"python3,pyvimのインストール(deoplete用)
"clangdのインストール
"clang_formatのインストール
".dein.tomlと.dein_lazy.tomlをホームに置く
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
  let s:toml_file = expand('~/.config/nvim/dein').'/dein.toml'
  let s:toml_lazy_file = expand('~/.config/nvim/dein').'/dein_lazy.toml'
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:toml_lazy_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
"無いプラグインを自動インストール
if dein#check_install()
  call dein#install()
endif
"プラグインが変なときに呼ぶとどうにかなりがちなコマンド長スギ
command! Re call dein#recache_runtimepath()
"}

set number
set backspace=indent,eol,start
set noswapfile
set splitright
set breakindent breakindentopt=shift:2
set mouse=a
filetype plugin indent on
syntax enable
highlight clear SignColumn

" tab{
" Tab文字の表示幅（スペースいくつ分）
set tabstop=4
"tabでソフトタブを入力
set expandtab
" Tabを入力したときに何文字の空白を入力するか
set softtabstop=4
" 自動インデント時の空白数
set shiftwidth=4
" 改行時に次の行のインデントを調整
"set smartindent
"set autoindent
"}

"コマンドの変更{
nnoremap j gj
nnoremap k gk
" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;
"j連打でインサートを抜ける
inoremap <silent> jj <ESC>
inoremap <silent> ｊｊ <ESC>
"Ctrl+j連打でビジュアル抜ける
xnoremap <silent> <C-j><C-j> <ESC>
"o,O連打で空行挿入
noremap oo o<ESC>
noremap OO O<ESC>
"raで全選択＋クリップボードにヤンク
noremap ra ggvG$"+y
"insert中の移動
imap <C-u> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
" ESC連打でハイライト解除
nmap <silent><Esc><Esc> :noh
"}

" カッコ補完{
inoremap { {}<Left>
inoremap {<CR> {}<Left><CR><ESC><S-o>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap '' ''<Left>
inoremap "" ""<Left>
"}
