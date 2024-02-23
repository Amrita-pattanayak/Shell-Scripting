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
        echo -e "$sanitized_url\t$category\t$title"
    done < "$1"
}

# Function to generate the output CSV file
generate_output_csv() {
    local input_file="$1"
    local output_file="$2"
    local header
    header="URL\toverview\tcampus\tcourses\tscholarships\tadmission\tplacements\tresults"
    echo -e "$header" > "$output_file"
    process_csv "$input_file" >> "$output_file"
}

# Main execution
generate_output_csv "input.csv" "output.csv"
