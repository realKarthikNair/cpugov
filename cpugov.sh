#!/bin/sh
echo -e "Cpu currently set to \n"
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo -e "\nThe available governors are\n"
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors | tr ' ' '\n'
echo -e "\nwhich governor do u wanna use?\n"
read governor
echo $governor | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo -e "\nGovernor $governor set successfully to all cores"
