unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
export TERM="xterm-256color"

# Customize to your needs...
export PATH=$PATH:$HOME/bin:/var/lib/gems/1.8/bin
export PATH=$PATH:/home/paul/bin/android-sdk-linux_86/tools/
export PATH=$PATH:~/local/adt-bundle-linux/sdk/platform-tools/
export PATH=$PATH:/Users/padenot/Library/Python/3.8/bin
export PATH="$HOME/.cargo/bin:$PATH"
source ~/.aliases
if [ -d /Users ] 
then
	export PATH=/opt/homebrew/bin:$PATH
fi

export LC_ALL=en_US.UTF-8

setopt promptsubst

source ~/.files/scm-prompt.sh

export ZSH_CUSTOM=$HOME/.files/zsh_custom

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.files/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="paul"

plugins=(git command-not-found debian npm mach)

source $ZSH/oh-my-zsh.sh


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

alias less=$PAGER
alias zless=$PAGER 
export EDITOR="nvim"
export HGEDITOR="nvim"
export CODEEDITOR="/home/padenot/bin/e"

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

setopt no_correctall

if [ -e $HOME/local ]
then
  for i in $(ls $HOME/local/); do
    p="$HOME/local/$i"
    [ -d $p/bin ] && PATH="${p}/bin:${PATH}"
    [ -d $p/sbin ] && PATH="${p}/sbin:${PATH}"
    [ -d $p/include ] && CPATH="${p}/include:${CPATH}"
    [ -d $p/lib ] && LD_LIBRARY_PATH="${p}/lib:${LD_LIBRARY_PATH}"
    [ -d $p/lib ] && LD_RUN_PATH="${p}/lib:${LD_RUN_PATH}"
    # uncomment the following if you use macintosh
    # [ -d $i/lib ] && DYLD_LIBRARY_PATH="${i}/lib:${DYLD_LIBRARY_PATH}"
    [ -d $p/lib/pkgconfig ] && PKG_CONFIG_PATH="${p}/lib/pkgconfig:${PKG_CONFIG_PATH}"
    [ -d $p/share/man ] && MANPATH="${p}/share/man:${MANPATH}"
  done
fi

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
  eval `$SSHAGENT $SSHAGENTARGS`
  trap "kill $SSH_AGENT_PID" 0
  ssh-add ~/.ssh/id_rsa
fi

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

GPGKEY=CB9258FD

PATH=$PATH:~/.cargo/bin
export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/.mozbuild/tup/"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/home/padenot/.mozbuild/android-sdk-linux/platform-tools/:$PATH"
# export PATH=/usr/lib/icecc/bin:$PATH

pernosco-submit () { (. /home/padenot/.pernosco-mozilla-creds; /home/padenot/src/repositories/pernosco-submit/pernosco-submit "$@") }

alias tmux="TERM=screen-256color-bce tmux"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export PATH="$HOME/.local/bin/:$PATH"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

export NVIM_LISTEN_ADDRESS=localhost:6666
export PATH="/home/padenot/.mozbuild/git-cinnabar:$PATH"

export GPGKEY=CB9258FD

PATH=$PATH:~/.cargo/bin
export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/.mozbuild/tup/"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/home/padenot/local/icecream/libexec/icecc/bin:$PATH"

export PATH="/home/padenot/.mozbuild/android-sdk-linux/platform-tools/:$PATH"

alias history="history 1"
export HISTSIZE=99999  
export HISTFILESIZE=99999 
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=$HISTSIZE

export MCFLY_FUZZY=2
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_RESULTS_SORT=LAST_RUN

eval "$(mcfly init zsh)"


