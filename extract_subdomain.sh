#!/bin/bash

# Define the URL of the website
URL=""

# Temporary file to store the webpage content
TEMP_FILE="index.html"

# Output file to save the subdomains
OUTPUT_FILE="subdomains.txt"

# Download the webpage content
wget -q -O "$TEMP_FILE" "$URL"

# Extract subdomains and save to the output file
grep -Eo '(https?://)?([a-zA-Z0-9_\-]+\.)*(Domain name)\.com' "$TEMP_FILE" |
    sed -E 's|https?://||' | 
    awk -F/ '{print $1}' | 
    sort -u > "$OUTPUT_FILE"

# Clean up temporary file
rm "$TEMP_FILE"

echo "Subdomains extracted successfully and saved to $OUTPUT_FILE."

