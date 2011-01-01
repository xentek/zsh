
        #################################################
        #################################################
        #                                               #
        #        $ZDOT/zshrc.d/aliases.main.zsh         #
        #                                               #
        #################################################
        #################################################


if [[ -o interactive ]]; then

    if [[ -x $SWPREFIX/bin/ls ||   $(uname) != Darwin  && $(uname) != FreeBSD  ]]; then  
        alias ls='ls --color=auto'
    fi

    alias lsa='ls -AFlh'
    alias lsd='ls -AFldh'
    alias conns='sudo lsof -i'
    alias netconns='netstat -a -f inet'
    alias pdsa='ps -axww'
    alias psa='ps -auxww'
    alias psl='ps -alxww'
    alias psj='ps -axjww'
    alias pso='ps -axwwo uid,pid,ppid,pgid,pri,nice,state,time,%cpu,%mem,command'
 

    alias ethereal='sudo ethereal'
    alias cd..='cd ..'
    alias ..='cd ..'
    alias owd='cd "$OLDPWD"'

    # cpan: open the MCPAN shell
    alias cpan='sudo perl -MCPAN -e shell'

    #ipfwls: list rule with stats, timestamps and hostname lookups
    alias ipfwls="sudo ipfw -atN list"

    # compile_clean: cleanup after failed compile
    alias compile_clean='make clean; rm config.log config.status config.h stamp-h config.cache'

    # ciscip: show the ip address of the router
    # replaced with function myip
    # alias ciscip='curl -s http://simple.showmyip.com'
    alias ciscip='myip -r'
    alias myrouter='myip -r'
    alias myairport='myip -r'
    ##
    # uncomment for debugging
    # echo ""; echo "Distributed aliases for zsh are now set"

fi

