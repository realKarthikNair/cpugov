#!/bin/sh
echo "which governor do u wanna use?"
read governor
echo $governor | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "governor set successfully"
