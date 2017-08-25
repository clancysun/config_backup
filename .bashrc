# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


###############################################################################
#
# User specific aliases and functions
#
###############################################################################


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/^* \(.*\)/(\1)/'
}

export PS1="\[\e[01;37m\]\A\[\e[0m\]\[\e[00;37m\] [\[\e[0m\]\[\e[01;35m\]\u\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;36m\]\w\[\e[0m\]\[\e[00;37m\]\[\e[01;31m\]\$(parse_git_branch)\[\e[0m\]\[\e[00;37m\]] \\$ \[\e[0m\]"
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/games:/usr/games:~/.local/bin:~/bin

export JAVA_HOME="/usr/java/latest"
export GPG_TTY=$(tty)

if [ -n "$DISPLAY" ]; then
    export TERM=xterm-256color
fi

tmux_init() {
    # 开启一个会话
    tmux new-session -s "work" -d -n "htop" "htop"
    # 开启一个横屏
    #tmux split-window -v
    # 开启一个竖屏
    #tmux split-window -h
    # 开启一个窗口
    tmux new-window -n "bash" 
    # tmux -2强制启用256color，连接已开启的tmux
    tmux -2 attach-session -d
}

## Always work in a tmux session if tmux is installed
#if which tmux 2>&1 >/dev/null; then
#  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#    test -z "$TMUX" && (tmux attach || tmux_init)
#  fi
#fi

# update git
gup ()
{
    local mymessage="next update";

    # if $1 not zero length
    if [ ! -z "$1" ]; then
        mymessage=$1
    fi 

    git add .
    git commit -m "$mymessage"
    git push
}

# Remap Caps Lock key for X windows
if [[ -r $HOME/.xmodmap && "$TERM" == "xterm-256color" ]]; then
    /usr/bin/xmodmap -display :0 $HOME/.xmodmap
fi

# Remap Caps Lock key for virtual console windows
#(echo `dumpkeys | grep -i keymaps`; echo keycode 58 = Control) | loadkeys -

# 清屏
bind -m vi-insert '\C-l':clear-screen

# 切换到vi命令模式
set -o vi
bind -m vi-insert '\C-j':vi-movement-mode

# Run shadowsocks proxy
if [ -f "~/.bwg.json" ]; then
    if [[ ! `netstat -ano | grep ":1080"` ]]; then
        /usr/bin/sslocal -c ~/.bwg.json &
    fi
fi

# Run screenfetch
if [ -f "/usr/bin/screenfetch" ]; then
    screenfetch
fi
