# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/clancy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="xiong-chiamiov-plus"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export JAVA_HOME="/usr/java/latest"
export GPG_TTY=$(tty)

#if [ -n "$DISPLAY" ]; then
#    export TERM=xterm-256color
#fi

# Remap Caps Lock key for X windows
if [[ -r $HOME/.xmodmap && "$TERM" == "xterm-256color" ]]; then
    /usr/bin/xmodmap -display :0 $HOME/.xmodmap
fi

# Remap Caps Lock key for virtual console windows
#(echo `dumpkeys | grep -i keymaps`; echo keycode 58 = Control) | loadkeys -

function tmux_init() {
    # 开启一个会话
    tmux new-session -s "work" -d -n "htop" "htop"
    # 开启一个窗口
    tmux new-window -n "zsh"
    # tmux -2强制启用256color，连接已开启的tmux
    tmux -2 attach-session -d
}

# Always work in a tmux session if tmux is installed
#if which tmux 2>&1 >/dev/null; then
#  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#    test -z "$TMUX" && (tmux attach || tmux_init)
#  fi
#fi

# update git
function gupdate () {
    local mymessage="Standard commit.";

    # if $1 not zero length
    if [ ! -z "$1" ]; then
        mymessage=$1
    fi

    git add .
    git commit -m "$mymessage"
    git push
}

function calc() { echo "$*" | bc -l; }
function upto() { cd "${PWD/\/$@\/*//$@}" }
function lower() { echo ${@,,};}
function upper() { echo ${@^^};}

# 切换到vi命令模式
set -o vi
bindkey "^J" vi-cmd-mode
# 按三次Esc进入vi的命令模式
bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# 在命令行输入字符之后，可以用方向键Up，Down来搜索以该串字符开头的历史命令。
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# 设定push-line快捷键<Ctrl-K>
bindkey -N newmap viins
bindkey -M newmap '^K' push-line
bindkey -A newmap main

# 当我敲入 mvn 后，按ctrl-x两次会列出所有mvn开头的命令，然后可以通过输入序号来执行那一次的命令了。
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

setopt AUTO_CD

# Run shadowsocks proxy
if [ -f "$HOME/.bwg.json" ]; then
    if [[ ! `netstat -ano | grep ":1080"` ]]; then
        /usr/bin/sslocal -c ~/.bwg.json &
    fi
fi

# Run screenfetch
if [ -f "/usr/bin/screenfetch" ]; then
    screenfetch
fi
