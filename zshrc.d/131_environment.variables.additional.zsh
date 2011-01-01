

# File environment.variables.additional.zsh
# Add system-specific environment and path variables to this file

 
 
###################################################################
####   First stuff for all sessions (even non-interactive)   ######
###################################################################
 
    
    #    For CVS:
    	export CVS_RSH=ssh

	# If you have a configuration file in /usr/local/bin
	  if [[ -f /usr/local/bin/init.sh ]];then
			source /usr/local/bin/init.sh
	  fi
		
	# This is specific for crystallographers:
	  if [[ -f /usr/local/xtal/bin/init.sh ]];then
			source /usr/local/xtal/bin/init.sh
	  fi
	
	# 	Use this construct to APPEND to current PATH:

	    if [[ -d /example/path/bin ]]; then
	        PATH=$PATH:/example/path/bin
	    fi
	
	#  Use this construct to APPEND to current FPATH:
 
	    if [[ -d /Path/To/another/location/functions ]]; then
	      FPATH=$FPATH:/Path/To/another/location/functions
	    fi
	
	# Avoid repeats in the path
	    export PATH FPATH

	    typeset -U path fpath	
	
###################################################################
	
	###################################################################
	####       Now stuff for only the interactive sessions       ######
 	###################################################################
	
if [[ -o interactive ]]; then
	
	###################################################################
	####  Local Darin-specific environment configuration         ######
	###################################################################  

 
	 if [[ $(uname) == Darwin ]];then 

		 if [[ -d $SWPREFIX/fink ]]; then
			export localfink=$SWPREFIX/fink/dists/local/main/finkinfo
		    export unstablefink=$SWPREFIX/fink/dists/unstable/main/finkinfo
		    export stablefink=$SWPREFIX/fink/dists/stable/main/finkinfo
		    export oldfink=$SWPREFIX/fink/10.2-gcc3.3/unstable/main/finkinfo 
		 fi
 
	    export desktop='~/Desktop'
	    export Desktop='~/Desktop'
	    export public_html='~/public_html'
    
 
	    #  Crystallography stuff moved to the file environment.xtal.d
	    #  Everything is off by default.  To activate a file, do this:

	    #  mv foo.zsh.disabled  foo.zsh

	    if [[ -d "${ZDOT}/zshenv.d/environment.xtal.d" ]]; then
			foreach file in $(command ls ${ZDOT}/zshrc.d/environment.xtal.d/* | grep -v disabled | grep -v README | grep -v 00master )
			    source $file
			    # print "sourcing $file"  # un-comment for debug
			end
		fi
 


 
	    #############################################################################
	    #
	    #  Local Java CLASSPATH variables:
	    #
	    #############################################################################
 
	    # Gary Kerbaugh's Java stuff   
	    # {====>}
	    # JAVA_CMD=/usr/bin/java
        # 
	    # JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home 
	    # export JAVA_HOME
        # 
	    # CLASSPATH=$CLASSPATH:/System/Library/Frameworks/JavaVM.framework/Home:/System/Library/Frameworks/JavaVM.framework/Classes/classes.jar:/System/Library/Frameworks/JavaVM.framework/Classes/ui.jar:.
        # 
	    # export  CLASSPATH
 
	    # JBOSS_CLASSPATH=/Developer/jboss/bin
	    # JIKESPATH=.:/System/Library/Frameworks/JavaVM.framework/Classes/classes.jar:/System/Library/Frameworks/JavaVM.framework/Classes/ui.jar:/Developer/jakarta-tomcat-4.0.3/common/lib/servlet.jar:/Developer/jakarta-tomcat-4.0.3/common/lib/xerces.jar:/Library/Java/Extensions/activation.jar:/Library/Java/Extensions/jdbc2_0-stdext.jar:/Library/Java/Extensions/pgjdbc2.jar:/System/Library/Frameworks/JavaVM.framework/Home/lib/dt.jar:/System/Library/Frameworks/JavaVM.framework/Home/lib/ext/jnet.jar:/System/Library/Frameworks/JavaVM.framework/Versions/1.3.1/Home/lib/ext/jpda.jar:/System/Library/Frameworks/JavaVM.framework/Versions/1.3.1/Home/lib/ext/jsse.jar
 
	    # export JIKESPATH  
	    # *************************************************************************
 
	 fi # [[ $(uname) == Darwin ]]

fi  #  [[ -o interactive ]]
 
 
