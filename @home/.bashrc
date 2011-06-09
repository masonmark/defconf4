export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
    # mason 2010-06-10
    # what the blood clot! some fucking cunt was doing this to me:
    #   LANG=ja_JP.UTF-8
    # but i can't figure out who...
    #

export EDITOR=nano
    # the barcalounger of unix editors

export MANPATH=$MANPATH:/usr/local/git/man/ 
source ~/.git-completion.bash
    # git requires a gentle testicle massage before it's willing to help

source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
    # homebrew shnizz

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/narwhal/bin:$PATH
export PATH=$HOME/local/node/bin:$PATH
export PATH=~/bin:$PATH

export NARWHAL_ENGINE=jsc 
export CAPP_BUILD=/Build/cap 
    # mason 2010 this is wrt cappuccino

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
  # this ugly shit works with ~/.git-completion.bash to show git branch in bash prompts

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
  # rvm held me at gunpoint and forced me to enter the above... no idea what it does.
