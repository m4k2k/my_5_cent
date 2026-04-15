# USB-IP Setup and usage

## Installation

### ubuntu

`sudo apt install linux-tools-generic hwdata`

### debian

`sudo apt install usbip hwdata usbutils`

## Setup & Usage

### in windows

| Action                                     | Command                        |
| ------------------------------------------ | ------------------------------ |
| start service                              | `gsudo Start-Service usbipd` |
| show devices - show shared devices         | `usbipd list`                |
| share device  (mind the windows firewall!) | `usbipd bind --busid 7-1`    |
| unshare device                             | `usbipd unbind --busid 7-1`  |

#### with wsl

| Action | Command                               |
| ------ | ------------------------------------- |
|        | `usbipd wsl --help`                 |
|        | `usbipd wsl list`                   |
|        | `usbipd wsl attach --busid=<BUSID>` |

### in linux

#### with wsl

| Action | Command        |
| ------ | -------------- |
|        | `usbip port` |

#### inside linux container

| Action        | Command                                                                                                                            |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| show devices  | `usbip list --remote=host.docker.internal`                                                                                       |
| attach device | `usbip attach --remote=host.docker.internal --busid=7-1`<br />`usbip --debug attach --remote=host.docker.internal --busid=7-1` |


## same as in wsl linux (mind the windows fireall!)

`sudo usbip attach --remote=$(hostname).local --busid=7-1`

### try ping to check if firewall is ok (also works to findout host-ip of wsl)

`sudo ping $(hostname).local`

# inside linux container - show attached usb devices

`usbip port`

# inside linux container - list usb devices

`lsusb`

# inside linux container - detach device

`sudo usbip detach --port=00`

# Error Checking

# inside linux container - find tty path

`dmesg | grep tty`

# --> ttyACM0 --> /dev/ttyACM0

# restart wsl backend

# stop docker desktop

`Get-Service com.docker.service | Stop-Service`
`Get-Service LxssManager | Stop-Service`
`Get-Service LxssManager | Start-Service`

# update wsl to latest

`wsl --update`
(in elevated win cmd)

# check if usb drive already mounted (linux)

`lsblk`
