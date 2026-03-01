# Remove duplicate anchor interceptor from loader section
# The interceptor is now in the scroll fix at the top of head

$basePath = $PSScriptRoot | Split-Path -Parent
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

$oldLoaderScript = @'
    <script>
      window.addEventListener('load', function() {
        var loader = document.getElementById('page-loader');
        if (loader) {
          loader.classList.add('hidden');
          setTimeout(function() {
            loader.remove();
            // Scroll to hash anchor after page fully loads
            if (window.location.hash) {
              var el = document.querySelector(window.location.hash);
              if (el) el.scrollIntoView({ behavior: 'instant' });
            }
          }, 300);
        }
      });
      // Intercept hash-only anchor clicks to bypass Vike's client-side routing
      document.addEventListener('click', function(e) {
        var target = e.target.closest('a[href^="#"]');
        if (target) {
          var hash = target.getAttribute('href');
          var el = document.querySelector(hash);
          if (el) {
            e.preventDefault();
            e.stopPropagation();
            el.scrollIntoView({ behavior: 'instant' });
            history.pushState(null, '', hash);
          }
        }
      }, true);
    </script>
'@

$newLoaderScript = @'
    <script>
      window.addEventListener('load', function() {
        var loader = document.getElementById('page-loader');
        if (loader) {
          loader.classList.add('hidden');
          setTimeout(function() {
            loader.remove();
            // Scroll to hash anchor after page fully loads
            if (window.location.hash) {
              var el = document.querySelector(window.location.hash);
              if (el) el.scrollIntoView({ behavior: 'instant' });
            }
          }, 300);
        }
      });
    </script>
'@

foreach ($file in $htmlFiles) {
    if ($file.FullName -like "*\ad\*") { continue }

    $content = Get-Content $file.FullName -Raw

    if ($content -match 'Intercept hash-only anchor clicks to bypass') {
        $content = $content -replace [regex]::Escape($oldLoaderScript), $newLoaderScript
        Set-Content $file.FullName -Value $content -NoNewline
        Write-Host "Updated: $($file.Name)"
    }
}

Write-Host "Done!"
