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
    *.tar.bz2|*.tbz2|*.tbz)   which lbunzip2 &>/dev/null \
                                && lbunzip2 -c -kn$((`getconf _NPROCESSORS_ONLN`+1)) $1 | tar xf - \
                                || tar xjf $1 ;;
    *.tar.gz|*.tgz)           tar xzf $1 ;;
    *.tar.xz|*.txz)           tar xJf $1 ;;
    *.tar)                    tar xf $1 ;;
    *.bz2)                    which lbunzip2 &>/dev/null \
                                && lbunzip2 -kn$((`getconf _NPROCESSORS_ONLN`+1)) $1 \
                                || bunzip2 -k $1 ;;
    *.gz)                     gunzip -c $1 > ${1%.gz} || rm -f ${1%.gz} ;;
    *.xz)                     unxz -k $1 ;;
    *.rar)                    unrar x $1 ;;
    *.zip)                    unzip $1 ;;
    #*.Z)                      uncompress $1 ;;
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
      t*b*z*)         tar cjvf $2.tar.bz2 $2 ;;
      t*g*z)          tar czvf $2.tar.gz  $2 ;;
      t*x*|t*J*)      tar cJvf $2.tar.xz  $2 ;;
      t*r)            tar cpvf $2.tar  $2 ;;
      b*z*)           which lbzip2 &>/dev/null \
                        && lbzip2 -9 -kn$((`getconf _NPROCESSORS_ONLN`+1)) $2 \
                        || bzip2 -9 -k $2 ;;
      g*z)            gzip -c -9 -n $2 > $2.gz || rm -f $2.gz ;;
      x*z)            xz -k -9 $2 ;;
      rar)            rar a $2.rar $2 -m5 -ol ;;
      zip)            zip -9 --symlinks -r $2.zip $2 ;;
      #Z)              ;;
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
