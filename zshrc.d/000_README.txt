File:  README

Any file placed inside this directory will be sourced in
ALPHABETICAL order from /etc/zshrc  
and will therefore have its contents made available in
interactive sessions unless the -f flag is used when invoking zsh. 
In other words, starting a shell with zsh -f will prevent the contents
from being sourced.  

Files with the string "disabled" anywhere in the filename will
be omitted.

To enable a file named foo.disabled, rename it to foo .