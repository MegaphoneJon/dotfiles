#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# Install oh-my-zsh
curl --output ./oh-my-zsh-install.sh -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
env RUNZSH=no sh ./oh-my-zsh-install.sh
dir=~/dotfiles                    # dotfiles directory

olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vim ptrrc gitconfig profile selected_editor zshenv zshrc"    # list of files/folders to symlink in homedir

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

