export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/local/civix/:$HOME/local/wp-cli"
if [ "$HOSTNAME" = zabuntu ]; then
  export PATH="$HOME/local/bin:$PATH"
fi
if [ "$HOSTNAME" = aeroplane ]; then
  export PATH="$HOME/local/bin:$HOME/local/civicrm-buildkit/bin:$PATH"
fi
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME/dotfiles/zsh"
export VIMINIT='let $MYVIMRC="$HOME/dotfiles/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$HOME/dotfiles/vim"
export ZSH_CUSTOM="$HOME/dotfiles/oh-my-zsh/custom"
alias fd=fdfind
alias find='echo "use fd instead"'
