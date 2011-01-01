

                    #################################################
                    #################################################
                    #                                               #
                    #                 001_path_env                  #
                    #                                               #
                    #################################################
                    #################################################

# File:  ${ZDOT}/zshrc.d/001_path_env 

# sourced from  /etc/zshrc

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

# First, disable the zsh-newuser-install mechanism, as it can confuse the new
# user of these files. Do this by creating an empty ~/.zshrc file if none
# currently exists.

if [[ ! -f  ~/.zshrc ]];then
   touch ~/.zshrc
fi

# Make the ~/.zsh directory if it does not yet exist.

if [[ ! -d ~/.zsh ]]; then 
   mkdir -p ~/.zsh  
fi

###############################################################################


# All of the rc files created for user control go into the hidden home directory ~/.zsh
if [[ -d ${HOME}/.zsh ]]; then
	mkdir -p ~/.zsh
fi



# *******************************************************************************

										
# Establish initial conditions for $PATH and $MANPATH consistent with expected behavior:

# You should, as a bare minimum, have $MINPATH in your OS X $PATH:

if [[ -x /usr/libexec/path_helper ]]; then
    # eval $(/usr/libexec/path_helper -s ) # Done in zshenv_master
    # Minimal $PATH set automatically
    MIN_PATH=${PATH}:/usr/libexec
    # Minimal $MANPATH set automatically
    MANPATH=${MANPATH}
else
    # Alternative Minimal $PATH set manually
    MIN_PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/libexec
    # Alternative Minimal $MANPATH set manually
    if [[ -d /usr/X11/share/man ]]; then
        MANPATH=/usr/share/man:/usr/X11/share/man
	elif [[ -d /usr/X11R6/share/man ]]; then
	    MANPATH=/usr/share/man:/usr/X11R6/share/man
	else 
	    MANPATH=/usr/share/man
	fi
fi

# *******************************************************************************

# If the user installed everything in $ZDOT_USER and $ZDOTDIR is nonexistent, attempt
# to globally adjust everything to accomidate this change. Likewise for the 
# fink-installed version.



if [[ ! -d $ZDOT && -d $ZDOT_TEMPLATE ]];then
    ZDOT="$ZDOT_TEMPLATE"
    export ZDOT
    # Notify user of what is happening:
    if [[ -z $SSH_CONNECTION && -o interactive ]];then 
        print "Using template files installed in $ZDOT"
    fi
elif [[ ! -d $ZDOT && -d $ZDOT_USER ]];then
    ZDOT="$ZDOT_USER"
    export ZDOT
    # Notify user of what is happening:
    if [[ -z $SSH_CONNECTION && -o interactive ]];then 
        print "Using template files installed in $ZDOT"
    fi
fi



# *******************************************************************************


###################################
#                                 #
#     Here we add to the PATH:    #
#                                 #
###################################



# Then PREPEND or APPEND these to $PATH only if they exist:

# Note that $SWPREFIX/bin and $SWPREFIX/sbin were *prepended* at the top of the file
# if you installed fink in $SWPREFIX, you don't need to add these again.  However,
# to ensure the desired priority ordering, I do the following, which together with the
# typeset -U command, allows fine-tuning of the order without either duplicating or
# accidently deleting anything from $PATH :

#### For Fink, if present
#   if [[ -d $SWPREFIX/bin ]]; then                                           #
#       PREPEND_PATH=$SWPREFIX/bin:$SWPREFIX/sbin                             #
#   fi                                                                        #
                                                                              #
#   ### For MacPorts, if present                                              #
#   if [[ -f ~/.zsh/zsh_macportsfirstinpath ]]; then                          #  Moved to
#   	if [[ -d /opt/local/bin ]]; then                                      #  001 and
#   	    PREPEND_PATH=/opt/local/bin:/opt/local/sbin:$PREPEND_PATH         #  002
#   	fi                                                                    #
#   else                                                                      #
#   	if [[ -d /opt/local/bin ]]; then                                      #
#   	    PREPEND_PATH=$PREPEND_PATH:/opt/local/bin:/opt/local/sbin         #
#   	fi                                                                    #
#   fi


#### For X11, if present
if [[ -d /usr/X11/bin ]]; then
    APPEND_PATH=/usr/X11/bin:$APPEND_PATH
elif [[ -d /usr/X11R6/bin ]]; then
    APPEND_PATH=/usr/X11R6/bin:$APPEND_PATH
fi

#### For Developer Tools, if present
if [[ -d /Developer/Tools ]]; then
    APPEND_PATH=/Developer/Tools:$APPEND_PATH
fi

#### For /usr/local, if present
if [[ -d /usr/local/sbin ]]; then
    APPEND_PATH=/usr/local/sbin:$APPEND_PATH
fi

#### For /usr/local, if present
if [[ -d /usr/local/bin ]]; then
    APPEND_PATH=/usr/local/bin:$APPEND_PATH
