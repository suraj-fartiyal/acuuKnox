#!/bin/bash

LOG_FILE="/path/to/web/server/logs/access.log"

# Find the number of 404 errors
echo "Number of 404 errors:"
grep "404" $LOG_FILE | wc -l

# Find the most requested pages
echo "Most requested pages:"
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head

# Find the IP addresses with the most requests
echo "IP addresses with the most requests:"
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head
