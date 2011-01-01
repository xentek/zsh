
          ##################################################################
          ##################################################################
          #                                                                #
          #       $ZDOT/zshrc.d/environment.keybindings.zshall.zsh         #
          #                                                                #
          ##################################################################
          ##################################################################



# File:  $ZDOT/zshrc.d/environment.keybindings.zshall.zsh

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
#     Use this for all zsh keybidings AFTER emacs or vi is chosen
#
##########################################################################



if [[ -o interactive ]]; then
    # {{{ Key bindings 

    # zshrc_load_status 'key bindings'

    # command zle -la  produces a list of possible commands
    # command bindkey -L produces a list of keys and their current bindings

    # Fix weird sequence that rxvt produces
    bindkey -s '^[[Z' '\t'

    # alias no=ls  # for Dvorak

    bindkey '^L' push-input

    bindkey -s '^X^Z' '%-^M'
    bindkey '^[e' expand-cmd-path
    #bindkey -s '^X?' '\eb=\ef\C-x*'
    bindkey '^[^I' reverse-menu-complete
    bindkey '^X^N' accept-and-infer-next-history

    bindkey '^[P' history-beginning-search-backward
    bindkey '^[N' history-beginning-search-forward
    bindkey '^[b' emacs-backward-word
    bindkey '^[f' emacs-forward-word
    bindkey '^[v' expand-or-complete-prefix

    # Key Up(arrow) and Key Down(arrow)
    bindkey '\e[A'  history-search-backward  # Up
	bindkey '\e[B'  history-search-forward   # Down
    #bindkey '\e[A'  up-line-or-history      # Up
    #bindkey '\e[B'  down-line-or-history    # Down
	
	# Key Right(arrow) and Key Left(arrow)
    bindkey '\e\e[C' forward-word            # Right
    bindkey '\e\e[D' backward-word           # Left
	
	
    # Key Home and Key End
    # May have to be configured within the terminal emulator

	if [[  ( $TERM_PROGRAM == iTerm.app )  ]];then

		#### iTerm.app on OS X possible options

		if [[ $TERM == "xterm" ]];then
	    	bindkey '^[[7~'  beginning-of-line        				# Home
	    	bindkey '^[[8~'  end-of-line              				# End
		elif [[ $TERM == "vt100" ]];then
			bindkey '^[Oq'  beginning-of-line         				# Home
			bindkey '^[Op'  end-of-line               				# End
		elif [[ $TERM == "linux" ]]; then
	    	bindkey '^[[1~'  beginning-of-line        				# Home
	    	bindkey '^[[4~'  end-of-line              				# End
		elif [[ $TERM == "ansi" ]]; then
		    bindkey '^[[H'  beginning-of-line        				# Home
		    bindkey '^[[F'  end-of-line              				# End
		else  
	        true
		fi

	elif [[  $TERM_PROGRAM == (Apple_Terminal)  ]]; then

		#### Terminal.app on OS X possible options
		# Needs to be configured within the Terminal.app Preferences
		true
	
	elif [[ ( $TERM_PROGRAM == rxvt && $(uname) == "Darwin" ) || 
	          $COLORTERM == *rxvt* ]]; then
		#### rxvt  
		bindkey '^[[7~'  beginning-of-line        					# Home
		bindkey '^[[8~'  end-of-line              					# End
		
	elif [[ $COLORTERM == (Terminal|gnome-terminal|xfce4-terminal) ]];then
		#### xfce4 Terminal
		       bindkey '^[OH'  beginning-of-line        			# Home
		       bindkey '^[OF'  end-of-line              			# End
		
	elif [[ -n $KONSOLE_DBUS_SERVICE || $TERM_PROGRAM == konsole ]]; then
	    bindkey '^[[H'  beginning-of-line        				# Home
	    bindkey '^[[F'  end-of-line              				# End
	
	elif [[ ( $TERM_PROGRAM == xterm && $(uname) == "Darwin" ) ||
	          $TERM == xterm ]]; then
		#### xterm  
	    bindkey '^[[H'  beginning-of-line        					# Home
	    bindkey '^[[F'  end-of-line              					# End	
	
	else
		# Other options?
		true
	fi
   
    # Key PageUp and Key PageDown
	    # Note that PageUp and PageDown and/or
	    # ^PageUp and ^PageDown are usually intercepted by the 
	    # terminal emulator.  Therefore, you will likely have to
	    # configure these within the terminal emulator itself.
	    # Typical xterm/linux values
	    # bindkey '^[[5~' foo  # PageUp
	    # bindkey '^[[6~' bar  # PageDown

fi
