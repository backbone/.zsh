#!/bin/zsh
# vim: set filetype=zsh

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable svn hg git
zstyle ':vcs_info:*' disable-patterns "$HOME(/smb*|/.big/smb*)"

PROMPT=$'%B%{\e[0;$PROMPT_COLOR%}┌─[%{\e[0;$PROMPT_COLOR%}%n%{\e[0;$PROMPT_COLOR%}@%{\e[0;$HOST_COLOR%}%m%{\e[0;$PROMPT_COLOR%} (%T)]──(%{\e[0;33m%}%~%{\e[0;$PROMPT_COLOR%})\n└─[%{\e[0;39m%}%# %{\e[0;$PROMPT_COLOR%}>%b '
RPROMPT=$'$(vcs_info_wrapper)'
