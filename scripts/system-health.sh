#!/bin/bash
echo "======================================="
echo "script : system-health check report"
echo "User: $(whoami)"
echo "Purpose : Monitor CPU, Memory and Disk usage"
echo "======================================="
echo "               SYSTEM-HEALTH REPORT"
echo "date : $(date)"
echo "======================================="
echo " "
echo "    CPU Usage:"
cpu=$(top -bn2 | grep "%Cpu" | tail -1 | awk '{print 100-$8}')
echo "used : $cpu %"
echo " "
echo "    Memory Usage"
memory=$(free | awk '/Mem:/ {printf("%.0f", $3/$2*100)}')
echo "used : $memory % RAM"
echo " "
echo "    Disk usage"
disk=$(df -h | awk '$NF=="/" {print $5}' | sed 's/%//')
echo "used : $disk % of disk"
echo " "
echo "======================================="
echo "         END REPORT"
echo "======================================="


