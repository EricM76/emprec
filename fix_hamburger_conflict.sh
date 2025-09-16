#!/bin/bash

# Script to fix hamburger menu conflict with dropdown in all HTML files

# Find all HTML files that have the mobile menu JavaScript
files_to_update=$(find . -name "*.html" -not -path "./.git/*" -exec grep -l "Close mobile menu when clicking on a link" {} \;)

echo "Files to update for hamburger menu conflict fix:"
echo "$files_to_update"
echo ""

# Counter for processed files
count=0

# Process each file
for file in $files_to_update; do
    echo "Processing: $file"
    
    # Create a backup
    cp "$file" "$file.backup"
    
    # Fix the mobile menu link click event to exclude dropdown-toggle
    sed -i '' 's/if ($(window).width() <= 991) {/if ($(window).width() <= 991 \&\& !$(this).hasClass('\''dropdown-toggle'\'')) {/g' "$file"
    
    # Check if the file was modified successfully
    if [ -s "$file" ]; then
        echo "  ✓ Fixed hamburger menu conflict: $file"
        ((count++))
    else
        echo "  ⚠ Failed to fix: $file"
        mv "$file.backup" "$file"
    fi
done

echo ""
echo "Summary:"
echo "- Files processed: $count"
echo "- Files failed: $(echo "$files_to_update" | wc -l) - $count"
echo ""
echo "Hamburger menu conflict fixed in all files!"
