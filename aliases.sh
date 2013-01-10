#!/bin/zsh
# vim: set filetype=zsh

# list dir operations
alias ls='ls --classify --color --human-readable --group-directories-first'
alias la='ls -a'
alias ll='ls -l'
alias l='ll'
alias lh='ls -h'
alias lla='ls -la'
alias llh='ls -lh'
alias llah='ls -lah'
alias llha='llah'
alias fls="fls -rd" 

# file operations
alias cp='nocorrect cp --verbose --preserve=all'
alias mv='nocorrect mv --verbose'
alias rm='nocorrect rm -v'
alias ln='ln -vi'
alias chmod='chmod -v'
alias chown='chown -v'
alias chgrp='chgrp -v'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'

# fs statistics
alias df='df -hT'
alias dfm='df -mT'
alias fs='du -shcx (|.)* | sort -h'
alias du='du --human-readable --total'

# process operations
alias nohup='nohup > /dev/null $1'
alias k='killall' 
which sudo &>/dev/null && alias sk='sudo killall'

# autofixing
alias cd..='cd ..'
alias cd~='cd ~'
alias cd-='cd -'
 
alias v='vim'
which sudo &>/dev/null && alias sv='sudo vim'

alias grep='grep --color=always'

which grc &>/dev/null && {
    alias grc='grc --colour=auto'
    alias ping='grc ping'
    alias last='grc last'
    alias netstat='grc netstat'
    alias traceroute='grc traceroute'
    alias make='grc make'
    alias gcc='grc gcc'
    alias configure='grc ./configure'
    alias configure='grc configure'
    alias netstat='grc netstat'
    alias ping='grc ping'
    alias cat="grc cat"
    alias tail="grc tail"
    alias head="grc head" 
}

alias killall="killall --interactive --verbose"

alias free="free -t -m"

which git &>/dev/null && alias git="nocorrect git"
which hg &>/dev/null && alias hg="nocorrect hg"

which scrot &>/dev/null && alias scrot="scrot --border --count --quality 75 $HOME'/screenshots/%d-%b-%y_%H-%M-%S_\$wx\$h.png' --exec 'du -h \$f'"

which sudo &>/dev/null && alias su='sudo su -'
which hd &>/dev/null && alias hd='hexdump -C'
which sudo &>/dev/null && alias krnlconfig="sudo make MENUCONFIG_MODE=single_menu MENUCONFIG_COLOR=mono menuconfig"
which valgrind &>/dev/null && alias valgrind='valgrind --tool=callgrind'
which cgdb &>/dev/null && alias cgdb='LANG=ru_RU.koi8-r cgdb'
which rsync &>/dev/null && alias cpb='rsync --progress -h' \
                        && alias cpbs='rsync --progress -h -rax --delete-excluded'
which alsamixer &>/dev/null && alias alsamixer='alsamixer -g' && alias equilizer='alsamixer -D equal'
[ -x /usr/libexec/mc/mc-wrapper.sh ] && alias mc='. /usr/libexec/mc/mc-wrapper.sh -x'
which network.sh &>/dev/null && alias net='network.sh'
which colordiff &>/dev/null && alias diff='colordiff'
alias make="make -j$((`getconf _NPROCESSORS_ONLN`+1))"
which colormake &>/dev/null && alias make="colormake -j$((`getconf _NPROCESSORS_ONLN`+1))"
which colorgcc &>/dev/null && {
	alias c++='/usr/lib/colorgcc/bin/c++'
	alias cc='/usr/lib/colorgcc/bin/cc'
	alias g++='/usr/lib/colorgcc/bin/g++'
	alias gcc='/usr/lib/colorgcc/bin/gcc'
}
which astyle &>/dev/null && {
  alias astyle-glib='astyle --style=gnu --indent=spaces=2 --max-instatement-indent=80 \
                     --indent-preprocessor --indent-col1-comments --break-blocks=all \
                     --pad-oper --pad-header --break-closing-brackets --add-brackets'
}
which network-profile.sh &>/dev/null && alias net=network-profile.sh
