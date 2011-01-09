# This is the last file to get sourced in $ZDOT/zshrc.d

####################################
#                                  #
#  Autocompletion  functions:      #
#                                  #
####################################

autoload -U compinit
compinit

# avoid repeats in the paths
typeset -U path manpath fpath