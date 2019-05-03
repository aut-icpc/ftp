#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : cleanup.sh
#
# [] Creation Date : 03-05-2019
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

while read -r -a up
do
    echo "'${up[0]}'"

    if [ $(id -u) -eq 0 ]; then
    	username="${up[0]}"

    	egrep "^$username" /etc/passwd >/dev/null
    	if [ $? -eq 0 ]; then
    		userdel -r $username
    	else
                echo "There is no user with username $username"
    		continue
    	fi
    else
    	echo "Only root may add a user to the system"
    	exit 2
    fi
done
