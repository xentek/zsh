

          #########################################################
          #########################################################
          #                                                       #
          #       $ZDOT/zshrc.d/environment.styles.0main.zsh      #
          #                                                       #
          #########################################################
          #########################################################



# File:  $ZDOT/zshrc.d/environment.styles.0main.zsh 

# sourced from /etc/zshrc

# Version: 2.0.0

###############################################################################

#  Created by William G. Scott on January 2, 2009.
#  Copyright (c) . All rights reserved.


#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
#    USA
#    
#    cf. URL:   http://www.fsf.org/licensing/licenses/gpl.html
#
###############################################################################


##########################################################################
#
#             Most of what follows is distributed with ZSH
#
##########################################################################



if [[ -o interactive ]]; then

  
    # enable menu selection
    zstyle ':completion:*' menu select=10

    # General completion technique
    #zstyle ':completion:*' completer _complete _correct _approximate _prefix
    zstyle ':completion:*' completer _complete _prefix
    zstyle ':completion::prefix-1:*' completer _complete
    zstyle ':completion:incremental:*' completer _complete _correct
    zstyle ':completion:predict:*' completer _complete

    # Completion caching
    zstyle ':completion::complete:*' use-cache 1
    zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

    # Expand partial paths
    zstyle ':completion:*' expand 'yes'
    zstyle ':completion:*' squeeze-slashes 'yes'

    # Include non-hidden directories in globbed file completions
    # for certain commands
    #zstyle ':completion::complete:*' \
    #  tag-order 'globbed-files directories' all-files 
    #zstyle ':completion::complete:*:tar:directories' file-patterns '*~.*(-/)'

    # Don't complete backup files as executables
    zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

    # Separate matches into groups
    zstyle ':completion:*:matches' group 'yes'

    # Describe each match group.
    zstyle ':completion:*:descriptions' format "%B---- %d%b"

    # Messages/warnings format
    zstyle ':completion:*:messages' format '%B%U---- %d%u%b' 
    zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b'
     
    # Describe options in full
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:options' auto-description '%d'

    # }}}
    # {{{ Simulate my old dabbrev-expand 3.0.5 patch 

    zstyle ':completion:*:history-words' stop yes
    zstyle ':completion:*:history-words' remove-all-dups yes
    zstyle ':completion:*:history-words' list false
    zstyle ':completion:*:history-words' menu yes

    # }}}
    
   

    zshrc_load_status 'miscellaneous'

    # {{{ ls colours

    if which dircolors >&/dev/null && [[ -e "${zdotdir}/.dircolors" ]]; then
      # show directories in yellow
      #eval `dircolors -b $zdotdir/.dircolors`
      noglob eval $(command dircolors -b $zdotdir/.dircolors)
    fi

    if [[ $ZSH_VERSION > 3.1.5 ]]; then
      zmodload -i zsh/complist

      zstyle ':completion:*' list-colors ''

      zstyle ':completion:*:*:kill:*:processes' list-colors \
        '=(#b) #([0-9]#)*=0=01;31'

      # completion colours
      zstyle ':completion:*' list-colors "$LS_COLORS"
    fi  

    # }}}

    # }}}
fi
