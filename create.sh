#!/bin/bash

# Password Generator Pro
# Version 1.0
# Author: HackJack
# Description: Generates professional password lists based on personal information

# Clear screen
clear

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Show HackJack banner
function show_banner() {
    echo -e "${RED}"
    echo ' _   _            _     _           _    '
    echo '| | | | __ _  ___| |__ (_) ___  ___| | __'
    echo '| |_| |/ _` |/ __|  _ \| |/ _ \/ __| |/ /'
    echo '|  _  | (_| | (__| | | | |  __/ (__|   < '
    echo '|_| |_|\__,_|\___|_| |_|_|\___|\___|_|\_\'
    echo -e "${NC}"
    echo -e "${BLUE}Password Generator Pro v1.0${NC}"
    echo -e "${YELLOW}----------------------------------------${NC}"
    echo
}

# Generate passwords based on input
function generate_passwords() {
    local first_name=$1
    local last_name=$2
    local birth_year=$3
    local birth_month=$4
    local birth_day=$5
    local pet_name=$6
    local output_file=$7
    
    echo -e "${GREEN}[+] Generating passwords...${NC}"
    
    # Basic patterns
    patterns=(
        "${first_name}${last_name}"
        "${first_name}${last_name}${birth_year}"
        "${first_name}${last_name}${birth_day}${birth_month}"
        "${last_name}${first_name}"
        "${first_name}.${last_name}"
        "${first_name}_${last_name}"
        "${first_name}${birth_year}"
        "${last_name}${birth_year}"
        "${first_name}${birth_day}${birth_month}"
        "${last_name}${birth_day}${birth_month}"
        "${first_name}${pet_name}"
        "${pet_name}${birth_year}"
        "${first_name:0:1}${last_name}"
        "${first_name}${last_name:0:1}"
        "${first_name}${birth_day}"
        "${last_name}${birth_day}"
        "${first_name}${birth_month}"
        "${last_name}${birth_month}"
        "${pet_name}${birth_day}${birth_month}"
        "${first_name}${last_name}!"
        "${first_name}${birth_year}!"
        "${last_name}${birth_year}!"
        "${first_name}${birth_day}${birth_month}!"
        "${pet_name}${birth_year}!"
        "${first_name}${last_name}123"
        "${first_name}${birth_year}123"
        "${last_name}${birth_year}123"
        "${first_name}${last_name}${birth_year}!"
        "${first_name}${last_name}${birth_day}${birth_month}!"
        "${first_name}${last_name}${birth_year}123"
        "${first_name}${last_name}${birth_day}${birth_month}123"
        "${first_name}${last_name}${birth_year}@"
        "${first_name}${last_name}${birth_day}${birth_month}@"
        "${first_name}${last_name}${birth_year}#"
        "${first_name}${last_name}${birth_day}${birth_month}#"
    )
    
    # Special character variations
    special_chars=('!' '@' '#' '$' '%' '^' '&' '*' '_' '-' '+')
    
    # Generate password variations
    echo -e "${YELLOW}[*] Creating password variations...${NC}"
    
    # Clear output file if exists
    > "$output_file"
    
    # Generate base patterns
    for pattern in "${patterns[@]}"; do
        echo "$pattern" >> "$output_file"
        
        # Add uppercase variations
        echo "${pattern^}" >> "$output_file"
        echo "${pattern^^}" >> "$output_file"
        
        # Add special character endings
        for char in "${special_chars[@]}"; do
            echo "${pattern}${char}" >> "$output_file"
            echo "${pattern^}${char}" >> "$output_file"
            echo "${pattern^^}${char}" >> "$output_file"
        done
        
        # Add number endings
        for i in {0..9}; do
            echo "${pattern}${i}" >> "$output_file"
            echo "${pattern^}${i}" >> "$output_file"
            echo "${pattern^^}${i}" >> "$output_file"
        done
        
        # Add number+special combinations
        for i in {0..9}; do
            for char in "${special_chars[@]}"; do
                echo "${pattern}${i}${char}" >> "$output_file"
                echo "${pattern^}${i}${char}" >> "$output_file"
                echo "${pattern^^}${i}${char}" >> "$output_file"
            done
        done
    done
    
    # Generate leet speak variations
    echo -e "${YELLOW}[*] Creating leet speak variations...${NC}"
    leet_patterns=(
        "s/S/g" "a/A/4/g" "e/E/3/g" "i/I/1/!/g" "o/O/0/g" "t/T/7/g" "b/B/8/g"
    )
    
    while read -r line; do
        # Skip empty lines
        if [[ -z "$line" ]]; then
            continue
        fi
        
        # Apply leet substitutions
        leet_line="$line"
        leet_line=$(echo "$leet_line" | sed -e 's/s/S/g' -e 's/a/A/4/g' -e 's/e/E/3/g' -e 's/i/I/1/g' -e 's/o/O/0/g')
        echo "$leet_line" >> "$output_file"
        
        # More aggressive leet
        leet_line=$(echo "$leet_line" | sed -e 's/t/7/g' -e 's/b/8/g' -e 's/g/9/g')
        echo "$leet_line" >> "$output_file"
    done < "$output_file"
    
    # Remove duplicates
    echo -e "${YELLOW}[*] Removing duplicates...${NC}"
    sort -u "$output_file" -o "$output_file"
    
    # Count passwords
    password_count=$(wc -l < "$output_file")
    
    echo -e "${GREEN}[+] Successfully generated ${password_count} passwords in ${output_file}${NC}"
}

# Main function
function main() {
    show_banner
    
    echo -e "${CYAN}Please provide the following information:${NC}"
    
    # Get user input
    read -p "First Name: " first_name
    read -p "Last Name: " last_name
    read -p "Birth Year (YYYY): " birth_year
    read -p "Birth Month (MM): " birth_month
    read -p "Birth Day (DD): " birth_day
    read -p "Pet Name (or favorite animal): " pet_name
    read -p "Output filename (default: passwords.txt): " output_file
    
    # Set default output file if not provided
    if [[ -z "$output_file" ]]; then
        output_file="passwords.txt"
    fi
    
    # Validate input
    if [[ -z "$first_name" || -z "$last_name" || -z "$birth_year" || -z "$birth_month" || -z "$birth_day" ]]; then
        echo -e "${RED}[-] Error: First name, last name, and full date of birth are required!${NC}"
        exit 1
    fi
    
    # Confirm before generation
    echo
    echo -e "${YELLOW}Summary of information provided:${NC}"
    echo "First Name: $first_name"
    echo "Last Name: $last_name"
    echo "Date of Birth: ${birth_day}/${birth_month}/${birth_year}"
    echo "Pet/Favorite Animal: $pet_name"
    echo "Output File: $output_file"
    echo
    
    read -p "Proceed with password generation? (y/n): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo -e "${RED}[-] Operation cancelled by user${NC}"
        exit 0
    fi
    
    # Generate passwords
    generate_passwords "$first_name" "$last_name" "$birth_year" "$birth_month" "$birth_day" "$pet_name" "$output_file"
    
    # Final message
    echo
    echo -e "${MAGENTA}Password generation complete!${NC}"
    echo -e "${BLUE}Remember to use these passwords responsibly and ethically.${NC}"
    echo
}

# Run main function
main
