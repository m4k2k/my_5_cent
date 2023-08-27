


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


