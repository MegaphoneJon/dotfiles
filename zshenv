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

if [ -e /home/jon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jon/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}
# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}
