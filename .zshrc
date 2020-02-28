alias ls='ls -alFG'
alias nv='nvim' 
alias g++='g++-9' 
alias gs='git status' 
alias re='exec $SHELL -l' 

# 補完機能を有効にする
autoload -Uz compinit
compinit -u

# 色を使用出来るようにする
autoload -Uz colors
colors

# 大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
 
#プロンプト周り{{
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "∗"
zstyle ':vcs_info:git:*' unstagedstr " +"
zstyle ':vcs_info:*' formats '(%b%c%u)'
zstyle ':vcs_info:*' actionformats '(%b|%a %c%u)'
 
precmd () { vcs_info }
 
setopt PROMPT_SUBST ; PS1='%n@%m %c %F{red}${vcs_info_msg_0_}%f
%% '
# }}
