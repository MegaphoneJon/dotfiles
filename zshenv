export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/local/civix/:$HOME/local/wp-cli"
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME/dotfiles/zsh"
export VIMINIT='let $MYVIMRC="$HOME/dotfiles/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$HOME/dotfiles/vim"
export ZSH_CUSTOM="$HOME/dotfiles/oh-my-zsh/custom"
