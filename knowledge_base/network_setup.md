# network setup

Table of Contents

- [network setup](#network-setup)
  - [debian / raspberry pi](#debian--raspberry-pi)
    - [setup hostname](#setup-hostname)
    - [setup static ip for eth0](#setup-static-ip-for-eth0)

## debian / raspberry pi

### setup hostname

/etc/hostname
replace old with *newhostname*
/etc/hosts
add entry with *newhostname* for 127.x address
e.g.

```nginx
127.0.1.9      newhostname
```

`ping newhostname` to verify

### setup static ip for eth0

[(read more)](https://wiki.archlinux.org/title/Dhcpcd#Fallback_static_profile)

- make sure the internet interface has priority over the other
- append this to dhcpcd.conf
- using `sudo vi /etc/dhcpcd.conf`

```apache
# define static profile
profile static_eth0
static ip_address=192.168.1.9/24

# fallback to static profile on eth0
interface eth0
metric 300
fallback static_eth0

interface wlan0
metric 200
```

reboot network service afterwards to apply changes
`sudo systemctl restart systemd-networkd`

use `ip a` to verify new ip
