Put any shell script (i.e., with #!/bin/zsh as the first line) into this
directory and it will be auto-loaded as a zsh function with the name of the
file (leave off the .zsh suffix). To modify an existing function, simply copy
it into this directory and then edit the file. It will come first in the $FPATH
and will thus replace the previous version automatically on subsequent shell
initializations.