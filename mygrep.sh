#!/bin/bash

show_help() {
    echo "Usage: $0 [options] search_string filename"
    echo
    echo "Options:"
    echo "  -n       Show line numbers for matches"
    echo "  -v       Invert match (show non-matching lines)"
    echo "  --help   Display this help message"
}

# Initialize flags
show_line_numbers=false
invert_match=false

# Parse options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -n) show_line_numbers=true; shift ;;
        -v) invert_match=true; shift ;;
        --help) show_help; exit 0 ;;
        -*)
            echo "Error: Unknown option $1"
            show_help
            exit 1
            ;;
        *) break ;;
    esac
done

# Check for required arguments
if [[ $# -lt 2 ]]; then
    echo "Error: Missing search string or filename."
    show_help
    exit 1
fi

search="$1"
file="$2"

# Check if file exists
if [[ ! -f "$file" ]]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

# Process the file
line_number=0
match_count=0

while IFS= read -r line; do
    ((line_number++))
    if [[ "$line" =~ $search || "${line,,}" =~ ${search,,} ]]; then
        match=true
    else
        match=false
    fi

    if $invert_match; then
        match=$(! $match)
    fi

    if $match; then
        if $show_line_numbers; then
            echo "${line_number}: $line"
        else
            echo "$line"
        fi
    fi
done < "$file"