POST-GENERATION SCRIPT
======================

After regenerating static site content with Vike, run this script to apply:
- Facebook Meta Pixel (ID: 346568425169694)
- Reddit Pixel (ID: a2_feojnozacoug)
- Loading spinner overlay (prevents FOUC)

The pixel scripts reference /fbevents.js and /reddit-pixel.js which should be
in the root of the project.


HOW TO RUN
----------

Option 1: From PowerShell
    cd c:\Users\ASUS\git\remakeai.github.io
    powershell -ExecutionPolicy Bypass -File .\scripts\apply-pixels-and-loader.ps1

Option 2: From Git Bash or WSL
    cd /c/Users/ASUS/git/remakeai.github.io
    powershell -ExecutionPolicy Bypass -File ./scripts/apply-pixels-and-loader.ps1

Option 3: Right-click in Windows Explorer
    Right-click apply-pixels-and-loader.ps1 > "Run with PowerShell"


WHAT IT DOES
------------

1. Finds all .html files recursively in the project
2. Inserts tracking pixels after <head> tag (if not already present)
3. Inserts loading overlay after <body> tag (if not already present)
4. Reports which files were updated or skipped


NOTES
-----

- The script is idempotent - running it multiple times is safe
- It checks for existing pixels/loader before inserting
- Remember to update sitemap.xml manually if you add new pages
