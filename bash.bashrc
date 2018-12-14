## bash.bashrc
#
# ottocho
# 2017.11.07
#
# Usage: global bash config `/etc/bash.bashrc`
# Compatibility: Debian
#

###############################################################################
# Basic
###############################################################################

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

# always import local toolkit
export PATH=$PATH:/home/ottocho/bin

# import local command
LOCALCMD='/home/ottocho/.bashrc_cmd'
if [ -f $LOCALCMD ]
then
    source $LOCALCMD
fi

# ls color
alias ls='ls --color=auto'

# typo
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
# alias v='vim'  #  v for vmware
alias vi='vim'
alias vii='vim'
alias vmm='vim'
alias viim='vim'
alias vo='vim -O'

# some more ls aliases
alias l='ls -aCF'
alias ll='ls -aFhlt'
alias la='ls -aFh'
alias lt='ls -aFhlt'
alias lr='ls -aFhlrt'

# quick access
alias now="date +'%Y-%m-%d %r'"
alias i='/sbin/ifconfig'
alias d='du -sh'
alias cvt='cat -vt'
alias path='echo -e ${PATH//:/\\n}'
alias df='df -h'

# quick config vim/bash
alias vc='vim ~/.vimrc'
alias vb='vim /etc/bash.bashrc'
alias .b='source /etc/bash.bashrc'

# quick cd
alias ..='cd ..'
alias ...='cd ../..'
alias cdx='cd ~-'

# quickly change the locale
# make a utf8 setting in /etc/profile.utf8
# and a gb18030 setting in /etc/profile.gb18030
alias gb='export LANG="en_US.GB18030" && echo "LANG=${LANG}"'
alias utf='export LANG="en_US.UTF8" && echo "LANG=${LANG}"'

# return the absoulte path
function ap() {
    if [[ $# -lt 1 ]]
    then
        echo "Usage: ap filenames"
        return 1
    fi
    for filename in $@
    do
        python3 -c "import os; print(os.path.abspath('$filename'));"
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

###############################################################################
# Dangerous Operations
###############################################################################

alias rm='srm'
alias binrm='/bin/rm -i'
alias cp='cp -i'
alias mv='mv -i'

# backup the tmp file
alias clean='mv -f *~ *.bak /home/ottocho/bak 2>/dev/null'

###############################################################################
# Appliation Operations
###############################################################################

# apache shortcut
alias aps='sudo systemctl start apache2.service'
alias apr='sudo systemctl restart apache2.service'
alias apt='sudo systemctl stop apache2.service'
alias apc='cd /etc/apache2'

# nginx shortcut
alias ngs='nginx'
alias ngr='nginx -s reload'
alias ngt='nginx -s stop'
alias ngc='cd /usr/local/nginx/conf'

# quick static serve
alias serve='python3 -m http.server'

###############################################################################
# Python
###############################################################################

# quick access python and ipython
function py() {
    if [[ $# -eq 0 ]]
    then
        ipython --no-confirm-exit --classic --pprint
        return 0
    else
        python $@
        return 0
    fi
}

alias xpy='chmod +x *.py'
alias cpyc="find . -name '*pyc' -exec rm -rf {} \;"
alias ipy='ipython --no-confirm-exit --classic --pprint'
alias activate='source bin/activate'

###############################################################################
# Lisp
###############################################################################

# for lisp use
alias clisp='clisp -q'
alias lisp='clisp -q'

###############################################################################
# Ruby
###############################################################################

# for ruby
alias cr='cd /home/ottocho/src/rb/'
alias r='/usr/bin/env irb --simple-prompt'


###############################################################################
# Snippet
# commands used frequently without alias
###############################################################################

## to exclude annoying `node_modules`
# grep --exclude-dir=node_modules --regexp='reg pattern like ^# +' -rl FILE
# find . -path '*node_modules*' -prune -o -name 'shell pattern here like *.js' -print
## watch command output change
# watch -d -n 1 date


