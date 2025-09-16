#!/bin/bash

# Script to fix dropdown JavaScript in all HTML files

# Find all HTML files that have the dropdown JavaScript
files_to_update=$(find . -name "*.html" -not -path "./.git/*" -exec grep -l "dropdown-toggle.*click" {} \;)

echo "Files to update for dropdown JavaScript fix:"
echo "$files_to_update"
echo ""

# Counter for processed files
count=0

# Process each file
for file in $files_to_update; do
    echo "Processing: $file"
    
    # Create a backup
    cp "$file" "$file.backup"
    
    # Fix the dropdown-toggle click event
    sed -i '' 's/if ($(window).width() <= 991 && !$(this).hasClass('\''dropdown-toggle'\'')) {/if ($(window).width() <= 991) {/g' "$file"
    
    # Fix the dropdown click event
    sed -i '' 's/if ($(window).width() <= 991 && !$(this).hasClass('\''dropdown-toggle'\'')) {/if ($(window).width() <= 991) {/g' "$file"
    
    # Check if the file was modified successfully
    if [ -s "$file" ]; then
        echo "  ✓ Fixed dropdown JavaScript: $file"
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
echo "Dropdown JavaScript fixed in all files!"
