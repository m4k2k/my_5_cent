
# Windows Tricks

Table of Contents

- [Windows Tricks](#windows-tricks)
  - [Core Isolation on Surface Pro 3](#core-isolation-on-surface-pro-3)
  - [PowerShell Tricks](#powershell-tricks)
  - [Get Serial-Number of Notebook/PC](#get-serial-number-of-notebookpc)
  - [Bluetooth Debugging](#bluetooth-debugging)

## Core Isolation on Surface Pro 3

"Get Windows Device Security -> Core Isolation working on surface pro 3"

its not working because of the old intel hd 5000 driver which is not compatible
"oem11.inf"

**Braindump - might not be complete**

Download Driver from Intel Website
For Intel HD 5000 Driver
https://www.intel.de/content/www/de/de/support/products/81495/graphics/intel-hd-graphics-family/intel-hd-graphics-5000.html

I used "15.40.48.5171"

The driver is not certified for surface, therefore the installer wont work

use universal extractor v2 to extract wix-installer file
*required .net framework install*
go to the device manager
right click graphics card -> update driver
navigate to the extracted folder and choose the *.inf file for installation

after the installation the device security core isolation is (still) not working

to uninstall go to device manager -> change view to devices by driver

search for oem11.inf and unistall/remove

reboot - done, core isolation can be enabled now

## PowerShell Tricks

## Get Serial-Number of Notebook/PC

Query:

`wmic bios get serialnumber`

Response:

```
PS C:\> wmic bios get serialnumber
SerialNumber
To be filled by O.E.M.
```

## Bluetooth Debugging


debug bluetooth in windows using wireshark

Tool FAQ
https://learn.microsoft.com/en-us/windows-hardware/drivers/bluetooth/testing-btp-tools-btvs

Download:
https://learn.microsoft.com/en-us/windows-hardware/drivers/bluetooth/testing-btp-setup-package#download-the-btp-software-package

