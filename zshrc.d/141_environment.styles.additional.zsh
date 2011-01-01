
    
				###################################################################
				####                Additional zstyles                       ######
				###################################################################
	
	# Share history between terminal sessions
    # Useful for multi-terminal environment

    	setopt share_history


	    zmodload -i zsh/complist  2>/dev/null
    
	    # Gives menu of possible completions highlighted with reverse
	    # video and navigable via arrow keys when confronted with four
	    # or more possible completions
	    zstyle ':completion:*' menu select=10

	    # Make one-way case insensitivity (for cd and cdd commands) for (Directory) completion
	    #   zstyle ':completion:*:*:*:*' matcher-list 'm:{a-z}={A-Z}' 
	    #   zstyle ':completion:*:*:cd:*' matcher-list 'm:{a-z}={A-Z}' 

	    # For open completion 
	    zstyle ':completion:*:*:open:*' matcher 'm:{a-z}={A-Z} r: ||[^ ]=**' 
    
	    # If you want a Pashua GUI menu of completion options as a default 
	    # for the "open -a Foo.app" command, then set the variable OPEN_PASHUA
	    # to 'yes' by removing the comment sign from the following line:
    
	    # export OPEN_PASHUA='yes'
      
    
	    # If you have more than a page-full of options, this lets you see one
	    # page of them at a time  
	    zstyle ':completion:*' list-prompt '%S -- more -- %s' 
    
	    # This groups sets of completions for alternatives (#globally | for the mdfind command)
	    # zstyle ':completion:*' group-name ''  
	    zstyle ':completion:*:*:_mdfind:*' group-name '' 
    
 
   
 
