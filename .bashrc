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

# Setting Bash prompt.
RED="\[\033[1;31m\]"
GREEN="\[\e[32;1m\]"
BLUE="\[\e[34;1m\]"
OFF="\[\033[m\]"

# export PS1="[\t] [\u@\h:\w] [\s] \\$ "
export PS1="[\t] [${RED}\u${OFF}@${GREEN}\h${OFF}:${BLUE}\w${OFF}] [\s] \n\\$ "

# 打开终端的文字颜色
export CLICOLOR="true"

if [ -n "$DISPLAY" ]; then
    export TERM=xterm-256color
fi

# export JAVA_HOME JDK/JRE
export JAVA_HOME="/usr/java/latest"

# 每次登录进入到tmux
tmux_init() {
    # 开启一个会话
    tmux new-session -s "work" -d -n "local" "htop"
    # 开启一个横屏
    #tmux split-window -v
    # 开启一个竖屏
    #tmux split-window -h
    # 开启一个窗口
    tmux new-window -n "local"
    # tmux -2强制启用256color，连接已开启的tmux
    tmux -2 attach-session -d
}

## 判断是否已有开启的tmux会话，没有则开启
#if which tmux 2>&1 >/dev/null && [ "$TERM" == "xterm-256color" ]; then
#    test -z "$TMUX" && (tmux attach || tmux_init)
#fi

# 键盘映射
if [[ -r $HOME/.xmodmap && "$TERM" == "xterm-256color" ]]; then
    /usr/bin/xmodmap -display :0 $HOME/.xmodmap
fi

# 将命令追加到 history 中
shopt -s histappend

# 在显示命令提示符时，保存 history
PROMPT_COMMAND='history -a'

# Run shadowsocks proxy
if [[ ! `netstat -ano | grep ":1080"` ]] ; then
    /usr/bin/sslocal -c /home/clancy/.shadowsocks.json &
fi

# 清屏
bind -m vi-insert '\C-l':clear-screen

# 切换到vi命令模式
set -o vi
bind -m vi-insert '\C-j':vi-movement-mode

# 命令别名
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -al'
alias k='exit'
alias pc="proxychains4"
alias ubuntu='ssh -p '22222' clancy@localhost'
