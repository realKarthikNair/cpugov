#!/bin/sh

GREEN='\033[0;32m'  
NC='\033[0m'        

echo -e "CPU governor currently set to:\n${GREEN}"
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo -e "${NC}"

echo ""
echo -e "Energy Performance Preference currently set to:\n${GREEN}"
cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference
echo -e "${NC}"

echo -e "\nThe available governors are:\n${GREEN}"
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
echo -e "${NC}"

echo -e "\nWhich governor do you want to use? (Enter to skip)\n"
read governor
if [ -n "$governor" ]; then
    echo $governor | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    echo -e "\nGovernor $governor set successfully to all cores"
fi

echo -e "\nCurrent Energy Performance Preference:\n${GREEN}"
cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference
echo -e "${NC}"

echo -e "\nThe available Energy Performance Preferences are:\n${GREEN}"
cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences | tr ' ' '\n'
echo -e "${NC}"

echo -e "\nWhich Energy Performance Preference do you want to use? (Enter to skip)\n"
read preference
if [ -n "$preference" ]; then
    echo $preference | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
    echo -e "\nEnergy Performance Preference $preference set successfully for all cores"
fi

echo -e "\nCurrently set governor and Energy Performance Preference:\n${GREEN}"
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference
echo -e "${NC}"

