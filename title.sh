#!/bin/zsh
# vim: set filetype=zsh

# Terminal title updating for Zsh by haa
# At prompt, display current path name

[[ ! -z $DISPLAY ]] && {
        precmd () { 
        echo -n "\e]0;"
        # Enable on remote servers to show hostname:
        #print -Pn "%m: "

        print -Pn '%(!.# .)'        # Print # for root shell
        case "$PWD" in
        ??????????????????????????????????????????????????*)
                # Longer than 50, display "...endofpath"
                # Change nonprintable characters into '?'s
                echo -nE "...${(l:50:::::)PWD//[^[:print:]]/?}"
                ;;
        *)
                echo -nE "${PWD//[^[:print:]]/?}"
                ;;
        esac
        print -Pn " (%m)"
        echo -n "\007"
        }
        # When running, display commandline
        preexec () { 
        echo -n "\e]0;"
        # Enable on remote servers to show hostname:
        #print -Pn "%m: "
        print -Pn '%(!.# .)'        # Print # for root shell
        case "$1" in
        ??????????????????????????????????????????????????*)
                # Longer than 50, display "commandlinestart..."
                echo -nE "${(r:50:::::)1//[^[:print:]]/?}..."
                ;;
        *)
                echo -nE "${1//[^[:print:]]/?}"
                ;;
        esac
        print -Pn " (%m)"
        echo -n "\007"
        }

        # AddAlias by haa
        # addalias aliasname command with parameters you just ran
        addalias(){
                echo -n "Comment> "
                read comment
                name="$1"
                shift
                echo "alias $name=\"$*\"        # $comment" >> $HOME/.zshenv
                alias $name="$*"
        }
}
