# Remove scroll-behavior: smooth from all HTML files
# This CSS causes issues with anchor navigation

$basePath = $PSScriptRoot | Split-Path -Parent
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

foreach ($file in $htmlFiles) {
    # Skip files in the ad folder
    if ($file.FullName -like "*\ad\*") {
        continue
    }

    $content = Get-Content $file.FullName -Raw

    if ($content -match 'scroll-behavior:\s*smooth') {
        # Remove the scroll-behavior: smooth block and its comment
        $pattern = '/\*\s*Make links scroll to their sections smoothly\.\s*\*/\s*\r?\n\s*\*\s*\{\s*\r?\n\s*scroll-behavior:\s*smooth;\s*\r?\n\s*\}'
        $content = $content -replace $pattern, ''

        Set-Content $file.FullName -Value $content -NoNewline
        Write-Host "Removed smooth scroll: $($file.Name)"
    }
}

Write-Host "Done!"
