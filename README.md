# FTP
## Introduction

Each team have a FTP account to store their codes and projects.
These are the configuration and scripts created for this purpose.

## How to run
1. First you must create user for each team:

```sh
cat userpass.tsv | sudo ./create.sh
```

2. Then you must add them into `vsftpd` user list file in etc.

3. Go to Contest :yum:

4. Delete all users with the following command:

```sh
cat userpass.tsv | sudo ./cleanup.sh
```

## References
- https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-18-04
- https://askubuntu.com/questions/617370/why-vsftpd-doesnt-work-when-pam-service-name-vsftpd
- https://www.cyberciti.biz/tips/howto-write-shell-script-to-add-user.html
