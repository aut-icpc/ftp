#!/bin/bash

read -p "Please enter your username in format team-###: " USERNAME

read -p "Enter Password: " PASSWORD

/opt/icpc/ftp-validator.sh ${USERNAME} ${PASSWORD}

if [[ ${?} -ne 0 ]]
then
	echo "Incorrect password, try again"	
	exit 1
fi

CRED=$(echo -e "${USERNAME}\t${PASSWORD}")

echo "Proccessing ${CRED}"

echo ${CRED} > $HOME/cred

echo "Saved cred info"

exit 0
