#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Get current CPU, memory, and disk usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

# Check CPU usage
if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
    echo "Warning: CPU usage is above threshold: $cpu_usage%"
fi

# Check memory usage
if (( $(echo "$mem_usage > $MEM_THRESHOLD" | bc -l) )); then
    echo "Warning: Memory usage is above threshold: $mem_usage%"
fi

# Check disk space usage
if (( $disk_usage > $DISK_THRESHOLD )); then
    echo "Warning: Disk usage is above threshold: $disk_usage%"
fi
