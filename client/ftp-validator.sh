#!/bin/bash

lftp 172.23.134.245 -u "${1},${2}" > /dev/null 2>&1 <<END
ls
bye
END

if [[ ${?} -ne 0 ]]
then
	exit 1
else
	exit 0	
fi

	
