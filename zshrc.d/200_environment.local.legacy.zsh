##############################################################################
####################        Define $ZDOT_USER           ######################
##############################################################################



    if [[ $(uname) == Darwin ]];then
        ZDOT_USER="$HOME/Library/init/zsh"
    elif [[ $(uname) == Linux ]];then   
        ZDOT_USER='~/.zsh'
    elif [[ $(uname) == FreeBSD ]];then
        ZDOT_USER='~/.zsh'
    fi


    # Only attempt to source files from those directories that really exist.
    # If $ZDOT and $ZDOT_USER are the same directory, we want to avoid doing 
    # this twice.

    if [[ -d $ZDOT_USER/my-functions ]];then
		FPATH=$ZDOT_USER/my-functions:${FPATH}
		export FPATH
    fi

    if [[ -d $ZDOT_USER && $ZDOT_USER != $ZDOT ]];then
        foreach myconfigfile in $ZDOT_USER/*
            source $myconfigfile
        end
    fi

