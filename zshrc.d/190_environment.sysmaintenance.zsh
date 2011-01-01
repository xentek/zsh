

 		###################################################################
 		###################################################################
 		####   System maintenance prompts to check if up to date.    ######
 		###################################################################
 		###################################################################



if [[ -o interactive && $( id -Gn ) == *admin* ]]; then

	# Check to see if locate_database exists, and if it is younger that two weeks old.   
	# If not, prompt user to run the periodic maintenance scripts. These get run
	# automatically if your computer is on at 3 am. Otherwise, you have to do it somehow:

	if [[  $(uname) == Darwin &&  $(sw_vers -productVersion) < 10.6    ]];then
		if [[ /var/db/locate.database == $( ls /var/db/locate.database(.mw-2) ) ]];then
			:  # Do nothing, database is younger than two weeks old
		else 
			print ""
			if [[ ! -f /var/db/locate.database ]];then
				print "\e[1m  No locate.database found"
				print ""
			else
				print "\e[1m  System maintenance scripts haven't been run for two weeks."
				print ""
			fi
			print ""
			print "  Please run the system periodic maintenance scripts as soon as possible."
			print ""
			print -n "  Shall I do this for you? \e[0m [y/N] "
			print ""

			user_task_yes=( sudo periodic monthly daily weekly  )
			user_task_no=(   )

			timeout=15 # second until default answer takes effect

			        answer=""
			        read -t $timeout -A answer

			        if [[ $answer[1] == (y|Y) ]]; then
						print ""
						print "Issuing \e[1m sudo periodic monthly daily weekly \e[0m now"
			            $user_task_yes
						print ""
			            answer=""
			        else
			            $user_task_no
						print ""
						print "Issue \e[1m sudo periodic monthly daily weekly \e[0m at your convenience"
						print ""
			            answer=""
			        fi
		fi
	fi
fi # [[ -o interactive ]]     
   
    
 