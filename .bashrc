#PS1
PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]:\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

#aliases
alias ls='ls -G'
alias ll='ls -lG'
alias rm='rm -i'
alias mv='mv -i'

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