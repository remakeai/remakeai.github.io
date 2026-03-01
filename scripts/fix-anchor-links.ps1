# Fix anchor links to use relative hash instead of full path
# This bypasses Vike's client-side routing for same-page anchors

$basePath = $PSScriptRoot | Split-Path -Parent
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

foreach ($file in $htmlFiles) {
    # Skip files in the ad folder
    if ($file.FullName -like "*\ad\*") {
        continue
    }

    $content = Get-Content $file.FullName -Raw
    $modified = $false

    # Determine the page's own path (e.g., /reserve/games for reserve/games/index.html)
    $relativePath = $file.FullName.Replace($basePath, '').Replace('\', '/').Replace('/index.html', '')
    if ($relativePath -eq '') { $relativePath = '/' }

    # Pattern: href="/path/to/page#anchor" where path matches current page
    # Replace with href="#anchor"
    $pattern = "href=""$relativePath#([^""]+)"""
    if ($content -match $pattern) {
        $content = $content -replace $pattern, 'href="#$1"'
        $modified = $true
        Write-Host "Fixed anchor links in: $($file.Name)"
    }

    if ($modified) {
        Set-Content $file.FullName -Value $content -NoNewline
    }
}

Write-Host "Done!"
