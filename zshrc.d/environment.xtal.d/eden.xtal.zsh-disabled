#################################### 
#
#  For Eden:

if [[ -z $EDENHOME ]];then
    if [[ -d $(locate eden/source | head -n 1) ]];then
        EDENHOME=$(dirname $(locate eden/source | head -n 1))
    fi
    if [[ -x $(locate seden) ]];then
        PATH=$PATH:$(dirname $(locate seden))
    fi
    export EDENHOME PATH
	# print "\e[1m Using $ZDOT/environment.xtal/eden.xtal.zsh to initialize eden \e[0m "
fi


#####################################