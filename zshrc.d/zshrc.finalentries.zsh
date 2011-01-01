
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


####################################
#                                  #
#  Prompt new user to configure:   #
#                                  #
####################################

 
if [[ ! -f ~/.zsh/configure_zsh_templates &&  $(uname) == Darwin  && -z $SSH_CONNECTION && -o interactive ]]; then

	dialogue_text=( Please take a moment to customize your ZSH environment on OS X \? )

	answer1=$(osa_display_dialog "Never" "Not now" "Yes please")

	if [[ "$answer1" == "Never"  ]]; then	
		mkdir -p ~/.zsh
		touch ~/.zsh/configure_zsh_templates
		print "Issue the command"
		print "\e[1m configure_zsh_templates \e[0m "
		print "if you decide to give this a try."
	elif [[ "$answer1" == "Not now"  ]]; then
		print "Leaving this setting unchanged."
    else
		autoload -U configure_zsh_templates
		configure_zsh_templates
	fi
fi
 
