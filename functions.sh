#!/bin/zsh
# vim: set filetype=zsh

cdl() { cd $1 && ls }

mkcd() { mkdir $1 && cd $1 }

rcd() { cd .. && rm -irfv $OLDPWD }

extract () {
  if [ $2 ] ; then
    echo "too many parameters to extract ()"
  elif [ -f "$1" ] ; then
    case $1 in
    *.tar.bz2|*.tbz2|*.tbz)   tar xjf $1 ;; # FIXME: make parallel with lbunzip2
    *.tar.gz|*.tgz)           tar xzf $1 ;;
    *.tar.xz|*.txz)           tar xJf $1 ;;
    *.tar)                    tar xf $1 ;;
    *.bz2)                    which lbunzip2 &>/dev/null \
                                && lbunzip2 -kn$((`grep "^processor" /proc/cpuinfo -c`+1)) $1 \
                                || bunzip2 -c $1 > ${1%.bz2} ;;
    *.gz)                     gunzip -c $1 > ${1%.gz} ;;
    *.xz)                     unxz -c $1 > ${1%.xz} ;;
    *.rar)                    unrar x $1 ;;
    *.zip)                    unzip $1 ;;
    #*.Z)                      uncompress $1 ;; # FIXME: test
    *.7z)                     7z x $1 ;;
    *)                        echo "I don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file"
    echo "Usage: extract file"
  fi
} 


pk () {
  if [ $3 ] ; then
    echo "too many parameters to pk ()"
  elif [ $1 ] ; then
    case $1 in
      t*b*z*)         tar cjvf $2.tar.bz2 $2 ;; # FIXME: make parallel with lbzip2
      t*g*z)          tar czvf $2.tar.gz  $2 ;;
      t*x*|t*J*)      tar cJvf $2.tar.xz  $2 ;;
      t*r)            tar cpvf $2.tar  $2 ;;
      b*z*)           which lbzip2 &>/dev/null \
                        && lbzip2 -9 -kn$((`grep "^processor" /proc/cpuinfo -c`+1)) $2 \
                        || bzip2 -9 -c $2 > $2.bz2 ;;
      g*z)            gzip -c -9 -n $2 > $2.gz ;;
      x*z)            xz -c -9 $2 > $2.xz ;;
      rar)            rar a $2.rar $2 -m5 ;;
      zip)            zip -9 -r $2.zip $2 ;;
      #Z)              ;; # FIXME: test
      7z)             7z -mx=9 a $2.7z $2 ;;
      *)              echo "'$1' cannot be packed via pk()" ;;
    esac
  else
    echo "Usage: pk tbz file"
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
