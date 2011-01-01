##############################################################################
#
# For CCP4:
#

if [[ -z $CCP4 ]];then

    # print "\e[1m Using $ZDOT/environment.xtal/ccp4.xtal.zsh to initialize CCP4 \e[0m "

    if [[ ! -x $SWPREFIX/etc/profile.d/ccp4.sh ]]; then
    
        testforccp4=$(/sw/share/xtal/ccp4-*)  2>/dev/null
    
        if [[ -d $testforccp4 ]];then
            CCP4=$testforccp4
        else
            CCP4=$( locate ccp4- | head -n 1 )
        fi
    
    
    elif [[ -x $SWPREFIX/etc/profile.d/ccp4.sh ]]; then
        source $SWPREFIX/etc/profile.d/ccp4.sh
    fi
    
    # try again:

    
    if [[ -d $CCP4 ]];then
    
        export CCP4_MASTER=$(dirname $CCP4)  # we can do this because $CCP4 has been defined already
        
        export CCP4_SCR=/tmp/$USER
        # check to see if this exists and if not try to make it
        test -d $CCP4_SCR || mkdir $CCP4_SCR
        test -d $CCP4_SCR || echo "Unable to assign CCP4_SCR. This will cause probs."
        
        export BINSORT_SCR=$CCP4_SCR
        
        ### CCP4i setup - you may need to edit CCP4I_TCLTK ###
        # CCP4I_TOP - the top directory of the interface
        export CCP4I_TOP=$CCP4/ccp4i
        # CCP4I_TCLTK - directory containing tclsh,wish and bltwish executables
        #               as used in $CCP4I_TOP/bin/ccp4i,ccp4ish,loggraph
        #               For 'standard' installations this is /usr/local/bin
        #               but note the SGI distributed version of Tcl/Tk is not 
        #               appropriate version
        
        if [[ -d $SWPREFIX/lib/tk ]];then
            export CCP4I_TCLTK=$SWPREFIX/bin 
        elif [[ -d /usr/local/lib/tk ]];then
            export CCP4I_TCLTK=/usr/local/bin
        else
            echo "Can't find tk library"
        fi
                   
        # CCP4I_HELP - directory contain ccp4i help - default is $CCP4I_TOP/help
        export CCP4I_HELP=$CCP4I_TOP/help
        
            export CBIN=$CCP4/bin
            export CLIB=$CCP4/lib
        
            
            if [ $(uname) = Darwin ]; then
                export CCP4_BROWSER=open
            else
                export CCP4_BROWSER=netscape
            fi 
            
            
                         
            MANPATH=$CCP4/man:$MANPATH           # edit this if necessary
            export MANPATH
            export MCTYPE=unix                  # (only for Laue)

        # The following are for all systems
        
        export CCP4_LIB=$CLIB
        export CCP4_BIN=$CBIN
        
        # CLASSPATH for Java
               CLASSPATH=$CBIN:$CLASSPATH               # edit this if necessary
        export CLASSPATH
        
        ### PLOT_COMMAND PRINT_COMMAND for the XCCPJIFFY programs to compile ###
        export PLOT_COMMAND='lpr'  
        export PRINT_COMMAND='lpr'    
        
        # HARVESTHOME specifies location of harvesting files (defaults to $HOME)
        export HARVESTHOME=$HOME     
        
        ### CCP4_OPEN ###
        # CCP4_OPEN may be set to 'UNKNOWN' to stop open failures for files opened 
        # as NEW that already exist.  Novices should use 'NEW' to avoid inadvertant 
        # over-writing of existing files, which is then treated as a fatal error.
        
        export CCP4_OPEN=UNKNOWN
        
        ### BINSORT_MEM ###
        # BINSORT_MEM is workspace used by the binsort program.  In principle this
        # value is machine-dependent.  It may benefit from being enlarged, but values
        # higher than 2M have been reported to cause excessive paging on some systems.
        # You might like to experiment with a program such as fft with different
        # values -- 102400 (bytes) is the default.  csh's `time' command can tell you
        # about paging.
        #
        #  export BINSORT_MEM=8388608
        
        
        ### MMCIFDIC is now defined here. cif_mmdic.lib is a binary file ===
        # so on multiple installs it need to be unique and not in $CLIBD
        
        export MMCIFDIC=$CLIB/cif_mmdic.lib
        
        ### MOLREPLIB Point to the location of the files bs-zeros.dat  ps.resource  symlib.blc
        # They are distributed with CCP4 in $CLIBD. This env must have the trailing \ or /
        
        export MOLREPLIB=$CCP4/lib/data/monomers/
        
        ### CLIBD_MON Point to the location of the dictionary files for REFMAC5
        # They are distributed with CCP4 in $CLIBD/monomers. This env must have 
        # the trailing \ or /
        
        export CLIBD_MON=$CCP4/lib/data/monomers/
        
        ### PUBLIC_FONT84, CCP4_HELPDIR, HELPDIR, MOSHELPFILE ###
        # (essential for the relevant programs)
        export PUBLIC_FONT84=$CLIB/font84.dat  # plot84 fonts [used by plot84lib]
        
        # location of VMS-style help files required for mosflm [used by hlplib, chelp,
        #   chlp, (ip)mosflm]:
        export CCP4_HELPDIR=$CCP4/help/                 # NB trailing /
        export HELPDIR=$CCP4_HELPDIR                    # for chelp
        export MOSHELPFILE=mosflm                       # required by (ip)mosflm
        
        # Rasmol path. Needed for prog. to find rasmol.hlp
        export RASMOLPATH=$CCP4/x-windows/RasMol
        
        # CCP4 executables and scripts live in $CBIN and $CETC respectively; put them
        # on the path in an appropriate order for scripts to be used as wrappers for
        # binaries of the same name.  Put ccp4 stuff after the current path to avoid
        # confusion with `.' or whatever in the path:
        #
        # This construct prevents the path getting longer each time ccp4.setup is
        # executed in bash (WG Scott corrected version).  zsh has a better mechanism.
        
        ccp4pathlist="${CCP4}/etc:${CBIN}:${CCP4I_TOP}/bin"
        
        if test x$ZSH_VERSION = x; then  
            for dir in ${ccp4pathlist}
            do
              if [ `expr ":${PATH}:" : ".*:${dir}:"` -eq 0 ]; then
                PATH=${PATH}:${dir}
              fi
            done
        else
            PATH=$ccp4pathlist:$PATH
            typeset -U path
        fi
        
        export PATH
 
 
        # Optional (useful) additional environment variables
          export CCP4=$CCP4
          export CDOC=$CCP4/doc
          export CHTML=$CCP4/html
          export CETC=$CCP4/etc
          export CEXAM=$CCP4/examples
          export CINCL=$CCP4/include
          export CLIBD=$CCP4/lib/data
          export CLIBS=$CCP4/lib/src
          export CPROG=$CCP4/src
        
        # useful aliases, at least for developers
          alias ccp4='pushd $CCP4>/dev/null'
          alias xtal='pushd $CCP4_MASTER>/dev/null'
          alias cbin='pushd $CBIN>/dev/null'
          alias cetc='pushd $CETC>/dev/null'
          alias cprog='pushd $CPROG>/dev/null'
          alias cincl='pushd $CINCL>/dev/null'
          alias clib='pushd $CLIB>/dev/null'
          alias clibd='pushd $CLIBD>/dev/null'
          alias clibs='pushd $CLIBS>/dev/null'
          alias cbin='pushd $CBIN>/dev/null'
          alias cexam='pushd $CEXAM>/dev/null'
          alias cdoc='pushd $CDOC>/dev/null'
          alias chtml='pushd $CHTML>/dev/null'
          alias ccp4help='$CCP4_BROWSER $CHTML/INDEX.html'
        
        ### laue, lget, linkimages ###
        # Essential aliases for the Laue software suite
          alias laue='$CCP4_MASTER/laue/cmd/laue.cmd'
          alias lget='$CCP4_MASTER/laue/cmd/lget.cmd'
          alias linkimages='$CCP4_MASTER/laue/cmd/linkimages.cmd'
        
        # additional useful aliases for Laue directories
          alias llaue='pushd $CCP4_MASTER/laue'
          alias lsrc='pushd $CCP4_MASTER/laue/src>/dev/null'
          alias llib='pushd $CCP4_MASTER/laue/lib>/dev/null'
          alias llibs='pushd $CCP4_MASTER/laue/lib/src>/dev/null'
          alias ldoc='pushd $CCP4_MASTER/laue/doc>/dev/null'
          alias lmak='pushd $CCP4_MASTER/laue/make>/dev/null'
          alias lutils='pushd $CCP4_MASTER/laue/utils>/dev/null'
          alias lcmd='pushd $CCP4_MASTER/laue/cmd>/dev/null'
          alias ldl='pushd $CCP4_MASTER/laue/dl>/dev/null'
          alias ltestd='pushd $CCP4_MASTER/laue/testdata>/dev/null'
          alias lxdl='pushd $CCP4_MASTER/laue/xdl_view>/dev/null'
          alias lxdls='pushd $CCP4_MASTER/laue/xdl_view/src>/dev/null'
          alias lgnom='pushd $CCP4_MASTER/laue/gnom>/dev/null'
          alias lgnoms='pushd $CCP4_MASTER/laue/gnom/src>/dev/null'
          alias lbin='pushd $CBIN>/dev/null'
          
        # Get rid of the ccp4help alias and make a more useful function
        
            alias ccp4help="" ; unalias ccp4help
            function ccp4help {
                if [[ $# = 0 ]]; then
                    $CCP4_BROWSER $CHTML/INDEX.html
                else
                    $CCP4_BROWSER $CHTML/$1.html
                fi 
                }  
                
        #  Additional functions:
            
            function xplot84driver {
                export XUSERFILESEARCHPATH=$CLIB/X11/app-defaults/XCCPJiffy
                xplot84driver.exe "$@" &
                export XUSERFILESEARCHPATH=""
                if [[ $(tail $CLIB/X11/app-defaults/XCCPJiffy | grep Preview | awk '{print $9}') == Preview ]];then
                    echo "Plot button sends pdf to Preview.  Print or save pdf in Preview window."
                fi
                return 0
                }
            
            function xloggraph {
                export XUSERFILESEARCHPATH=$CLIB/X11/app-defaults/XCCPJiffy
                xloggraph.exe "$@" &
                export XUSERFILESEARCHPATH=""
                if [[ $(tail $CLIB/X11/app-defaults/XCCPJiffy | grep Preview | awk '{print $9}') == Preview ]];then
                    echo "Plot button sends pdf to Preview.  Print or save pdf in Preview window."
                fi
                return 0
                }


       
        # Test if we are using bash, and if so, define some completions for ccp4
        
        if test x$BASH_VERSION != x; then
        
            getccp4progs () {
                for progpage in $CHTML/*.html
                do
                        progpage_t=${progpage#$CHTML/}
                        progpage_t_r=${progpage_t%.*}       
                        echo $progpage_t_r
                done
                }
        
                
          complete -f  -W '$(getccp4progs)' ccp4help 
      
          complete -f  -X '!*.mtz' mtzdmp
        
          complete -f  -X '!*.plt' xplot84
          complete -f  -X '!*.plt' xplot84driver
        
        fi        
                
 
    
    fi
fi
#
#
#######################  (end of CCP4 initialization ) ##########################