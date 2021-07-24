#!/bin/sh
echo "Cpu currently set to "
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "which governor do u wanna use?"
read governor
echo $governor | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "governor set successfully"
