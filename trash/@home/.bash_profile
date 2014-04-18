# heLLO, and WELcome to MAson's bash PROfile.
# sorRY for streSSING THE wrong sylLAbles.
#
# mason 2010-07-08: experimentally putting all my macs in version
# control (git, currently) so that we can revision track all our
# niggly little config files, such as this very one.

. ~/.bashrc 
    # source the bashrc because it's where $PATH and friends live
    
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=1
    # Why doesn't Crapple colorize the shell by default? I think even Ubuttnu does that...

alias irb='irb --readline -r irb/completion'
    # I forget what that readline is for, I just copypasted this from somewhere...
echo ""
echo ""
echo "                              _____________________"
echo "                        ____||                     |"
echo "                       []   ||   NAKAHARA          |  ____"
echo "                       |    ||       INFORMATICS   | ___"
echo "                       |____||_____________________|"
echo "                        (o)   (o)            (o)(o)"
echo ""
echo " _________________________________________________________________"
echo ""
echo ""
    # because naked lady ascii welcome art would be tacky!

export NARWHAL_ENGINE=jsc
export CAPP_BUILD="/Build/cappuccino"

alias st='open $1 -a sourcetree'
    # my git gui client du jour
