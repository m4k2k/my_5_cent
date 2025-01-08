

# reboot investigation

## investigation

`uptime`
show system up time, current loggedin users

`last --hostlast --dns --system --fullnames --fulltimes --limit 5`
show last 5 login/reboot with users and its hosts

`who -a`
show last reboot and currently loggedin users

## advanced audit trail / get more info next time

Source: https://www.cyberciti.biz/tips/howto-log-user-activity-using-process-accounting.html

debian install
`sudo apt install acct`

show last executed commands
`lastcomm`


# list all disks, partitions and mounted drives
sudo lsblk -o model,name,fstype,size,label,mountpoint

# linux AV

sudo deb http://http.us.debian.org/debian stable main contrib non-free

sudo apt install clamav
sudo apt install clamav-freshclam
sudo apt install freshclam
apt info clamav

sudo freshclam
sudo clamscan --exclude-dir="^/sys" -ir / >> /tmp/clamfound.txt

sudo apt install rkunter
sudo rkhunter --propupd
sudo rkhunter -c
sudo cat /var/log/rkhunter.log