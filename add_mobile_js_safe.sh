#!/bin/bash

# Safe script to add mobile menu JavaScript to HTML files

# Find all HTML files that have mainMenu-trigger but may be missing the JavaScript
files_to_update=$(find . -name "*.html" -not -path "./.git/*" -exec grep -l "mainMenu-trigger" {} \;)

echo "Files to check for mobile menu JavaScript:"
echo "$files_to_update"
echo ""

# Counter for processed files
count=0
skipped=0

# Process each file
for file in $files_to_update; do
    echo "Processing: $file"
    
    # Check if file already has mobile menu JavaScript
    if grep -q "mainMenu.*slideToggle" "$file"; then
        echo "  ✓ Already has mobile menu JavaScript: $file"
        ((skipped++))
        continue
    fi
    
    # Check if file has the closing body tag
    if ! grep -q "</body>" "$file"; then
        echo "  ⚠ Skipped: $file (no closing body tag found)"
        continue
    fi
    
    # Create a backup
    cp "$file" "$file.backup"
    
    # Add mobile menu JavaScript before the closing body tag
    # Use a more reliable method with awk
    awk '
    /<\/body>/ && !found {
        print "    <script>"
        print "      $(document).ready(function() {"
        print "        // Mobile menu toggle"
        print "        $(\"#mainMenu-trigger\").on(\"click\", function() {"
        print "          $(\"#mainMenu\").slideToggle();"
        print "          $(this).toggleClass(\"active\");"
        print "        });"
        print "        "
        print "        // Close mobile menu when clicking on a link"
        print "        $(\"#mainMenu a\").on(\"click\", function() {"
        print "          if ($(window).width() <= 991) {"
        print "            $(\"#mainMenu\").slideUp();"
        print "            $(\"#mainMenu-trigger\").removeClass(\"active\");"
        print "          }"
        print "        });"
        print "        "
        print "        // Close mobile menu when clicking outside"
        print "        $(document).on(\"click\", function(e) {"
        print "          if (!$(e.target).closest(\"#mainMenu, #mainMenu-trigger\").length) {"
        print "            if ($(window).width() <= 991) {"
        print "              $(\"#mainMenu\").slideUp();"
        print "              $(\"#mainMenu-trigger\").removeClass(\"active\");"
        print "            }"
        print "          }"
        print "        });"
        print "        "
        print "        // Handle window resize"
        print "        $(window).on(\"resize\", function() {"
        print "          if ($(window).width() > 991) {"
        print "            $(\"#mainMenu\").show();"
        print "            $(\"#mainMenu-trigger\").removeClass(\"active\");"
        print "          } else {"
        print "            $(\"#mainMenu\").hide();"
        print "            $(\"#mainMenu-trigger\").removeClass(\"active\");"
        print "          }"
        print "        });"
        print "      });"
        print "    </script>"
        print $0
        found = 1
        next
    }
    { print }
    ' "$file" > "$file.temp"
    
    # Check if the temp file was created successfully and has content
    if [ -s "$file.temp" ] && [ $(wc -l < "$file.temp") -gt $(wc -l < "$file") ]; then
        mv "$file.temp" "$file"
        echo "  ✓ Added mobile menu JavaScript: $file"
        ((count++))
    else
        echo "  ⚠ Failed to add JavaScript to: $file"
        rm -f "$file.temp"
        mv "$file.backup" "$file"
    fi
done

echo ""
echo "Summary:"
echo "- Files processed: $count"
echo "- Files already had JavaScript: $skipped"
echo "- Files failed: $(echo "$files_to_update" | wc -l) - $count - $skipped"
echo ""
echo "Mobile menu JavaScript added safely!"
