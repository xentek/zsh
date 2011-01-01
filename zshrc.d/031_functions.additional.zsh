                    

        #################################################
        #################################################
        #                                               #
        #    $ZDOT/zshrc.d/functions.additional.zsh     #
        #                                               #
        #################################################
        #################################################



# File local-functions

# Use this file to load the extra functions that come with zsh-templates.
# Create a file functions.mine to load your own home-grown functions.

# This file also is where the prompt functions, including the customized
# prompts supplied with zsh and supplied with zsh-templates, are loaded.
# (See last part of file).

if [[ -o interactive ]]; then


# Type "help_template_functions [foo]" for a description of each function [foo]

# In this file we autload all or a subset of the function in the directory
# called $ZDOT/zshrc.d/local-functions (or $ZDOT_TEMPLATE/local-functions).

# I've divided these into three sets.  You can control which are loaded using
# three controlling variables defined below, or fine-tune this using comments.

# The first set I am confident you won't want to live without, so they are
# autoloaded by default.  This is defined with LOAD_ESSENTIAL_FUNCTIONS='YES'    

# The second set are additional functions that I like, but you might well find 
# annoying.  These are not autoloaded by default, but you can load them by 
# setting a flag.  (There are within this second set a few I have commented out, 
# so you will have to also remove the comment (pound sign) to use these 
# (these are ones I have but don't use).  LOAD_POSSIBLY_ANNOYING_FUNCTIONS='NO'
# If you put a file (even an empty one) called ~/.zsh/zlocalfxn in a user's home
# directory, the 'NO' setting will be over-ridden for that user.

# The third set are specific to X-ray crystallography and biophysics programs, so
# unless you use these programs, there is no reason to autoload them. (Most of
# these are programs that you can install with fink.   LOAD_CRYSTAL_FUNCTIONS='NO'
# If you have installed a crystallography program via fink, this will default
# to loading these functions after testing for the directory /sw/share/xtal.

# These controlling variables can be changed to load the second and third
# set by changing 'NO' to 'YES' in each case:



        ########################################################
        #                                                      #
        #       For system-wide control, edit these:           #
        #                                                      #
                LOAD_ESSENTIAL_FUNCTIONS='YES'                 #
        #                                                      #    
                LOAD_POSSIBLY_ANNOYING_FUNCTIONS='NO'          #
        #                                                      #   
                LOAD_CRYSTAL_FUNCTIONS='NO'                    #
        #                                                      #
        ########################################################      




