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

Note: there could be a considerable drop in battery life is you use performance governor

### Instructions
**1. Become root:** sudo -i  
**2. Navigate to script location:** cd /path/to/script/performance-tweaker.sh  
**3. Execute script:** bash performance-tweaker.sh  
