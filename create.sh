#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : create.sh
#
# [] Creation Date : 03-05-2019
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================


while read -r -a up
do
    echo "'${up[0]}'"
    echo "'${up[1]}'"

    if [ $(id -u) -eq 0 ]; then
    	username="${up[0]}"
    	password="${up[1]}"
    	egrep "^$username" /etc/passwd >/dev/null
    	if [ $? -eq 0 ]; then
    		echo "$username exists!"
    		continue
    	else
    		useradd -m $username -s /bin/bash
		echo $username:$password | chpasswd
    		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
    	fi
        mkdir /home/$username/ftp
        chown nobody:nogroup /home/$username/ftp
        chmod a-w /home/$username/ftp
        mkdir /home/$username/ftp/files
	touch /home/$username/ftp/files/README.txt
        chown -R $username:$username /home/$username/ftp/files
        echo "if you see this file it means your ftp user is active!"
    else
    	echo "Only root may add a user to the system"
    	exit 2
    fi
done
