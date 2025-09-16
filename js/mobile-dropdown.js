/* 
Mobile Dropdown Fix for EMPREC Website
This script ensures dropdown menus work correctly on mobile devices
*/

(function() {
    'use strict';
    
    // Wait for DOM to be ready
    document.addEventListener('DOMContentLoaded', function() {
        // Wait a bit more for other scripts to load
        setTimeout(function() {
            // Find the dropdown toggle element
            var dropdownToggle = document.querySelector('.dropdown-toggle');
            var dropdownMenu = document.querySelector('.dropdown-menu');
            var dropdown = document.querySelector('.dropdown');
            
            if (dropdownToggle && dropdownMenu && dropdown) {
                // Add click event directly to the element
                dropdownToggle.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    
                    // Toggle classes
                    dropdown.classList.toggle('open');
                    dropdownMenu.classList.toggle('show');
                    
                    return false;
                });
                
                // Close dropdown when clicking outside
                document.addEventListener('click', function(e) {
                    if (!dropdown.contains(e.target)) {
                        dropdown.classList.remove('open');
                        dropdownMenu.classList.remove('show');
                    }
                });
            }
        }, 2000); // Wait 2 seconds
    });
    
    // This script runs after everything else
    window.addEventListener('load', function() {
        setTimeout(function() {
            // Find all dropdown elements
            var dropdownToggles = document.querySelectorAll('.dropdown-toggle');
            var dropdownMenus = document.querySelectorAll('.dropdown-menu');
            var dropdowns = document.querySelectorAll('.dropdown');
            
            // Add click handlers to each dropdown toggle
            dropdownToggles.forEach(function(toggle, index) {
                // Remove any existing event listeners
                var newToggle = toggle.cloneNode(true);
                toggle.parentNode.replaceChild(newToggle, toggle);
                
                // Add new event listener
                newToggle.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    
                    // Find corresponding dropdown and menu
                    var dropdown = newToggle.closest('.dropdown');
                    var menu = dropdown.querySelector('.dropdown-menu');
                    
                    if (dropdown && menu) {
                        // Close other dropdowns
                        dropdowns.forEach(function(otherDropdown) {
                            if (otherDropdown !== dropdown) {
                                otherDropdown.classList.remove('open');
                                var otherMenu = otherDropdown.querySelector('.dropdown-menu');
                                if (otherMenu) {
                                    otherMenu.classList.remove('show');
                                }
                            }
                        });
                        
                        // Toggle current dropdown
                        dropdown.classList.toggle('open');
                        menu.classList.toggle('show');
                    }
                    
                    return false;
                });
            });
            
            // Close dropdowns when clicking outside
            document.addEventListener('click', function(e) {
                var clickedInsideDropdown = false;
                dropdowns.forEach(function(dropdown) {
                    if (dropdown.contains(e.target)) {
                        clickedInsideDropdown = true;
                    }
                });
                
                if (!clickedInsideDropdown) {
                    dropdowns.forEach(function(dropdown) {
                        dropdown.classList.remove('open');
                        var menu = dropdown.querySelector('.dropdown-menu');
                        if (menu) {
                            menu.classList.remove('show');
                        }
                    });
                }
            });
        }, 3000); // Wait 3 seconds
    });
})();
