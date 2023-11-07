#!/bin/bash

# Getting a list of available governors
modes=($(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors))
echo ${modes[*]}