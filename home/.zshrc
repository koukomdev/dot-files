# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# Env
#
source /etc/profile
#source ~/.nvm/nvm.sh
#nvm use v0.10.25

#
# LANG
#
export LANG=ja_JP.UTF-8
#export LANG=ja_JP.eucJP
#export LANG=ja_JP.SJIS
export LESSCHARSET=UTF-8
export LC_ALL=$LANG

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# '#'以降をコメントとして扱う
setopt interactive_comments

## Default shell configuration
#
# set prompt
#
autoload colors
colors
setopt prompt_subst
case ${UID} in
0)
    PROMPT="[%{${fg[red]}%}%*%{${reset_color}%}] %n@%{${fg[yellow]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]')$ "
    RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="[%{${fg[red]}%}%*%{${reset_color}%}] %n@%{${fg[yellow]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]')$ "
    ;;
*)
    PROMPT="[%{${fg[red]}%}%*%{${reset_color}%}] %n@%{${fg[yellow]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]')$ "
    RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="[%{${fg[red]}%}%*%{${reset_color}%}] %n@%{${fg[yellow]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]')$ "
    ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
# 補完候補をできるだけ詰めて表示する
setopt list_packed
# 補完候補にファイルの種類も表示する
setopt list_types

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
#   to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^[P/^[N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[p" history-beginning-search-backward-end
bindkey "^[n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^T" history-incremental-pattern-search-forward

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
setopt share_history        # share command history data
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 単語移動
bindkey "^F" forward-word
bindkey '^B' backward-word

## Completion configuration
#
# 補完機能を有効にする
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit

compinit

# 補完候補を一覧で表示する(d)
setopt auto_list
# 補完キー連打で補完候補を順に表示する(d)
setopt auto_menu
# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete
# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補に色を付ける
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

#alias la="ls -a"
#alias lf="ls -F"
#alias ll="ls -l"
#alias du="du -h"
#alias df="df -h"
#alias su="su -l"

## alias
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g X='| xargs'

alias where="command -v"
alias j="jobs -l"
#alias ls="ls -G -w"
alias l=ls
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias l.="ls -d .*"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias ssh='ssh -o ServerAliveInterval=60'

# rbenv & bundle
alias re="rbenv exec"
alias be="bundle exec"
alias rebe="rbenv exec bundle exec"

# git
alias gco="git checkout"
alias gst="git status"
alias gci="git commit"
alias gdf="git diff"
alias gbr="git branch"
alias gad="git add"
alias glo="git log"
alias gps="git push"

case "${OSTYPE}" in
darwin*)
    alias updateports="sudo port selfupdate; sudo port outdated"
    alias portupgrade="sudo port upgrade installed"
    ;;
freebsd*)
    case ${UID} in
    0)
        updateports()
        {
            if [ -f /usr/ports/.portsnap.INDEX ]
            then
                portsnap fetch update
            else
                portsnap fetch extract update
            fi
            (cd /usr/ports/; make index)

            portversion -v -l \<
        }
        alias appsupgrade='pkgdb -F && BATCH=YES NO_CHECKSUM=YES portupgrade -a'
        ;;
    esac
    ;;
esac


## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
    export TERM=xterm-color
    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac

# for ssh-agent with screen/tmux
#
ssh_agent_init() {
    AGENT="$HOME/tmp/ssh-agent-$USER"

    if [ -S "$SSH_AUTH_SOCK" ]; then
        case $SSH_AUTH_SOCK in
            /tmp/*/agent.[0-9]*)
            ln -snf "$SSH_AUTH_SOCK" $AGENT && export SSH_AUTH_SOCK=$AGENT
    esac
    elif [ -S $AGENT ]; then
         export SSH_AUTH_SOCK=$AGENT
    else
         echo "no ssh-agent"
    fi
}

ssh() {
    ssh_agent_init

    /usr/bin/ssh "$@"
}

ssh_agent_init

## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
