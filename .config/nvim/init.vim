call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

Plug 'Shougo/deoplete.nvim'

Plug 'Shougo/neosnippet.vim'

Plug 'Shougo/neosnippet-snippets'

Plug 'thinca/vim-quickrun'

Plug 'rhysd/vim-clang-format'

Plug 'kristijanhusak/vim-hybrid-material'

call plug#end()

"augroup filetype_rust
"    autocmd!
"    autocmd BufReadPost *.rs setlocal filetype=rust
"augroup END

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

let g:LanguageClient_serverCommands = {
            \ 'cpp': ['clangd', '-header-insertion=never'],
            \ }
"let $RUST_BACKTRACE = "full"
"let g:LanguageClient_loggingLevel = 'INFO'
"let g:LanguageClient_virtualTextPrefix = ''
"let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
"let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
let g:LanguageClient_loadSettings = 1
set completefunc=LanguageClient#complete

let g:deoplete#enable_at_startup = 1
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
imap <expr><TAB>
            \ pumvisible() ? "\<Down>" :
            \ neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" エンターキーでスニペット挿入or補完確定orポップアップ閉じる
imap <expr><CR>
            \ (pumvisible() && neosnippet#expandable()) ? "\<C-y>" :
            \ pumvisible() ? deoplete#close_popup() :"\<CR>"
"ユーザースニペットのやつ呼び出すコマンド長スギ
command Snip :NeoSnippetEdit
"スニペットの場所を指定
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#enable_complete_done = 1

"コマンドの変更{
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
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
" ESC連打でハイライト解除
nmap <silent><Esc><Esc> :nohlsearch<CR><Esc>
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

" tab{
" expandtabの設定をdeinの前に書かないといけないっぽいので仕方なくここ
" Tab文字の表示幅（スペースいくつ分）
set tabstop=4
"tabでソフトタブを入力
set expandtab
" Tabを入力したときに何文字の空白を入力するか
set softtabstop=4
" 自動インデント時の空白数
set shiftwidth=4
" 改行時に次の行のインデントを調整
set smartindent
"set autoindent
"}

set background=dark
colorscheme hybrid_material
"autocmd MyAutoCmd VimEnter * colorscheme hybrid
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

set splitbelow
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
"クリップボードから実行
nnoremap rr :QuickRun<Space>-input<Space>=@+<CR>
"インプットファイルを開く
nnoremap ri :vs<Space>input<CR>
"インプットファイルから実行
nnoremap re :QuickRun<Space>-input<Space>input<CR>
let g:quickrun_config.cpp = {
            \   'command': 'g++',
            \   'cmdopt': '-std=c++14',
            \   'outputter/buffer/split': '10'
            \ }
let g:quickrun_config.python = {
            \   'command': 'python3',
            \   'outputter/buffer/split': '10'
            \ }

set number
set backspace=indent,eol,start
set noswapfile
"set clipboard+=unnamed
set splitright
syntax enable
highlight clear SignColumn
nnoremap <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
let g:clang_format#auto_format = 1
let g:clang_format#style_options = {
            \ "BasedOnStyle" : "Google",
            \ "IndentWidth" : 4,
            \ "AllowShortFunctionsOnASingleLine" : "None",
            \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
