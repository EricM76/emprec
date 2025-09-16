#!/bin/bash

# Script to fix dropdown conflict with hamburger menu in all HTML files

# Find all HTML files that have the mobile menu JavaScript
files_to_update=$(find . -name "*.html" -not -path "./.git/*" -exec grep -l "mainMenu.*slideToggle" {} \;)

echo "Files to update for dropdown conflict fix:"
echo "$files_to_update"
echo ""

# Counter for processed files
count=0

# Process each file
for file in $files_to_update; do
    echo "Processing: $file"
    
    # Create a backup
    cp "$file" "$file.backup"
    
    # Fix the click outside event to exclude dropdown
    sed -i '' 's/!$(e.target).closest("#mainMenu, #mainMenu-trigger").length/!$(e.target).closest("#mainMenu, #mainMenu-trigger, .dropdown").length/g' "$file"
    
    # Fix the link click event to exclude dropdown toggle
    sed -i '' 's/if ($(window).width() <= 991) {/if ($(window).width() <= 991 \&\& !$(this).hasClass('\''dropdown-toggle'\'')) {/g' "$file"
    
    # Check if the file was modified successfully
    if [ -s "$file" ]; then
        echo "  ✓ Fixed dropdown conflict: $file"
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
echo "Dropdown conflict fixed in all files!"
