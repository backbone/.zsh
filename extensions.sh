#!/bin/zsh
# vim: set filetype=zsh

# file extensions
[[ -z $DISPLAY ]] && {
        alias -s {jpg,jpeg,bmp,gif,png,svg,xbm,psd}="fbi"
        alias -s {avi,mpeg,mpg,3gp}="mplayer"
        alias -s {html,htm}="links -g"
        alias -s {pdf}=apvlv
        alias -s {txt,lst}="cat"
} || {
        alias -s {jpg,jpeg,bmp,gif,png,svg}="nohup &>/dev/null gqview"
        alias -s {pdf,djvu}="nohup &> /dev/null evince"
        which gnome-mplayer &>/dev/null && alias -s {avi,mpeg,mpg,3gp}="nohup &>/dev/null gnome-mplayer" ||  alias -s {avi,mpeg,mpg,3gp}="nohup &>/dev/null mplayer"
        alias -s {odt,doc,sxw,rtf,odf,xls,ppt}="nohup &> /dev/null soffice"
        alias -s {html,htm}="firefox"
        alias -s {txt,lst}="cat"
        alias -s exe="wine"
}

alias -s {wav,mp3,ogg}="alsaplayer"

autoload -U pick-web-browser
alias -s {html,htm,xhtml}=pick-web-browser
