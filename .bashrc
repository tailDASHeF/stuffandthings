#PS1
PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]:\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

#aliases
alias ls='ls --color' # change --color to -G on macOS
alias ll='ls -l' # change --color to -G on macOS
alias rm='rm -i'
alias mv='mv -i'
alias vi='vim'

# enable forward i-search history search
stty -ixon

#bcrc
export BC_ENV_ARGS=$HOME/.bcrc
export HISTCONTROL=ignoredups

#ssh-agent stuff
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

ssh-add -l | grep -i rsa
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "ssh-key already in keyring"
else
  echo "ssh-key not in keyring"
  ssh-add
fi

#colorized man
export GROFF_NO_SGR=yes
man() {
   env \
       LESS_TERMCAP_mb=$(printf "\e[1;31m") \
       LESS_TERMCAP_md=$(printf "\e[1;31m") \
       LESS_TERMCAP_me=$(printf "\e[0m") \
       LESS_TERMCAP_se=$(printf "\e[0m") \
       LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
       LESS_TERMCAP_ue=$(printf "\e[0m") \
       LESS_TERMCAP_us=$(printf "\e[1;32m") \
           man "$@"
}
