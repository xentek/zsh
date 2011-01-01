#
# For XtalView
#

if [[ -z $XTALVIEWHOME ]]; then
    
    if [[ -d /usr/local/xtalview/XtalView ]];then
        XTALVIEWHOME=/usr/local/xtalview/XtalView
    else 
		if [[ -f /var/db/locate.database ]];then
        	XTALVIEWHOME=$(locate XtalView | head -n 1 )
		else
			XTALVIEWHOME=$(mdfind "kMDItemFSName == 'XtalView'" | head -n 1 )
		fi
    fi
    
    if [[ -d $XTALVIEWHOME ]];then
    
        CRYSTALDATA=$XTALVIEWHOME/xtal_info
        CRYSTAL=cvccp
		if [[ -f /var/db/locate.database ]];then
        	JUNK1=$(locate xfit_340_update.script | head -n 1 )
		else
	        JUNK1=$( mdfind "kMDItemFSName == '*xfit_340_update.script*'" | head -n 1 )
		fi
	if [[ -f $JUNK1 ]];then
	        XTALVIEWPATH1=$(dirname $JUNK1)
	fi
        # XTALVIEWPATH2=$XTALVIEWHOME/bin/share  
        # PATH=$XTALVIEWPATH1:$XTALVIEWPATH2:$PATH
        PATH=$PATH:$XTALVIEWPATH1
        XFITDICT=$XTALVIEWHOME/data/dict.pdb
        XFITPENTDIR=$XTALVIEWHOME/data/pdbvec
    
        export XTALVIEWHOME CRYSTALDATA CRYSTAL PATH XFITDICT XFITPENTDIR
		
		# print "\e[1m Using $ZDOT/environment.xtal/xtalview.xtal.zsh to initialize XtalView \e[0m "

    
    fi
fi



