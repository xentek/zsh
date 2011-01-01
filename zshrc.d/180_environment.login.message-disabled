
###################################################################
###################################################################
####                      Login Message                      ######
###################################################################
################################################################### 
    
if [[ -o interactive ]]; then

    #  This works for both Terminal.app and iTerm.app as well as X-term
    #  set the title and tab values to current directory
    #  Stuff that appears when the interactive shell starts up:


    # Give time since last reboot.  Blank print statement gives us a new line
   
    uptime=$(uptime 2>/dev/null ) 
    print "\e[36mTime: $uptime \e[0m"
    
    # Tell us what computer we are on and what directory we are in
   
    print "\e[36m$HOST\e[0m\:\:\e[36m$PWD\e[0m" 
    
   
    # What version of zsh are we running?
    
    print "\e[36mInitializing zsh version number $ZSH_VERSION \e[0m"
    

fi  #  [[ -o interactive ]]


