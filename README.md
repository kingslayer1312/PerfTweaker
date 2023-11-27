# PerformanceTweaker
A simple shell script that enables persistent changes to the CPU governor profile on Linux.  
This script basically automates the work shown in the Fedora discussions post at https://discussion.fedoraproject.org/t/how-to-increasing-performance-by-changing-cpu-governor-and-reducing-swappiness/71429  
Run the script as root.  

### An overview of performance governors

| Governor | Description |
|----------|-------------|
| performance |	Maximum performance |
| powersave |	Minimum frequency possible |
| ondemand | Scales the frequency dynamically |
| conservative |	Same as ondemand, but scale more gradually |

*Table from: https://nocache.org/p/set-cpu-governor-frequency-using-cpupower-on-linux*  

The scripts have been tested on Ubuntu 22.04, Fedora 38/39 and openSUSE Tumbleweed. However, it should work fine on any other distro.

Note: there could be a considerable drop in battery life if you use performance governor


### Instructions
**1. Become root:** sudo -i  
**2. Navigate to script location:** cd /path/to/script/performance-tweaker.sh  
**3. Execute script:** bash performance-tweaker.sh  

In case you wish to restore the original cpu governor mode, run the restore-defaults.sh script as root. After running the script, you'll have to reboot your system for the changes to take place.
