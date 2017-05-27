#if bashrc exists, source it.

if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

#osx specific alias for homebrew and whatnot
alias cal="gcal"
