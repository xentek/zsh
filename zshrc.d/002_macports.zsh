# Disable this file by renaming it to macports_env.disabled

# Change the absolute path if you have installed in a non-standard location.


if [[ -d /opt/local/sbin ]];then
    PATH=/opt/local/sbin:${PATH}
	export PATH
fi

if [[ -d /opt/local/bin ]];then
    PATH=/opt/local/bin:${PATH}
	export PATH
fi