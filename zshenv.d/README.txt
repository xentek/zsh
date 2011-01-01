File:  README

Any file placed inside this directory will be sourced in
alphabetical order from /etc/zshenv  
and will therefore have its contents made available in both
interactive and non-interactive sessions. In other words,
even starting a shell with zsh -f will not prevent the contents
from being sourced. Hence, use considerable care when placing
anything in this directory.

Files with the string "disabled" anywhere in the filename will
be omitted.

To enable a file named foo.disabled, rename it to foo .