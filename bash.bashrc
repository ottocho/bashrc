
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

# some more ls aliases
alias ll='ls -al'
alias la='ls -a'
alias l='ls -aCF'
alias lt='ls -altFhi'
alias lr='ls -alrtFhi'

# quick access
alias now="date +'%Y.%m.%d %H:%M:%S'"
alias a='./a.out'
alias i='/sbin/ifconfig'
alias d='du -sh'
alias r='/usr/bin/irb --simple-prompt'
alias py='python'
alias cvt='cat -vt'
alias path='echo -e ${PATH//:/\\n}'
alias df='df -kTh'


# quick cd 
alias ..='cd ..'
alias ...='cd ../..'
alias cdx='cd ~-'
alias www='cd /home/www/'

# vim cmd
alias v='vim -R'
alias vf='vimdiff'

# dangerous operations 
alias cp='cp -i'
alias mv='mv -i'

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
    mkdir $dirname
    cd $dirname
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

alias apc='cd /etc/apache2'
alias apr='apachectl restart'
alias apl='cd /home/www/log'

alias ngc='cd /etc/nginx'
alias ngr='service nginx restart'
alias ngl='cd /home/www/log'

alias myc='cd /etc/mysql'
alias myr='service mysql restart'
alias myl='cd /var/lib/mysql'
alias ww='cd /home/www'

alias rm='echo use rmrm instead'
alias rmrm='/bin/rm -i'
alias t='tail -f'
