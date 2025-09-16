#!/bin/bash

# Script to update dropdown JavaScript with new approach in all HTML files

# Find all HTML files that have the dropdown JavaScript
files_to_update=$(find . -name "*.html" -not -path "./.git/*" -exec grep -l "dropdown-toggle.*click" {} \;)

echo "Files to update for new dropdown approach:"
echo "$files_to_update"
echo ""

# Counter for processed files
count=0

# Process each file
for file in $files_to_update; do
    echo "Processing: $file"
    
    # Create a backup
    cp "$file" "$file.backup"
    
    # Replace the old dropdown JavaScript with the new approach
    sed -i '' '/Handle dropdown menu on mobile and tablet/,/});/c\
        // Handle dropdown menu - NEW APPROACH: Independent dropdown for mobile\
        $('\''.dropdown-toggle'\'').on('\''click'\'', function(e) {\
          e.preventDefault();\
          var $dropdown = $(this).closest('\''.dropdown'\'');\
          var $menu = $(this).next('\''.dropdown-menu'\'');\
          \
          // Close other open dropdowns\
          $('\''.dropdown'\'').not($dropdown).removeClass('\''open'\'');\
          $('\''.dropdown-menu'\'').not($menu).removeClass('\''show'\'');\
          \
          // Toggle current dropdown\
          $dropdown.toggleClass('\''open'\'');\
          $menu.toggleClass('\''show'\'');\
          \
          // In mobile, don'\''t close the main menu when dropdown is clicked\
          if ($(window).width() <= 991) {\
            e.stopPropagation(); // Prevent event bubbling to main menu\
          }\
        });' "$file"
    
    # Remove the old second dropdown handler
    sed -i '' '/Also handle click on the entire dropdown li element/,/});/d' "$file"
    
    # Check if the file was modified successfully
    if [ -s "$file" ]; then
        echo "  ✓ Updated dropdown JavaScript: $file"
        ((count++))
    else
        echo "  ⚠ Failed to update: $file"
        mv "$file.backup" "$file"
    fi
done

echo ""
echo "Summary:"
echo "- Files processed: $count"
echo "- Files failed: $(echo "$files_to_update" | wc -l) - $count"
echo ""
echo "New dropdown approach applied to all files!"
