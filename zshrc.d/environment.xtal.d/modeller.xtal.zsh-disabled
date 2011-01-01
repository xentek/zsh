##################################
#
#       Modeller:
#

if [[ -z $MODINSTALL6v2 && -d /usr/local/bin/modeller6v2 ]]; then
    export MODINSTALL6v2=/usr/local/bin/modeller6v2
    export EXECUTABLE_TYPE6v2=mac10v2-absoft
    export LIBS_LIB6v2=$MODINSTALL6v2/modlib/libs.lib
    export KEY_MODELLER6v2=MODELIRANJE
fi

if [[ -n $MODINSTALL6v2 ]]; then
    PATH=$PATH:$MODINSTALL6v2/bin
	# print "\e[1m Using $ZDOT/environment.xtal/modeller.xtal.zsh to initialize Modeller \e[0m "
fi


#export PDBVIEWER=/Applications/PyMOL/Darwin/pymol.com

###################################