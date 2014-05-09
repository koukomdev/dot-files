# 色を使用出来るようにする
autoload -Uz colors
colors
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

alias ls='ls -v'

# 補完機能を有効にする
autoload -U compinit; compinit
# 補完候補を一覧で表示する(d)
setopt auto_list
# 補完キー連打で補完候補を順に表示する(d)
setopt auto_menu
# 補完候補をできるだけ詰めて表示する
setopt list_packed
# 補完候補にファイルの種類も表示する
setopt list_types
# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete
# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#PROMPT
setopt prompt_subst
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

HOSTNAME=`hostname`
PROMPT="[%{${fg[red]}%}%*%{${reset_color}%}] %n@%{${fg[yellow]}%}${HOSTNAME}%{${reset_color}%}$ "

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 単語移動
bindkey "^F" forward-word
bindkey '^B' backward-word

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# 環境変数
export LANG=ja_JP.utf8
export LESSCHARSET=utf-8

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# ^R で履歴検索をするときにワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# vim:set ft=zsh :
