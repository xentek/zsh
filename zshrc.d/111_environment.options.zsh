
 
         #################################################
         #################################################
         #                                               #
         #    $ZDOT/zshrc.d/environment.options.zsh      #
         #                                               #
         #################################################
         #################################################



# File:  $ZDOT/zshrc.d/environment.options.zsh 

# sourced from /etc/zshrc

# Version: 2.0.0

###############################################################################

#  Created by William G. Scott on January 2, 2009.
#  Copyright (c) . All rights reserved.


#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
#    USA
#    
#    cf. URL:   http://www.fsf.org/licensing/licenses/gpl.html
#
###############################################################################


##########################################################################
#
#             Most of what follows is distributed with ZSH:
#             Housekeeping, Completions, environment Options,
#             Keybindings and and zstyles
#
##########################################################################



if [[ -o interactive ]]; then

    function _exit()        # function to run upon exit of shell
    {
        echo -e "[1;31mHasta la vista, baby![0m"
    }
    trap _exit 0

    HISTSIZE=500
    #HISTFILE=~/.zsh/zsh_history
    if (( ! EUID )); then
        HISTFILE=~/.zsh/zsh_history_root
    else
        HISTFILE=~/.zsh/zsh_history
    fi    
    SAVEHIST=500
    export HISTFILE HISTSIZE SAVEHIST
        
    #-------------------
    # custom completions
    #-------------------
    
    # Load our additional cusom completions here
    compctl -D -f + -U -Q -K multicomp
    
    # I have removed compctl from the distribution and moved everything into
    # zsh completion functions, so this is for any legacy script.
    
    if [[ -f $ZDOT/compctl ]];then 
      source $ZDOT/compctl
    fi

    ZSH_VERSION_TYPE=new

     
    # {{{ Profiling

    [[ -n "$ZSH_PROFILE_RC" ]] && which zmodload >&/dev/null && zmodload zsh/zprof

    # }}}
    # {{{ Loading status

    zshrc_load_status () {
      # \e[0K is clear to right
      # echo -n "\r$ZDOT/environment load: $* ... \e[0K"   #uncomment to debug
    }

    # }}}
    
    # {{{ Options
    
    #---------------------------------
    # setting zsh environment options
    #---------------------------------

    zshrc_load_status 'setting options'

    setopt                       \
            append_history       \
            auto_list            \
            auto_menu            \
            auto_param_keys      \
         NO_auto_pushd           \
            bad_pattern          \
            bang_hist            \
            brace_ccl            \
            correct_all          \
            cdable_vars          \
         NO_chase_links          \
         NO_clobber              \
            complete_in_word     \
         NO_csh_junkie_loops     \
         NO_csh_junkie_quotes    \
         NO_csh_null_glob        \
            extended_glob        \
            function_argzero     \
            glob                 \
         NO_glob_assign          \
            glob_complete        \
         NO_glob_dots            \
         NO_glob_subst           \
            hash_cmds            \
            hash_dirs            \
            hash_list_all        \
            hist_allow_clobber   \
            hist_beep            \
         NO_hup                  \
         NO_ignore_braces        \
            ignore_eof           \
            interactive_comments \
         NO_list_ambiguous       \
            list_types           \
            long_list_jobs       \
            magic_equal_subst    \
         NO_mark_dirs            \
            multios              \
            nomatch              \
            nohup                \
            notify               \
         NO_null_glob            \
            path_dirs            \
            posix_builtins       \
         NO_print_exit_value     \
            pushd_ignore_dups    \
         NO_pushd_minus          \
            pushd_to_home        \
            rc_expand_param      \
         NO_rc_quotes            \
         NO_rm_star_silent       \
         NO_sh_file_expansion    \
            short_loops          \
         NO_single_line_zle      \
         NO_sun_keyboard_hack    \
            unset                \
         NO_verbose                 
    #        zle       \
    #     NO_all_export           \
    #        always_last_prompt   \
    #     NO_always_to_end        \
    #     NO_auto_cd              \
    #     NO_auto_name_dirs       \
    #        auto_param_slash     \
    #        auto_remove_slash    \
    #     NO_auto_resume          \
    #     NO_beep                 \
    #     NO_bsd_echo             \
    #        complete_aliases     \
    #     NO_correct              \
    #        csh_junkie_history   \
    #        equals               \
    #        extended_history     \
    #        hist_ignore_dups     \
    #        hist_ignore_space    \
    #     NO_hist_no_store        \
    #        hist_verify          \
    #        share_history        \
    #     NO_ignore_eof           \
    #     NO_list_beep            \
    #     NO_mail_warning         \
    #     NO_menu_complete        \
    #        numeric_glob_sort    \
    #     NO_overstrike           \
    #     NO_prompt_cr            \
    #        prompt_subst         \
    #        pushd_silent         \
    #        sh_option_letters    \
    #        NO_sh_word_split     \

    if [[ $ZSH_VERSION_TYPE == 'new' ]]; then
      setopt hist_reduce_blanks
    fi

   
    # {{{ Watching for other users

    LOGCHECK=60
    WATCHFMT="[%B%t%b] %B%n%b has %a %B%l%b from %B%M%b"

    # }}}
    # {{{ Completions
    
    #--------------------------
    # standard zsh completions
    #--------------------------

    zshrc_load_status 'completion system'

   

     
     autoload -U compinit
     compinit -C # don't perform security check
      
    #   
    # {{{ (host, port, user) triples for telnet

    telnet_users_hosts_ports=(
    )
    zstyle ':completion:*:*:telnet:*' users-hosts-ports $telnet_users_hosts_ports
 


    # reverse unwanted aliasing of `which' by distribution startup
    # files (e.g. /etc/profile.d/which*.sh); zsh's which is perfectly
    # good as is.

    alias which >&/dev/null && unalias which

    # }}}
    # {{{ run-help

    alias run-help >&/dev/null && unalias run-help
    autoload run-help

    # }}}

    # {{{ Restarting zsh or bash; reloading .zshrc or functions

    bash () {
      NO_SWITCH="yes" PS1='\h:\W \u\$ ' command bash "$@"
    }

    restart () {
      exec $SHELL -l  $SHELL_ARGS "$@"
    }

    profile () {
      ZSH_PROFILE_RC=1 $SHELL "$@"
    }

    reload () {
      if [[ "$#*" -eq 0 ]]; then
        . $zdotdir/.zshrc
      else
        local fn
        for fn in "$@"; do
          unfunction $fn
          autoload -U $fn
        done
      fi
    }
    compdef _functions reload
  
fi
    # }}}

 # }}}

