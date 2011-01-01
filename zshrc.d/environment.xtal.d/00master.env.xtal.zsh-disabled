# Individualized xtal environment setup.

# You shouldn't run this unless you need the environment set up for one or more of the
# programs it contains.


# ccp4
if [[ -z $CCP4 ]];then
	if [[ -f "$SWPREFIX/etc/profile.d/ccp4.sh" ]]; then
		source $SWPREFIX/bin/init.sh
	elif [[ -f "$ZDOT/environment.xtal/ccp4.xtal.zsh" ]]; then
		source "$ZDOT/environment.xtal/ccp4.xtal.zsh"
	fi
fi


# cns1.2
if [[ -z $CNS_SOLVE ]];then
	if [[ -f "$SWPREFIX/etc/profile.d/cns.sh" ]]; then
		source $SWPREFIX/bin/init.sh
	elif [[ -f "$ZDOT/environment.xtal/cns1.2.xtal.zsh" ]];then 
		source "$ZDOT/environment.xtal/cns1.2.xtal.zsh" 
	fi
fi


# eden
if [[ -z $EDENHOME ]];then
	if [[ -f "$SWPREFIX/etc/profile.d/eden.sh" ]]; then
		source $SWPREFIX/bin/init.sh
	elif [[ -f "$ZDOT/environment.xtal/eden.xtal.zsh" ]];then 
		source  "$ZDOT/environment.xtal/eden.xtal.zsh"
	fi
fi


# modeller
if [[ -z $MODINSTALL* && -f "$ZDOT/environment.xtal/modeller.xtal.zsh" ]];then 
	source "$ZDOT/environment.xtal/modeller.xtal.zsh"
fi


# ono
if [[ -z $ODAT && $(which ono | grep autoload | awk '{print $1}' ) != builtin && $(which ono | grep "toodle_pip &" | awk '{print $1}') != toodle_pip  ]];then
	if [[ -f "$ZDOT/environment.xtal/ono.xtal.zsh" ]];then 
		source "$ZDOT/environment.xtal/ono.xtal.zsh"
	fi
fi

# phenix

if [[ -d /usr/local && $(command ls /usr/local) == *phenix-* ]];then
	if [[ -d $( command ls -1td /usr/local/phenix-* | head -n 1 )   ]]; then
		if [[ -f "$ZDOT/environment.xtal/phenix_env.zsh" ]]; then 
			source  "$ZDOT/environment.xtal/phenix_env.zsh"
			export DYLD_LIBRARY_PATH=""   # Clean up the mess.  This is un-needed.
		fi
	fi
fi

# ribbons
if [[ -z $RIBBONS_HOME && -f "$ZDOT/environment.xtal/ribbons.xtal.zsh" ]];then 
	source "$ZDOT/environment.xtal/ribbons.xtal.zsh" 
fi


if [[ -z $RNAVIEW ]];then
	if [[ -f "$SWPREFIX/etc/profile.d/rnaview.sh" ]]; then
		source $SWPREFIX/bin/init.sh
	elif [[ -f "$ZDOT/environment.xtal/rnaview.xtal.zsh" ]];then 
		source "$ZDOT/environment.xtal/rnaview.xtal.zsh" 
	fi
fi


# xtalview
if [[ -z $XTALVIEWHOME && -f "$ZDOT/environment.xtal/xtalview.xtal.zsh" ]];then 
	source "$ZDOT/environment.xtal/xtalview.xtal.zsh"
fi



