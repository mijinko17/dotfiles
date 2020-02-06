inoremap ; \
inoremap \ ;
inoremap $ $$<Left>
command! Cp :VimtexCompile
"command! Cq 
" Compile on initialization, cleanup on quit
augroup vimtex_event_1
  au!
  au User VimtexEventQuit     call vimtex#compiler#clean(0)
  au User VimtexEventInitPost :VimtexToggleMain
  au User VimtexEventInitPost call vimtex#compiler#compile()
augroup END
