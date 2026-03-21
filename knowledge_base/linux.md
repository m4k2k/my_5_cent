# Linux Tricks

## Find open ports

show all open ports

`sudo netstat -an | grep LISTEN`

alternative version
`sudo netstat -tulpn | grep LISTEN`

filtered out local only ports
`sudo netstat -ntlp | grep -vEe "\s+127[.]|::1"`

another alternative version
`cat /proc/net/tcp | grep :0050`
(ports here are in hex, 0050 = 80)

## reboot investigation

### investigation

show system up time, current loggedin users
`uptime`

show last 5 login/reboot with users and its hosts
`last --hostlast --dns --system --fullnames --fulltimes --limit 5`

show last reboot and currently loggedin users
`who -a`

### advanced audit trail / get more info next time

Source: https://www.cyberciti.biz/tips/howto-log-user-activity-using-process-accounting.html

debian install
`sudo apt install acct`

show last executed commands
`lastcomm`

## list all disks, partitions and mounted drives

`sudo lsblk -o model,name,fstype,size,label,mountpoint`

## linux AV

```bash
sudo deb http://http.us.debian.org/debian stable main contrib non-freesudo apt install clamav
sudo apt install clamav-freshclam
sudo apt install freshclam
apt info clamavsudo freshclam
sudo clamscan --exclude-dir="^/sys" -ir / >> /tmp/clamfound.txtsudo apt install rkunter
sudo rkhunter --propupd
sudo rkhunter -c
sudo cat /var/log/rkhunter.log
```
