#!/bin/bash

# Function to sanitize URL by removing special characters and trailing slashes
sanitize_url() {
    local url="$1"
    # Remove special characters and trailing slashes
    sanitized_url="${url//[^a-zA-Z0-9:/._-]}"
    sanitized_url="${sanitized_url%/}"
    echo "$sanitized_url"
}

# Function to categorize URLs based on common prefixes
categorize_url() {
    local url="$1"
    local category
    category=$(echo "$url" | awk -F'/' '{print $4}')
    echo "$category"
}

# Function to read and process the input CSV file
process_csv() {
    local url
    local title
    local sanitized_url
    local category
    while IFS=, read -r url title; do
        sanitized_url=$(sanitize_url "$url")
        category=$(categorize_url "$sanitized_url")
        printf "| %-40s | %-10s | %-60s |\n" "$sanitized_url" "$category" "$title"
    done < "$1"
}

# Main execution
echo "+------------------------------------------+------------+------------------------------------------------------------+"
printf "| %-40s | %-10s | %-60s |\n" "URL" "Category" "Title"
echo "+------------------------------------------+------------+------------------------------------------------------------+"
process_csv "input.csv"
echo "+------------------------------------------+------------+------------------------------------------------------------+"