fi

#### For /usr/local/xtal, if present
if [[ -d /usr/local/xtal/bin ]]; then
    APPEND_PATH=$APPEND_PATH:/usr/local/xtal/bin
fi

#### For user-installed python framework, if present
if [[ -d /Library/Frameworks/Python.framework/Versions/Current/bin ]];then
    APPEND_PATH=$APPEND_PATH:/Library/Frameworks/Python.framework/Versions/Current/bin
fi

#### For AquaTclTk, if present
if [[ -d /Library/Tcl/bin ]]; then
    APPEND_PATH=$APPEND_PATH:/Library/Tcl/bin
fi

#### For user's own bin directory, if present
if [[ -d ~/bin ]]; then
    APPEND_PATH=$APPEND_PATH:~/bin
fi

#### For user's own hidden bin directory, if present
if [[ -d ~/.bin ]]; then
    APPEND_PATH=$APPEND_PATH:~/.bin
fi

# Append current directory at the very end of the path, not the beginning.  
# Some people consider this to be a minor security hazard.  Putting it at the
# end of the path minimizes the potential hazard.  Uncomment it if this
# what you want.


#    APPEND_PATH=$APPEND_PATH:.


# Now assemble and generate the ordered PATH:

    #PATH=$PREPEND_PATH:$MIN_PATH:$APPEND_PATH
    PATH=$PREPEND_PATH:$MIN_PATH:$PATH:$APPEND_PATH

    # Remove any instances of multiple colons:

    PATH=${PATH/::/:}
    PATH=${PATH/::/:}
    PATH=${PATH/::/:}
    PATH=${PATH/::/:}
    PATH=${PATH/::/:}
    PATH=${PATH/::/:}
    PATH=${PATH/::/:}
    PATH=${PATH/::/:}
    # Remove leading : if present
    PATH=${PATH#:}  

#
# Export PATH as separate command to avoid dollar signs in export line
#

        export PATH

#
#
# Avoid repeats in the path
#

        typeset -U path

#################################################################################

#
# Don't kill background jobs upon logging out
#

setopt nohup


# *******************************************************************************





# *******************************************************************************




###########################################
#    Add man pages to $MANPATH            #
###########################################

# Add /usr/local manpages

    if [[ -x $(which manpath ) ]];then 
		if [[ -z $MANPATH ]]; then
			MANPATH=$( manpath )
		else
			MANPATH=$( manpath ):${MANPATH}	
			typeset -U manpath
		fi
	fi

	if [[ -d /usr/local/share/man ]];then
	    MANPATH=$MANPATH:/usr/local/share/man
	fi

	if [[ -d /usr/local/man ]];then
	    MANPATH=$MANPATH:/usr/local/man
	fi

# Add /opt/local/man for Darwinports

	if [[ -d /opt/local/man ]]; then
	    MANPATH=$MANPATH:/opt/local/man 
	fi


# Activate zsh-templates man pages 

	if [[ -d $ZDOT/man ]];then
	   MANPATH=$ZDOT/man:$MANPATH
	elif [[ -d $ZDOT_TEMPLATE/man ]];then
	   MANPATH=$MANPATH:$ZDOT_TEMPLATE/man
	fi

	export MANPATH

	typeset -U manpath

#########################################



###########################################
#    Add HELPDIR                          #
###########################################

	if [[ -d /usr/share/zsh/$ZSH_VERSION/Help ]];then

	  if [[ -z $HELPDIR ]];then
	    HELPDIR=/usr/share/zsh/$ZSH_VERSION/Help
	  else
	    HELPDIR=/usr/share/zsh/$ZSH_VERSION/Help:$HELPDIR
	  fi

	elif [[ -d /usr/share/zsh/$ZSH_VERSION/help ]];then

	  if [[ -z $HELPDIR ]];then
	    HELPDIR=/usr/share/zsh/$ZSH_VERSION/help
	  else
	    HELPDIR=/usr/share/zsh/$ZSH_VERSION/help:$HELPDIR
	  fi

	elif [[ -d $SWPREFIX/share/zsh/$ZSH_VERSION/Help ]];then

	  if [[ -z $HELPDIR ]];then
	    HELPDIR=$SWPREFIX/share/zsh/$ZSH_VERSION/Help
	  else
	    HELPDIR=$SWPREFIX/share/zsh/$ZSH_VERSION/Help:$HELPDIR
	  fi

	elif [[ -d $SWPREFIX/share/zsh/$ZSH_VERSION/help ]];then

	  if [[ -z $HELPDIR ]];then
	    HELPDIR=$SWPREFIX/share/zsh/$ZSH_VERSION/help
	  else
	    HELPDIR=$SWPREFIX/share/zsh/$ZSH_VERSION/help:$HELPDIR
	  fi

	fi

	export -TU HELPDIR helpdir
	typeset -U helpdir  # probably redundant with previous line

# Now it should work like $PATH and $path
