File:  README

Any file you create and place inside this directory will be sourced in
ALPHABETICAL order from /etc/zshrc  AFTER  what is currently in
zshenv.d and zshrc.d have been loaded. Its contents will be made available in
interactive sessions unless the -f flag is used when invoking zsh. 
In other words, starting a shell with zsh -f will prevent the contents
from being sourced.  

It is often easiest to change the behavior by re-assigning aliases, styles,
environment variables and functions in this way, rather than editing the
distributed files. (The main exception is if you want to switch to vi key
bindings; do that in zshrc.d please!).

Files with the string "disabled" anywhere in the filename will
be omitted.

To enable a file named foo.disabled, rename it to foo, or just make a symbolic link.

For example, I do this:

   ln -s ../zshrc.d/environment.xtal.d/phenix_env.zsh-disabled     phenix_env.zsh

rather than alter the distributed $ZDOT/zshrc.d  directory.