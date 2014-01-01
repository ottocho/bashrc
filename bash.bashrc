# ottocho
# 2014.01.01

# do nothing if running noninteractively
[ -z "$PS1" ] && return

shopt -s checkwinsize

# set the PS1 and PS2 to hightlight the user
if [ `whoami` = 'root' ]
then
    export PS1='[root@\h:\w] \$ '
    # I hate motd
    echo 'hello world' > /etc/motd
else
    export PS1='\u@\h:\w \$ '
fi
export PS2='> '

alias ls='ls --color=auto'

# for error input
alias lsd='ls'
alias sl='ls'
alias sll='ls'
alias lss='ls'
alias sls='ls'
alias lls='ls'
alias lks='ls'
alias ks='ls'
alias ccd='cd'
alias cdd='cd'
alias cdc='cd'
alias vii='vim'
alias vmm='vim'
alias viim='vim'

# some more ls aliases
alias ll='ls -ahl'
alias la='ls -ha'
alias l='ls -aCF'
alias lt='ls -altFh'
alias lr='ls -alrtFh'

# quick access
alias now="date +'%Y.%m.%d %H:%M:%S'"
alias a='./a.out'
alias i='/sbin/ifconfig'
alias d='du -sh'
alias r='/usr/bin/env irb --simple-prompt'
alias py='python'
alias ipy='ipython'
alias cvt='cat -vt'
alias path='echo -e ${PATH//:/\\n}'
# alias df='df -kTh'
alias df='df -h'
alias vc='vim /etc/vim/vimrc'
alias vb='vim /etc/bash.bashrc'
alias .b='source /etc/bash.bashrc'
alias v='vim'

# quick cd
alias ..='cd ..'
alias ...='cd ../..'
alias cdx='cd ~-'

alias apc='cd /etc/httpd'
alias ngc='cd /etc/nginx'
alias www='cd /home/ottocho/www'

# service shortcut
alias aps='apachectl start'
alias apr='apachectl restart'
alias apt='apachectl stop'
alias ngs='nginx'
alias ngr='nginx -s reload'
alias ngt='nginx -s stop'

# backup the tmp file
alias clean='mv -f *~ *.bak /home/ottocho/bak 2>/dev/null'

# return the absoulte path
function ap() {
    if [[ $# -lt 1 ]]
    then
        echo "Usage: ap filenames"
        return 1
    fi
    for filename in $@
    do
        python -c "import os; print os.path.abspath('$filename');"
    done
}

# find the process
function pf() {
    if [[ $# -ne 1 ]]
    then
        echo "Usage: pf processname"
        return 1
    fi
    pname=$1
    ps -ef | grep -i $pname | grep -v 'grep'
}

# mkdir and cd into the new dir
function mkcd() {
    if [[ $# -ne 1 ]]
    then
        echo "Usage: mkcd dirname"
        return 1
    fi
    dirname=$1
    mkdir $dirname && cd $dirname
}

# uncomment the file
function uc() {
    if [[ $# -ne 1 ]]
    then
        echo "Usage: uc textfile"
        return 1
    fi
    textfile=$1
    cat $textfile | grep -v '^[\t ]*#\|^[\t ]*$'
}

export PATH=$PATH:/home/ottocho/bin

# dangerous operations
alias rm='srm'
alias rr='/bin/rm'
alias cp='cp -i'
alias mv='mv -i'

# quickly change the locale
# make a utf8 setting in /etc/profile.utf8
# and a gb18030 setting in /etc/profile.gb18030
alias gb='export LANG="en_US.GB18030" && echo "LANG=${LANG}"'
alias utf='export LANG="en_US.UTF8" && echo "LANG=${LANG}"'

# for lisp use
alias clisp='clisp -q'
alias lisp='clisp -q'

alias apll='aptitude install'

alias xpy='chmod +x *.py'

alias db='mysql -uroot -ptest test'

source /etc/profile.d/rvm.sh
