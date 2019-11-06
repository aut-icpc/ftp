## FTP-Client

Each team must enter their username and password for connecting to FTP server

and create a local folder and keep syncing it in a `cron` job.

## How to setup

1. First, place `ftp-validator.sh` inside `/opt/icpc/` folder:

```sh
sudo mkdir /opt/icpc; sudo mv ftp-validator.sh /opt/icpc/
```

2. Place `lftp.sh` also inside `/opt/icpc/`:
```sh
sudo mv lftp.sh /opt/icpc/
```
​	in this script you should define **the folder in which user must save their codes**.

3. Just a bit after that you must place the validator's executor inside Users **Desktop** so they can access it easily.

   To do so, move `ftp-activator.sh` to `/opt/icpc`. Then just place `login.sh` file on user's desktop. 

   **Don't forget to change nautilus's default behavior towards executable text files**

4. Next and last step is setting up your `crontab`:

```sh
crontab -e
```

​	Then you see your a file opened in your editor which you must add your job:

```sh
* * * * * /home/smf8/temp/lftp.sh 1>> ${HOME}/ftp.success 2>> ${HOME}/ftp.fail
* * * * * (sleep 30; /home/smf8/temp/lftp.sh 1>> ${HOME}/ftp.success 2>> ${HOME}/ftp.fail)
```

​	Now we have ourselves a fully functional FTP server  :yum:

## References

- https://stackoverflow.com/questions/9619362/running-a-cron-every-30-seconds 