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
plugins=(git command-not-found pass sudo)

# User configuration

export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/local/civix/:$HOME/local/wp-cli"
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


function chc()
{
      xdg-open "$HOME/ownCloud/Shared/Palante Tech Shared/Administrative/Bookkeeping/hours worked charts 2016.ods"
}

function cr()
{
      gpg --quiet --no-tty -d "$HOME/ownCloud/Shared/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' 2> /dev/null
}

function cro()
{
      gpg -do '/tmp/'$1'_credentials.txt' "$HOME/ownCloud/Shared/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg'
            vi '/tmp/'$1'_credentials.txt'
}

function cre() {
            gpg -eso "$HOME/ownCloud/Shared/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' -r 2614802205808E10 -r 05431C1FC47B97F5 -r 0A279E082B64B3CA -r 0DC025928E9AA851 -r C1983031ABC56AB1 -r A5C77224F7958C93  '/tmp/'$1'_credentials.txt'
            rm /tmp/*_credentials.txt
}

function crg() {
      gpg --quiet -d "$HOME/ownCloud/Shared/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' | grep git -A 1
}

function me() {
      echo "Maiolica" | ssvncviewer -scale .8 -autopass -encodings "zywrle tight hextile copyrect" B1RNML2 &> /dev/null &
}

function ssh()
{
  /usr/bin/ssh $@
  if [ "$?" -eq 255 ]; then
    /usr/bin/ssh -F $HOME/ownCloud/Shared/Palante\ Tech\ Shared/SSH\ Keys/config_files/ssh_config "$@"
  fi
}

function rsync()
{
  /usr/bin/rsync $@
  if [ "$?" -eq 255 ]; then
    /usr/bin/rsync -e "/usr/bin/ssh -F '/home/jon/ownCloud/Shared/Palante Tech Shared/SSH Keys/config_files/ssh_config'" "$@"
  fi
}

function scp()
{
  /usr/bin/scp "$@"
    if [ "$?" -eq 1 ]; then
      echo "Using shared ssh config"
      /usr/bin/scp -F $HOME/ownCloud/Shared/Palante\ Tech\ Shared/SSH\ Keys/config_files/ssh_config "$@"
    fi
}


#wp-cli
#autoload bashcompinit
#bashcompinit
#source ~/local/wp-cli/wp-completion.bash


pts=~/ownCloud/Shared/Palante\ Tech\ Shared
cl=~/ownCloud/Shared/Palante\ Tech\ Shared/Current\ Clients\ and\ Projects
aclu=~/local/aclu
ajla=~/local/ajla
alpcivi=~/local/alpcivi
cagj=~/local/cagj
ccr=~/local/ccr
cividev=/var/www/cividev
cpehn=/var/www/cpehn
demo=~/local/demo
dwb=/var/www/dwb
fcd=~/local/fcd
ilrf=/var/www/ilrf
gsa=~/local/gsa
hcn=~/local/hcn
lccr=~/local/lccr
lm=/var/www/lm
newpress=/var/www/newpress
nlg=~/local/nlg
npap=~/local/npap
nwu=~/local/nwu
nyoc=~/local/opencenter
opencenter=~/local/opencenter
ppnorcal=/var/www/ppnorcal
ppsp=/var/www/ppsp
redup=~/local/redup
soex=~/local/soex
tan=~/local/tan
ujc=/var/www/ujc
wke=~/local/wke
wrl=~/local/wrl
dmaster=~/local/civicrm-buildkit/build/dmaster/sites/all/modules/civicrm
d44=~/local/civicrm-buildkit/build/d44/sites/all/modules/civicrm
d45=~/local/civicrm-buildkit/build/d45/sites/all/modules/civicrm
d46=~/local/civicrm-buildkit/build/d46/sites/all/modules/civicrm
wpmaster=~/local/civicrm-buildkit/build/wpmaster/wp-content/plugins/civicrm/civicrm
wp44=~/local/civicrm-buildkit/build/wp44/wp-content/plugins/civicrm/civicrm
wp45=~/local/civicrm-buildkit/build/wp45/wp-content/plugins/civicrm/civicrm
wp46=~/local/civicrm-buildkit/build/wp46/wp-content/plugins/civicrm/civicrm
joomla46=~/local/civicrm-buildkit/build/joomla46
backdrop=~/local/backdrop
PATH=$PATH:/home/jon/local/wp-cli:/home/jon/local/civicrm-buildkit/bin

CIVICRM_LOCALES=en_US
umask 0002