###############################################################################    
###############################################################################  
    
    
    if [[ $LOAD_ESSENTIAL_FUNCTIONS == 'YES' ]];then
    
        if [[ -d $ZDOT_TEMPLATE/zshrc.d/local-functions/general ]];then
            FPATH=$ZDOT_TEMPLATE/zshrc.d/local-functions/general:$FPATH
        fi
        
        if [[ -d $ZDOT/zshrc.d/local-functions/general ]];then
            FPATH=$ZDOT/zshrc.d/local-functions/general:$FPATH
        fi
    
      # functions that are not Darwin-specific:
        
        # Abbrreviate standard unix command sequences
        autoload -U fds 
        autoload -U fdsa 
        autoload -U pgrep 
        autoload -U hgrep 
        autoload -U pidof 
        autoload -U errnum 
        autoload -U ldirs 
        autoload -U go 
        autoload -U stoppedjobs 
        autoload -U gunall 
        autoload -U showalias 
        autoload -U ppath 
        autoload -U dotgrep 
        autoload -U sgrep 
        autoload -U envgrep
        autoload -U renice_grep 
        autoload -U txtgrep 
        autoload -U lgrep 
        autoload -U whichre 
        autoload -U dusize 
        
         
        # sudo-enabled vim
        autoload -U vi vim gvim  
        
        # Use imagemagic to make black background transparent
        autoload -U make_trasparent
        
        # catenate pdf files with ghostscript
        autoload -U joinpdf 
          
        # locate "*/${@}"
        autoload -U locwd
            
        # find dependencies from fink or linux debian packages
        autoload -U depfinder
        
        # run a remote command
        # hostname followed by command string
        autoload -U rcommand
        
        # Find duplicate files
        autoload -U find_dups
        
        # cd to $_ or if a file, to dirname $_
        autoload -U cd_

        # Use tidy to convert to XHTML
        autoload -U tidyxml
        
        # Show the named function's arguments
        autoload -U function_content
    
        # stuff for keeper suite
        autoload -U keep; alias keep='noglob keep'  

        # For cd? (shared directory stack)
        autoload -U dirstack dirdump cpath
            # keep the ~/.zsh/zdirdump file from growing too long (250 entries seems ok)
            tmp_timestamp=$(date | awk '{print $4}')           
            [[ ! -d ~/.zsh ]] && mkdir -p ~/.zsh  
            command touch ~/.zsh/zdirdump
            command cp ~/.zsh/zdirdump /tmp/$tmp_timestamp.zdirdump
            command tail -n 250 /tmp/$tmp_timestamp.zdirdump >| ~/.zsh/zdirdump
            command rm -f /tmp/$tmp_timestamp.zdirdump
        
            # Do this instead of defining a chpwd function with "dirdump" in it:
            typeset -ga chpwd_functions
            chpwd_functions+=dirdump
        # ---------------------------------------------------------------------


      # functions that are Darwin-specific:
        
      if [[ $(uname) == Darwin ]];then 
      
        if [[ -d $ZDOT_TEMPLATE/zshrc.d/local-functions/darwin ]];then
            FPATH=$ZDOT_TEMPLATE/zshrc.d/local-functions/darwin:$FPATH
        fi
        
        if [[ -d $ZDOT/zshrc.d/local-functions/darwin ]];then
            FPATH=$ZDOT/zshrc.d/local-functions/darwin:$FPATH
        fi
    

            # This is used to prompt a new user to configure the templates
            # in a user-specific manner.
            autoload -U configure_zsh_templates
            
            # This is required for many of the GUI scripts
            # Don't turn it off
            autoload -U pashua_run
            
            # wrapper needed for new _fink fast completions
            autoload -U fink  
            autoload -U fink_web sync_fink ; alias finkweb='fink_web'
    
            # Terminal-Finder interactions
            autoload -U cdf posd posgrep posfind fdc cdd cpos  full_path_in_finder
            
            # Terminal-ForkLift interactions
            if [[ -f  $HOME/Library/Preferences/com.binarynights.ForkLift.plist  ]]; then
                autoload -U forklift cdright cdleft
            fi
            
            # Terminal-Safari interactions
            autoload -U cds spath eds
            
            # iTerm osascript/shell script functions
            autoload -U ntab ntrm tcmd

            # a "locate" command that uses mdfind
            autoload -U mlocate

            # Change metadata (spotlight) attributes
            autoload -U mdattr

            # Add full user access to a directory via ACL
            autoload -U acl_adduser
            
            # Pasteboard interactions
            autoload -U  pbcp  
            autoload -U  cpbcp
            
            
            # Hardware interactions
            autoload -U  scrollspeed 
            autoload -U  function_key_toggle
            autoload -U  airport battery numcpu

            
            # Fast user switching
            autoload -U  switch_users
            
            # "open" and related functions for starting and stopping Apps.
            autoload -U  quit open sudo_open enable_faster_open zsh_cache_cleaner
            
            # Help/information functions
            autoload -U help_template_functions help_zsh_templates whichfunctions whatsnew

            # Start Screen Saver
            autoload -U  sss

            # Functions to fill and take out the trash
            autoload -U MacRm empty_trash
            
            # lsbom the listed package with the given arguments
            autoload -U mybom
            
            # Internet
            autoload -U myip  renew_dhcp 
 
            # X11.app customization
            autoload -U  customize_x11 customize_x11_gui 

            # Nested (xnest) window manager sessions
            autoload -U startenlightenment 
            autoload -U startwm
            
            # Aptly named GUI to focus various X-windows
            autoload -U xtwit
            
            # Non-nested subsidiary X-displays
              # start the specified 8-bit X11 process
            autoload -U 8bitx
              # start arbitrary process 
            autoload -U newx 
              # start a remote X-windows session
            autoload -U remotex
            
            # Make an image file the desktop background
            autoload -U wallpaper
            
            # Add a photo icon to an image file -- uses sips
            autoload -U addIcon
            
            # Send mail using Apple's Mail.app
            autoload -U macmail 
                # uncommend for a drop-in mail command replacement
                # alias mail="macmail"

            # toggle AppleEvent logging on or off
            autoload -U aeon 

            # Make zip archive with ditto while keeping parent
            autoload -U zipit  
            
            # list all (OS X) locked files
            autoload -U llock
            
            # Turn off (and if you must, on) those stupid widgets
            autoload -U disable_Dashboard enable_Dashboard
            
            # GUI interface to the user and host completion systems
            autoload -U  user_setup host_setup

            # View most things in Preview (needs a2ps installed)
            autoload -U a2preview da2preview
            
            # Meta-functions for osascript/shellscript GUI programming
            autoload -U osa_direc_browser osa_file_browser osa_choose_list osa_display_dialog
                        
            # TextMate.app project-opener command-line utility
            autoload -U tmpj # function to open saved projects with programmed completion
            autoload -U mate # wrapper opens html in Safari and TextMate simultaneously
            autoload -U cdt  # cd to directory in frontmost TextMate window
            
            # Growl-related functions (precommands)
            if [[ -x $(which growlnotify) ]]; then
                autoload -U gnotify snotify
            fi
            
            # General editor functions: 
            autoload -U composer edit
            
            # For VirtueDesktops and CodeTek Virtual Desktops
            # A function to switch desktops
            autoload -U sd

            # Toggle SPACES on and off
            
            if [[ $(sw_vers -productVersion) < 10.5 ]]; then
                /usr/bin/true
            else
                autoload -U toggle_spaces switcher
            fi

            # These need to be invoked by an admin user.
            if [[ -n $(/usr/bin/id -p $USER | grep -w admin ) ]]; then

                # functions to add (or delete) groups and users to groups
                autoload -U add_user       addgroup        adduser2group 
                autoload -U delete_user    delete_group    remove_user_from_group
           
                # Two functions to help with nfs mounts and exports:
                autoload -U exportfs nfs_niloader
                alias nfs_automounter="nfs_niloader"
                # if Apple someday includes an exportfs command, this should be
                # renamed or turned off
                 
            fi # test for admin

            # autoload open-x11 # Doesn't work correctly.  Use this workaround:
            function open-x11 {
                if [[ -f $ZDOT/zshrc.d/local-functions/darwin/open-x11 ]]; then
                    $ZDOT/zshrc.d/local-functions/darwin/open-x11 "$@"
                elif [[ -f $ZDOT_TEMPLATE/zshrc.d/local-functions/darwin/open-x11 ]]; then
                    $ZDOT_TEMPLATE/zshrc.d/local-functions/darwin/open-x11 "$@"
                else
                    /usr/bin/open-x11 "$*"      
                fi
             }
    
            
            # set these associated aliases:
                alias cdf=""; unalias cdf   # make sure we don't use the wrong cdf
                alias sopen='sudo_open'
                alias rmm='MacRm'           # Mac type remove function (Gary Kerbaugh)
                alias RmMac='MacRm'         # Dyslexics untie
                alias tidyx='tidyxml'       # 
                # alias rm='MacRm -i'       # replaces the (interactive) rm command
                
           # two alternatives for gdirs:
           if [[ -z $GUIDIRS_PASHUA ]];then 
                GUIDIRS_PASHUA='yes'
           fi
                
                # GUIDIRS_PASHUA='no'        
            if [[ $GUIDIRS_PASHUA == 'yes' ]];then
                autoload guidirs_pashua
                function gdirs { 
                    typeset -U dirs_shared
                    dirstack $1 > /dev/null
                    guidirs_pashua  2> /dev/null
                }
                # alias gdirs="typeset -U dirs_shared; dirstack > /dev/null ; guidirs_pashua"
             else
                autoload _guidirs
                function gdirs { 
                    typeset -U dirs_shared
                    dirstack $1 > /dev/null
                    _guidirs 2> /dev/null 
                }
                # alias gdirs="typeset -U dirs_shared; dirstack > /dev/null ; _guidirs"
             fi
            
             typeset -U dirs_shared
            
            # The command-line version is "dirstack" or cd\?.  Defined in $ZDOT/zshrc.d/aliases.local
            # alias cd\?="dirdump; typeset -U dirs_shared; dirstack"
              
                
      fi   ## end ##  [[ $(uname) == Darwin ]]
    
    fi   ## end ## [[ $LOAD_ESSENTIAL_FUNCTIONS == 'YES' ]]

