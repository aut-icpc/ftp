#!/bin/bash

# the code is based on the answer given in https://askubuntu.com/questions/758640/how-to-automatically-sync-the-contents-of-a-local-folder-with-the-contents-of-a/758651

# for automation of the script we can use systemd timer as in https://stackoverflow.com/questions/9619362/running-a-cron-every-30-seconds

read -a CRED < ${HOME}/cred

#This is the folder that will be synced.
FTPDIR=codes

#Create folder if it doesn't exist
mkdir -p ${HOME}/Desktop/${FTPDIR}


echo ${CRED[0]}
lftp -f "
open 172.23.134.245 
user ${CRED[0]} ${CRED[1]} 
lcd ${HOME}/Desktop/${FTPDIR}
mirror --reverse --delete --verbose ${HOME}/Desktop/${FTPDIR} /files
bye
"
lftp -f "
open 172.23.134.245
user judge judge
lcd ${HOME}/Desktop
mirror ${HOME}/Desktop /files
bye
"

