# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found pass sudo wp-cli drush ubuntu)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function o()
{
      xdg-open "$1"
}

#close and reopen a file (works with LibreOffice, probably other stuff)
function co()
{
  xdotool search "$1" windowactivate --sync key --window 0 --clearmodifiers alt+F4
  xdg-open "$1"
}

function cr()
{
      gpg --quiet --no-tty -d "$HOME/ownCloud/work/Credentials/"$1'_credentials.txt.gpg' 2> /dev/null
}

function cro()
{
      gpg -do '/tmp/'$1'_credentials.txt' "$HOME/ownCloud/work/Credentials/"$1'_credentials.txt.gpg'
            vi '/tmp/'$1'_credentials.txt'
}

function cre() {
            gpg -eso "$HOME/ownCloud/work/Credentials/"$1'_credentials.txt.gpg' -r 0DC025928E9AA851 '/tmp/'$1'_credentials.txt'
            rm /tmp/*_credentials.txt
}

function crg() {
      gpg --quiet -d "$HOME/ownCloud/work/Credentials/"$1'_credentials.txt.gpg' | grep git -A 1
}

function gpge() {
  gpg -e -r 0DC025928E9AA851 "$1" 
}

function me() {
      echo "Maiolica" | ssvncviewer -scale .8 -autopass -encodings "zywrle tight hextile copyrect" Jon-PC &> /dev/null &
}

function ssh()
{
  ssh-combine; /usr/bin/ssh $@
}

function rsync()
{
  ssh-combine; /usr/bin/rsync -av --progress $@
}

function ssh-combine()
{
  cat $HOME/.ssh/config.d/* > $HOME/.ssh/config
}

function become()
{
  sudo --preserve-env su --preserve-environment "$@"
}

#wp-cli
#autoload bashcompinit
#bashcompinit
#source ~/local/wp-cli/wp-completion.bash


work=~/ownCloud/work
clients=~/ownCloud/work/Clients
ans=~/local/ansible
dmaster=~/local/civicrm-buildkit/build/dmaster/web/sites/all/modules/civicrm
wpmaster=~/local/civicrm-buildkit/build/wpmaster/web/wp-content/plugins/civicrm/civicrm
smaster=~/local/civicrm-buildkit/build/smaster/web/core

if [ -d "$HOME/local/civicrm-buildkit" ] ; then
    PATH=$PATH:/home/jon/local/civicrm-buildkit/bin
fi


CIVICRM_LOCALES=en_US
umask 0002
eval "$(fasd --init auto)"

# Load all files from .shell/rc.d directory
if [ -d $HOME/.shellrc/rc.d ]; then
  for file in $HOME/.shellrc/rc.d/*.sh; do
    source $file
  done
fi

# FIXME: I don't think I need this now that I've switched my strategy for combined SSH configs
# Set the fpath (for custom completions)
fpath=( ~/dotfiles/zsh_completions  "${fpath[@]}")
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
bindkey '^R' history-incremental-pattern-search-backward

# Everything down to the 2 add-zsh-hook commands is to set window title in kitty when SSHing.
autoload -Uz add-zsh-hook

function _update_title_preexec() {
  local cmd="$1"

  if [[ "$cmd" == ssh* ]]; then
    # Extract hostname from ssh command (supporting user@host)
    local host="$(echo "$cmd" | awk '{print $2}' | cut -d@ -f2)"
    kitty @ set-window-title "ssh ${host:-$cmd}"
  else
    kitty @ set-window-title "$cmd"
  fi
}

function _update_title_precmd() {
  # Set a fallback title when no command is running
  local cwd="${PWD/#$HOME/~}"  # Tilde for home dir
  kitty @ set-window-title "$USER@$HOSTNAME: $cwd"
}

add-zsh-hook preexec _update_title_preexec
add-zsh-hook precmd _update_title_precmd