###############################################################################    
###############################################################################   
    
    if [[ $LOAD_POSSIBLY_ANNOYING_FUNCTIONS == 'YES' || -f ~/.zsh/zlocalfxn ]];then
    
        if [[ -d $ZDOT_TEMPLATE/zshrc.d/local-functions/opt ]];then
            FPATH=$ZDOT_TEMPLATE/zshrc.d/local-functions/opt:$FPATH
        fi
        
        if [[ -d $ZDOT/zshrc.d/local-functions/opt ]];then
            FPATH=$ZDOT/zshrc.d/local-functions/opt:$FPATH
        fi
        
        # An augmented man function to read zsh shell builtins and helpfiles.
         autoload -U man
         autoload -U screen
        
        # Wrapper for sudo so when "sudo zsh" is invoked, 
        # zsh will start root as a loging zsh shell to
        # avoid problems with environment clashes.
         autoload -U sudo
        
        #idiosyncratic ls variations
         function lh { command ls -hltF "$@" | head }   
         autoload -U ldot
         alias ll='ls -l'  
         
         if [[ $(uname) == Darwin ]];then 
            autoload -U checkmail
            # autoload -U bbown  
            # autoload -U manmac
            # autoload -U startvnc
         fi


    fi  ## end ## [[ $LOAD_POSSIBLY_ANNOYING_FUNCTIONS == 'YES' ]]
    
