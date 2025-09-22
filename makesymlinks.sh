#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# Install oh-my-zsh
if [[ -z "$ZSH" || ! -f "$ZSH/oh-my-zsh.sh" ]]; then
  curl --output ./oh-my-zsh-install.sh -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
  #Not sure what this does, and suspect it's broken because what is "no" doing there?
  #env RUNZSH=no sh ./oh-my-zsh-install.sh
fi
dir=~/dotfiles                    # dotfiles directory

olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vim ptrrc gitconfig profile selected_editor zshenv"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
# FIXME: $HOSTCOLOR is set in the theme to 032 for my local laptops. That's a bit hacky.
if [[ "$HOSTCOLOR" == "032" ]]; then
  ln -s $dir/kitty.conf $HOME/.config/kitty
fi
