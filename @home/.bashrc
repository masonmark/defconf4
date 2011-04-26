export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
    # mason 2010-06-10
    # what the blood clot! some fucking cunt was doing this to me:
    #   LANG=ja_JP.UTF-8
    # but i can't figure out who...
    #

export EDITOR=nano
    # the barcalounger of unix editors

export MANPATH=/usr/local/git/man/ 
source ~/.git-completion.bash
    # git requires a gentle testicle massage before it's willing to help

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/narwhal/bin
export PATH=$PATH:~/bin

export NARWHAL_ENGINE=jsc 
    # mason 2010 this is wrt cappuccino

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
  # this ugly shit works with ~/.git-completion.bash to show git branch in bash prompts
