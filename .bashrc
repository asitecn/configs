# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

parse_git_branch () {
git branch 2>/dev/null | grep '^*' | colrm 1 2 | sed 's/^/(/' | sed 's/$/)/'
}

#source ~/git_ps1
if [ "x$YROOT_NAME" != "x" ]; then
#PS1="\n[\h:$YROOT_NAME \t (\$(parse_git_branch))]\$ "
export PS1="\e[0;32m\u@localhost\e[m \e[0;33m\W \$(parse_git_branch)\$ \e[m"
else
#PS1="\n[\h \t (\$(parse_git_branch))]\$ "
export PS1="\e[0;32m\u@localhost\e[m \e[0;33m\W \$ \e[m"
fi

# User specific aliases and functions

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./yell/lib64:./internetlocality/lib64
cd /home/guoqiang/repository/guoqiang/keyword
yroot scratch
