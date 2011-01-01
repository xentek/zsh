

         ##################################################################
         ##################################################################
         #                                                                #
         #        $ZDOT/zshrc.d/environment.keybindings.emacs.zsh         #
         #                                                                #
         ##################################################################
         ##################################################################



# File:  $ZDOT/zshrc.d/environment.keybindings.emacs.zsh

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
#             Use this for emacs (default keybidings)
#
##########################################################################



if [[ -o interactive ]]; then
  

    # zshrc_load_status 'key bindings'

    if [[ -f ~/.zsh/zshvi ]];then
       # Over-ride to use vi key bindings
       # Keep this conditional test for legacy compatibility
       # and for the convenience of individual user customizability.
       bindkey -v
       print "Using vi key bindings!"
    else
       bindkey -e
    fi
    
fi
