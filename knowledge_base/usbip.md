


# ubuntu
sudo apt install linux-tools-generic hwdata

# debian
sudo apt install usbip hwdata usbutils


# in windows - show devices - show shared devices
usbipd list

# in windows - share device  (mind the windows fireall!)
usbipd bind --busid 7-1

# in windows - unshare device
usbipd unbind --busid 7-1

# in windows - wsl
usbipd wsl --help
usbipd wsl list
usbipd wsl attach --busid=<BUSID>

# inside linux container - show devices
usbip list --remote=host.docker.internal

# inside linux container - attach device
usbip attach --remote=host.docker.internal --busid=7-1
usbip --debug attach --remote=host.docker.internal --busid=7-1

## same as in wsl linux (mind the windows fireall!)
sudo usbip attach --remote=$(hostname).local --busid=7-1
### try ping to check if firewall is ok (also works to findout host-ip of wsl)
sudo ping $(hostname).local

# inside linux container - show attached usb devices
usbip port

# inside linux container - list usb devices
lsusb

# inside linux container - detach device
sudo usbip detach --port=00




# Error Checking


# inside linux container - find tty path
dmesg | grep tty
# --> ttyACM0 --> /dev/ttyACM0

# restart wsl backend
# stop docker desktop
Get-Service com.docker.service | Stop-Service
Get-Service LxssManager | Stop-Service
Get-Service LxssManager | Start-Service

# update wsl to latest
wsl --update
(in elevated win cmd)



# check if usb drive already mounted (linux)
lsblk



