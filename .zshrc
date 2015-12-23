# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sia/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
#ディレクトリ移動のオートプッシュ
setopt auto_pushd
setopt pushd_ignore_dups
#コマンド訂正
setopt correct

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
	alias emacs='TERM=xterm-256color emacs23'
	alias gvim='gvim -f'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

source /etc/zsh_command_not_found

export PATH="$HOME/.rbenv/bin:$PATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:"$PYTHONPATH
eval "$(rbenv init -)"

# for android studio
export PATH="$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:$PATH"
# byobuの設定
#if [ $SHLVL = 1 ];then
#  byobu
#fi

# hub
# eval "$(hub alias -s)"
# fpath=($HOME/.zsh/myfunc $fpath)

# go
# export GOROOT="/usr/local/go"
export GOPATH="$HOME/.go/1.5.1/"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

alias adb="~/Android/Sdk/platform-tools/adb"
