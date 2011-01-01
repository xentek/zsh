
#####################################
#
#  For CNS 1.2:
#

if [[ -z $CNS_SOLVE ]];then

	#######################################
	# CNS 1.2 obtained from David Gohara  #
	# <http://gohara.wustl.edu/software.html>
	#######################################

	if [[ -d /usr/local/xtal/cns1.2_univ ]];then
	
		CNS_SOLVE="/usr/local/xtal/cns1.2_univ"
		export CNS_SOLVE
	
 	elif [[ -d /usr/local/cns1.2_univ ]];then
	
		CNS_SOLVE="/usr/local/cns1.2_univ"
		export CNS_SOLVE
		
		
	elif [[ -d /usr/local/xtal/cns_solve_1.2 ]];then
	
		CNS_SOLVE=/usr/local/xtal/cns_solve_1.2
    	export CNS_SOLVE
	
	elif [[ -d /usr/local/cns_solve_1.2 ]];then

		CNS_SOLVE=/usr/local/cns_solve_1.2
		export CNS_SOLVE	
	
	elif [[ -d /usr/local/xtal/cns/1.2 ]];then
	
		CNS_SOLVE=/usr/local/xtal/cns/1.2
		export CNS_SOLVE	
	
	elif [[ -d /usr/local/cns/1.2 ]];then
	
		CNS_SOLVE=/usr/local/cns/1.2
		export CNS_SOLVE	
		
	elif [[ -d /usr/local/xtal/1.2 ]];then

		CNS_SOLVE=/usr/local/xtal/1.2
		export CNS_SOLVE	

	elif [[ -d /usr/local/1.2 ]];then

		CNS_SOLVE=/usr/local/1.2
		export CNS_SOLVE
	
	# Obsolete version

    elif [[ ! -x $SWPREFIX/etc/profile.d/cns.sh ]]; then
    
        if [[ -d /usr/local/cns_solve_1.1 ]];then
            CNS_SOLVE=/usr/local/cns_solve_1.1
            export CNS_SOLVE
        elif [[ -d $(locate cns_solve_1.2 | head -n 1) ]];then
            CNS_SOLVE=$(locate cns_solve_1.2 | head -n 1)
            export CNS_SOLVE
        elif [[ -d $(locate cns_solve_1.1 | head -n 1) ]];then
            CNS_SOLVE=$(locate cns_solve_1.1 | head -n 1)
            export CNS_SOLVE
        fi 
    elif [[ -x $SWPREFIX/etc/profile.d/cns.sh ]]; then
        source $SWPREFIX/etc/profile.d/cns.sh
    fi
    
    if [[ -n $CNS_SOLVE ]];then
    
        export CNS_LIB=$CNS_SOLVE/libraries
        export CNS_MODULE=$CNS_SOLVE/modules
        export CNS_TOPPAR=$CNS_LIB/toppar
        export CNS_CONFDB=$CNS_LIB/confdb
        export CNS_XTALLIB=$CNS_LIB/xtal
        export CNS_NMRLIB=$CNS_LIB/nmr
        export CNS_XRAYLIB=$CNS_LIB/xray
        export CNS_XTALMODULE=$CNS_MODULE/xtal
        export CNS_NMRMODULE=$CNS_MODULE/nmr
        export CNS_HELPLIB=$CNS_SOLVE/helplib
				if [[ $(uname -p) == powerpc && -d $CNS_SOLVE/mac-ppc-darwin/utils ]];then
					CNS_UTILS_PATH="$CNS_SOLVE/mac-ppc-darwin/utils"
				elif [[ $(uname -p) == i386 && -d $CNS_SOLVE/mac-intel-darwin/utils ]];then
						CNS_UTILS_PATH="$CNS_SOLVE/mac-intel-darwin/utils"
                elif [[ -f $(/bin/ls $CNS_SOLVE/*/utils/plot_patterson) ]];then
                    CNS_UTILS_PATH=$( dirname $(/bin/ls $CNS_SOLVE/*/utils/plot_patterson) )
                elif [[ -f $(/bin/ls $CNS_SOLVE/utils/plot_patterson) ]];then
                    CNS_UTILS_PATH=$( dirname $(/bin/ls $CNS_SOLVE/utils/plot_patterson) )
                fi
        export CNS_UTILS_PATH
 
               PATH=$PATH:$CNS_SOLVE/bin:$CNS_UTILS_PATH:.
                # Better to apend than prepend this path, as $CNS_SOLVE/bin/install will 
                # break your future installs of other software!  Better yet, gzip it.
                
        export PATH
		# print "\e[1m Using $ZDOT/environment.xtal/cns1.2.xtal.zsh to initialize cns \e[0m "
    
    fi
fi 
#
#
#######################  (end of CNS initialization ) ########################

