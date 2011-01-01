
			#################################################
			#################################################
			#                                               #
			#       environment.x11.oldsetup.zsh            #
			#                                               #
			#################################################
			#################################################


#  This is used only on Darwin OS X prior to 10.5 in interactive sessions.
#  It is all done automatically > 10.5 and on other operating systems, so the
#  first test will disable it automatically for >= 10.5.  


###############################################################################

if [[  $(uname) == Darwin && $(sw_vers -productVersion) < 10.5  && -z $SSH_CONNECTION && -o interactive ]]; then
	
	###########################################
	#    Optional Startup of X11.app          #
	###########################################

	#  If you want Apple's X11 to be started up with "open -a X11" if it is 
	#  notalready running, then comment out the line following the arrow:
	
	# {====>} 
		export open_apple_x11='skip'
		
		# Allow a user to over-ride the default behavior by creating a file
		# with either "export open_apple_x11='skip'" or
		# export open_apple_x11='use'
		if [[ -f ~/.zsh/skipxrc ]];then
        	source ~/.zsh/skipxrc  
    	fi

		# Now open X11.app only if told to do so and it is not already running:
		if [[ $open_apple_x11 != 'skip'  ]];then
			already_running_x11=$(ps -wwx | grep -F X11.app | grep -v grep | head -n 1 | awk '{print $1}')
			if [[  $already_running_x11 -gt 1 ]];then
				:
			else
				command open -a X11
				if [[ $? != 0 ]];then
					print ""
					print "Unable to open Apple's X11.  Is it installed?"
				fi
			fi
		fi
		
	# End of X11.app startup part
	#---------------------------------------------------

    # Do not do this in 10.5 and above. cf: 
    #  http://lists.apple.com/archives/X11-users/2007/Oct/msg00065.html

	if [[ $(sw_vers -productVersion) < 10.5 ]]; then

	
		###########################################
		#    X11 and $DISPLAY control             #
		###########################################	
		
		# Now set the DISPLAY variable, if needed.  If X11.app is running,
		# we deduce and construct the DISPLAY value from the process. If
		# this doesn't work (no X11.app running), we give up and dumbly set the
		# value to :0.0. Users who want to avoid the small ps overhead can 
		# comment out the "disp_no" line.  This will simply set DISPLAY=:0.0  
		
	 	if [[ -z $DISPLAY && -z $SSH_CONNECTION ]]; then
	
		    disp_no=($( ps -wwx | grep -F X11.app | awk '{print $NF}' | grep -e ":[0-9]"  ))
	
		    if [[ -n $disp_no ]];then
		        export DISPLAY=${disp_no}.0
				# Colorful output tells us that the smart method has worked
				print "\e[1mDISPLAY\e[0m \e[36mhas been set to\e[0m \e[1m$DISPLAY \e[0m"
		    else
				# FAILSAFE: dumb setting of DISPLAY gives a monochromatic message
		        export DISPLAY=:0.0
				print "DISPLAY has been set to $DISPLAY" 
		    fi
	
		elif [[ -n $DISPLAY && -z $SSH_CONNECTION ]]; then
		
				# Inform that we have inherited the DISPLAY (as with an xterm)
				print "\e[36minheriting\e[0m \e[1mDISPLAY\e[0m set to \e[1m$DISPLAY\e[0m"
		fi
	fi

fi # [[  $(uname) == Darwin  && -z $SSH_CONNECTION ]]



###############################################################################




