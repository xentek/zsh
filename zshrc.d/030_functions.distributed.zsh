                    

        #################################################
        #################################################
        #                                               #
        #    $ZDOT/zshrc.d/functions.distributed.zsh    #
        #                                               #
        #################################################
        #################################################



#  Use this file to load functions that were distributed with zsh that are
#  not loaded by default

if [[ -o interactive ]]; then
    
    autoload -U zcalc
    
    autoload -U zmv 
        # set these associated aliases:
        alias mmv='noglob zmv -W'   # user-friendly version of zmv



 # Distributed functions sorted by category:
 # uncomment the line if you want to use one of these.

    # Misc 
        
        # autoload -U pick-web-browser 
        
    # MIME
        
        # autoload -U zsh-mime-handler 
        # autoload -U zsh-mime-setup 
        # autoload -U allopt 
        # autoload -U checkmail 
        # autoload -U colors 
        # autoload -U getjobs 
        # autoload -U harden 
        # autoload -U is-at-least 
        # autoload -U mere 
        # autoload -U promptnl 
        # autoload -U relative 
        # autoload -U tetris 
        # autoload -U zargs 
        # autoload -U zcalc 
        # autoload -U zed 
        # autoload -U zkbd 
        # autoload -U zrecompile 
        # autoload -U zstyle+ 
        
    # Prompts (these are not normally loaded)
    # Issue "switch_prompt" for a nice OS X gui
        
        # autoload -U prompt_adam1_setup 
        # autoload -U prompt_adam2_setup 
        # autoload -U prompt_bart_setup 
        # autoload -U prompt_bigfade_setup 
        # autoload -U prompt_clint_setup 
        # autoload -U prompt_elite2_setup 
        # autoload -U prompt_elite_setup 
        # autoload -U prompt_fade_setup 
        # autoload -U prompt_fire_setup 
        # autoload -U prompt_off_setup 
        # autoload -U prompt_oliver_setup 
        # autoload -U prompt_redhat_setup 
        # autoload -U prompt_suse_setup 
        # autoload -U prompt_walters_setup 
        # autoload -U prompt_zefram_setup 
        # autoload -U promptinit 
        
    # TCP
        
        # autoload -U tcp_alias 
        # autoload -U tcp_close 
        # autoload -U tcp_command 
        # autoload -U tcp_expect 
        # autoload -U tcp_fd_handler 
        # autoload -U tcp_log 
        # autoload -U tcp_open 
        # autoload -U tcp_output 
        # autoload -U tcp_point 
        # autoload -U tcp_proxy 
        # autoload -U tcp_read 
        # autoload -U tcp_rename 
        # autoload -U tcp_send 
        # autoload -U tcp_sess 
        # autoload -U tcp_shoot 
        # autoload -U tcp_spam 
        # autoload -U tcp_talk 
        # autoload -U tcp_wait 
        
    #  Zftp
        
        
        # autoload -U zfanon 
        # autoload -U zfautocheck 
        # autoload -U zfcd 
        # autoload -U zfcd_match 
        # autoload -U zfcget 
        # autoload -U zfclose 
        # autoload -U zfcput 
        # autoload -U zfdir 
        # autoload -U zffcache 
        # autoload -U zfgcp 
        # autoload -U zfget 
        # autoload -U zfget_match 
        # autoload -U zfgoto 
        # autoload -U zfhere 
        # autoload -U zfinit 
        # autoload -U zfls 
        # autoload -U zfmark 
        # autoload -U zfopen 
        # autoload -U zfparams 
        # autoload -U zfpcp 
        # autoload -U zfput 
        # autoload -U zfrglob 
        # autoload -U zfrtime 
        # autoload -U zfsession 
        # autoload -U zfstat 
        # autoload -U zftp_chpwd 
        # autoload -U zftp_progress 
        # autoload -U zftransfer 
        # autoload -U zftype 
        # autoload -U zfuget 
        # autoload -U zfuput 
        
    # Zle (these are not normally loaded outside of Zle)
        
        # autoload -U backward-kill-word-match 
        # autoload -U backward-word-match 
        # autoload -U capitalize-word-match 
        # autoload -U copy-earlier-word 
        # autoload -U cycle-completion-positions 
        # autoload -U delete-whole-word-match 
        # autoload -U down-case-word-match 
        # autoload -U down-line-or-beginning-search 
        # autoload -U edit-command-line 
        # autoload -U forward-word-match 
        # autoload -U history-pattern-search 
        # autoload -U history-search-end 
        # autoload -U incarg 
        # autoload -U incremental-complete-word 
        # autoload -U insert-files 
        # autoload -U kill-word-match 
        # autoload -U match-words-by-style 
        # autoload -U narrow-to-region 
        # autoload -U narrow-to-region-invisible 
        # autoload -U predict-on 
        # autoload -U quote-and-complete-word 
        # autoload -U read-from-minibuffer 
        # autoload -U replace-string 
        # autoload -U select-word-style 
        # autoload -U smart-insert-last-word 
        # autoload -U transpose-words-match 
        # autoload -U up-case-word-match 
        # autoload -U up-line-or-beginning-search 
        # autoload -U url-quote-magic 
        # autoload -U zed-set-file-name 
        
    # site-functions

fi
