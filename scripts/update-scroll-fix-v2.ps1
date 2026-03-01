# Update scroll fix to include anchor interceptor at top of head
# This ensures the interceptor runs before Vike loads

$basePath = $PSScriptRoot | Split-Path -Parent
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

$oldScrollFix = @'
<!-- Scroll Fix -->
    <script>if('scrollRestoration' in history)history.scrollRestoration='manual';window.scrollTo(0,0);</script>
'@

$newScrollFix = @'
<!-- Scroll Fix -->
    <script>
      if('scrollRestoration' in history)history.scrollRestoration='manual';
      window.scrollTo(0,0);
      // Intercept hash anchor clicks before Vike loads
      document.addEventListener('click', function(e) {
        var a = e.target;
        while (a && a.tagName !== 'A') a = a.parentElement;
        if (a && a.getAttribute('href') && a.getAttribute('href').charAt(0) === '#') {
          var hash = a.getAttribute('href');
          var el = document.querySelector(hash);
          if (el) {
            e.preventDefault();
            e.stopImmediatePropagation();
            el.scrollIntoView({ behavior: 'instant' });
            history.pushState(null, '', hash);
          }
        }
      }, true);
    </script>
'@

foreach ($file in $htmlFiles) {
    if ($file.FullName -like "*\ad\*") { continue }

    $content = Get-Content $file.FullName -Raw

    if ($content -match '<!-- Scroll Fix -->' -and $content -notmatch 'Intercept hash anchor clicks before Vike') {
        $content = $content -replace [regex]::Escape($oldScrollFix), $newScrollFix
        Set-Content $file.FullName -Value $content -NoNewline
        Write-Host "Updated: $($file.Name)"
    }
}

Write-Host "Done!"
