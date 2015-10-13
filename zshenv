[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/dotfiles"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"
