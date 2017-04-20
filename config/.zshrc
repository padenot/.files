setopt promptsubst

source ~/.files/scm-prompt.sh

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.files/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="paul"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/paul/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH=$PATH:$HOME/bin:/var/lib/gems/1.8/bin
export PATH=$PATH:/home/paul/bin/android-sdk-linux_86/platform-tools/
export PATH=$PATH:/home/paul/bin/android-sdk-linux_86/tools/
export PATH=$PATH:$HOME/bin/mozilla-utils
export PATH=$PATH:~/local/adt-bundle-linux/sdk/platform-tools/
export PATH="$HOME/.cargo/bin:$PATH"
source ~/.aliases

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

export HGMERGE=meld
alias less=$PAGER
alias zless=$PAGER 
export EDITOR="vim"
export HGEDITOR="vim"
export CODEEDITOR="/home/padenot/bin/e"

# source ~/.colors

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

setopt no_correctall

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


SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
  eval `$SSHAGENT $SSHAGENTARGS`
  trap "kill $SSH_AGENT_PID" 0
  ssh-add ~/.ssh/id_rsa
fi

export LLVM_HOME="/home/paul/workspace/repositories/llvm/"

autoload bashcompinit
bashcompinit
source ~/src/trees/mozilla-central/python/mach/bash-completion.sh

GPGKEY=CB9258FD

alias vim=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
