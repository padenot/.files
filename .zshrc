# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="paul"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found deb debian npm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/paul/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH=$PATH:$HOME/bin:/var/lib/gems/1.8/bin
export PATH=$PATH:/home/paul/bin/android-sdk-linux_86/platform-tools/
export PATH=$PATH:/home/paul/bin/android-sdk-linux_86/tools/
export PATH=$PATH:$HOME/bin/mozilla-utils
source ~/.aliases

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

export HGMERGE=meld
export PAGER=~/bin/vimpager
alias less=$PAGER
alias zless=$PAGER 
export EDITOR="vim"
export CODEEDITOR="/usr/bin/gvim"

cd ~

source ~/.colors

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

setopt no_correctall
