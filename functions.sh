#!/bin/zsh
# vim: set filetype=zsh

cdl() { cd $1 && ls }

mkcd() { mkdir $1 && cd $1 }

rcd() { cd .. && rm -irfv $OLDPWD }

extract () {
 if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xjf $1        ;;
 *.tar.gz)    tar xzf $1     ;;
 *.tar.xz)    tar xJf $1     ;;
 *.bz2)       bunzip2 $1       ;;
 *.lbz2)      lbunzip2 -kn$((`grep "^processor" /proc/cpuinfo | wc -l`+1)) $1 ;;
 *.rar)       unrar x $1     ;;
 *.gz)        gunzip $1     ;;
 *.tar)       tar xf $1        ;;
 *.tbz2)      tar xjf $1      ;;
 *.tbz)       tar -xjvf $1    ;;
 *.tgz)       tar xzf $1       ;;
 *.txz)       tar xJf $1       ;;
 *.zip)       unzip $1     ;;
 *.Z)         uncompress $1  ;;
 *.7z)        7z x $1    ;;
 *)           echo "I don't know how to extract '$1'..." ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
} 


pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tgz)       tar cJvf $2.tar.xz  $2       ;;
 tar)       tar cpvf $2.tar  $2       ;;
 bz2)       bzip2 $2 ;;
 lbz2)      lbzip2 -kn$((`grep "^processor" /proc/cpuinfo | wc -l`+1)) $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 xz)        xz -c -9 $2 > $2.xz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
} 

calc() {
        echo $* | bc
}

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
