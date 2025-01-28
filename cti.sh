#!/bin/bash

# Variables
CTI_LOG="/var/ossec/updates/cti.log"
UPDATES_DIR="/var/ossec/updates"
CTI_API="https://cti.wazuh.com/api/v1/catalog/contexts/vd_1.0.0/consumers/vd_4.8.0"
CTI_FILE="cti.zip"  # Fixed name for the downloaded file

# Function to get the latest snapshot
get_snapshot_info() {
    local response=$(curl -s -X GET "$CTI_API")
    local snapshot_link=$(echo "$response" | jq -r '.data.last_snapshot_link')
    local snapshot_date=$(echo "$response" | jq -r '.data.last_snapshot_at')

    echo "$snapshot_link $snapshot_date"
}

# Create updates directory if it does not exist
mkdir -p "$UPDATES_DIR"

# Get current snapshot information
snapshot_info=$(get_snapshot_info)
snapshot_link=$(echo "$snapshot_info" | awk '{print $1}')
snapshot_date=$(echo "$snapshot_info" | awk '{print $2}')

# Check if the log exists
if [[ -f "$CTI_LOG" ]]; then
    last_entry=$(tail -n 1 "$CTI_LOG")
else
    last_entry=""
fi

# Compare with the last log entry
if [[ "$snapshot_info" == "$last_entry" ]]; then
    echo "The file is already up-to-date. No download is needed."
    exit 0
else
    echo "New version detected. Proceeding with the download."
fi

# Download the file and rename it to cti.zip
wget -q -O "$UPDATES_DIR/$CTI_FILE" "$snapshot_link"

# Validate if the download was successful
if [[ $? -eq 0 ]]; then
    echo "File downloaded successfully and renamed to: $CTI_FILE"
    echo "$snapshot_info" >> "$CTI_LOG"
else
    echo "Error downloading the file. Please check the connection or the link."
    exit 1
fi