###############################################################################    
###############################################################################    
    
    
    if [[ -f ~/.zsh/zxtalfxn || $LOAD_CRYSTAL_FUNCTIONS == 'YES' || -d $SWPREFIX/share/xtal ]];then

        if [[ -d $ZDOT_TEMPLATE/zshrc.d/local-functions/xtal ]];then
            FPATH=$ZDOT_TEMPLATE/zshrc.d/local-functions/xtal:$FPATH
        fi
        
        if [[ -d $ZDOT/zshrc.d/local-functions/xtal ]];then
            FPATH=$ZDOT/zshrc.d/local-functions/xtal:$FPATH
        fi
         
        # Crystallography and biophysics-type functions
        #
        alias ccp4help="" ; unalias ccp4help
        alias sca2fobs='sca2mtz'
        alias cns="" ; unalias cns ; autoload -U cns
        alias ono=""; unalias ono ; autoload -U ono

        autoload -U ccp4help   #  A better ccp4help.
        autoload -U ccp4_patches # Check for new ccp4 patches

        # Augmented coot function wrapper
        autoload -U coot 
        
        # Does what it claims
        autoload -U sca2mtz 
        
        # Use default scala settins to process mosflm data
        # ending with truncated mtz file and cns hkl files.
        # Mercilessly interactive osa/shell script
        autoload -U mos2fobs 
        
        # Launcher for MacPyMOL unix binary
        autoload -U pymol 
        
        # Overlay two (eg) pdf Patterson maps
        autoload -U overlay 

        # If you have foo.mtz and foo.pdb from refmac, these make
        # 2Fo-Fc and Fo-Fc maps
        autoload -U mapcover mapcoverdiff
        
        # Xnested wrappers:  X11 bug workaround
        autoload -U xdlmapman xdldataman
        
        # Function to download PDB files from the PDB server
        autoload -U getpdb
        
        # My function to put DNA/RNA pdb files into standard format
        alias canonical_pdb='canonicalize_pdb'
        alias canon_pdb='canonicalize_pdb'
        autoload -U canonicalize_pdb fix_namot
        
        # A better cns_edit and cns_web
        autoload -U cns_edit cns_web

        # Activate the environment.xtal script
        [[ ! -d ~/.zsh ]] && mkdir -p ~/.zsh  
        touch ~/.zsh/use_xtal_env

    fi  ## end ## [[ $LOAD_CRYSTAL_FUNCTIONS == 'YES' ]]
    
    #########################################################################    
    
    #----------------------------------------------------------- 
    # Choose default shell prompt AND Update terminal Titlebar and Tab
    #-----------------------------------------------------------

    # Load the default zsh prompt switching command-line interface
    autoload -U promptinit; promptinit

    # This activates the settitle, settab functions that will persist
    # even if you change to a customizable prompt. 
    # If you don't want to use settab and settitle, then issue the command
    # "touch ~/.zsh/notitletabs" .  Note that the "simple" prompt will over-ride
    # this setting.
    
    if [[ ! -f ~/.zsh/notitletabs ]]; then
        autoload -U set_title_tab
        set_title_tab
    fi
    
    
    # If we have OS X, load the GUI switching interface as well
    
    if [[ $(uname) == "Darwin" ]]; then
        autoload -U  switch_prompt
    fi
    
    # To customize the prompt, copy $ZDOT_TEMPLATE/zshrc.d/prompt to
    # ~/.zsh/zshprompt and modify.  The function switch_prompt automates
    # this procedure.
    
    if [[ -f ~/.zsh/zshprompt ]];then
       source ~/.zsh/zshprompt
    elif [[ -f $ZDOT/zshrc.d/prompt ]];then
       source $ZDOT/zshrc.d/prompt
    else
       source $ZDOT_TEMPLATE/zshrc.d/prompt
    fi

    #########################################################################    
    
    # This alters the default behavior of the  completion
    # functions.   If  set  to  on, words which have more
    # than one possible completion cause the  matches  to
    # be  listed immediately instead of ringing the bell.
    #
    set show-all-if-ambiguous on
    # needed here so it works the first time (why?)
    


    # Now clean up and remove any instances of multiple colons:
    FPATH=${FPATH/::/:}
    FPATH=${FPATH/::/:}
    FPATH=${FPATH/::/:}
    FPATH=${FPATH/::/:}
    FPATH=${FPATH/::/:}
    FPATH=${FPATH/::/:}
    FPATH=${FPATH/::/:}
    # Remove leading : if present
    FPATH=${FPATH#:}  

#
# Export PATH as separate command to avoid dollar signs in export line
#

        export FPATH

#
#
# Avoid repeats in the fpath array
#

        typeset -U fpath
    
fi ## end ## [[ -o interactive ]]

###############################################################################    
###############################################################################
 


