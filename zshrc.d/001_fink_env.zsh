# Disable this file by renaming it to fink_env.disabled

# Change the absolute path if you have installed in a non-standard location.

# If fink is not installed in /sw, the alternative directory must be set here.
# Fink installation does this automatically.

if [[  $(uname) == Darwin ]]; then

    if [[ -d /sw/fink ]]; then
        export SWPREFIX='/sw'
    else
        export SWPREFIX='ALT_SWPREFIX'
    fi
fi



if [[ $(uname) == Darwin   &&  -f ${SWPREFIX}/bin/init.sh ]];then
    source ${SWPREFIX}/bin/init.sh
fi