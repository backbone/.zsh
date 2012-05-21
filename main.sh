#!/bin/zsh
# vim: set filetype=zsh

umask 002

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle :compinstall filename "/home/$USER/.zsh/.zshrc"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:history-words:*:history-words' stop yes
zstyle ':completion:history-words:*:history-words' list no
zstyle ':completion:history-words:*' remove-all-dups yes
zstyle ':completion:history-words:*' menu yes

autoload -Uz compinit
compinit
setopt appendhistory sharehistory autocd beep extendedglob nomatch notify

zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false

zstyle ':completion:*:processes-names' command 'ps xho command'

setopt correctall
setopt noflowcontrol

# history
setopt hist_allow_clobber
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt extended_history
setopt inc_append_history

unsetopt equals

alias stderred="LD_PRELOAD=/usr/lib/stderred.so"
alias stderred32="LD_PRELOAD=/usr/lib32/stderred.so"
