#!/usr/bin/zsh

# Grab the last 10 lines (adjust the number as needed)
log_pacman=$(tail -n 10 /var/log/pacman.log)

# Use awk to search for the upgrade line and extract the timestamp
upgrade_time=$(awk '/starting full system upgrade/ {print $1}' <<< "$log_pacman")
timestamp=$upgrade_time
dt=$(date -d "${timestamp:1:-1}" +'%A, %B %d, %Y at %I:%M:%S %p %Z')
echo "Pacman was last updated: $dt"