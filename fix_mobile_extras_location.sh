#!/bin/bash

# Script to fix mobile-menu-extras location in HTML files

# Find all HTML files that have mobile-menu-extras
files_to_check=$(find . -name "*.html" -not -path "./.git/*" -exec grep -l "mobile-menu-extras" {} \;)

echo "Files to check for mobile-menu-extras location:"
echo "$files_to_check"
echo ""

# Counter for processed files
count=0
already_correct=0

# Process each file
for file in $files_to_check; do
    echo "Checking: $file"
    
    # Check if mobile-menu-extras is inside header-extras (incorrect)
    if grep -A 5 -B 5 "mobile-menu-extras" "$file" | grep -q "header-extras"; then
        echo "  ⚠ Found mobile-menu-extras in wrong location (inside header-extras)"
        echo "  ✓ This file needs to be fixed manually: $file"
        ((count++))
    else
        echo "  ✓ mobile-menu-extras is in correct location"
        ((already_correct++))
    fi
done

echo ""
echo "Summary:"
echo "- Files with correct location: $already_correct"
echo "- Files that need manual fixing: $count"
echo ""
echo "Files that need manual fixing:"
echo "$files_to_check" | while read file; do
    if grep -A 5 -B 5 "mobile-menu-extras" "$file" | grep -q "header-extras"; then
        echo "  - $file"
    fi
done
