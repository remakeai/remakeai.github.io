# Add anchor click interceptor to bypass Vike's client-side routing
# This prevents page reloads when clicking hash-only anchor links

$basePath = $PSScriptRoot | Split-Path -Parent
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

$oldScript = @'
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

$newScript = @'
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

foreach ($file in $htmlFiles) {
    # Skip files in the ad folder
    if ($file.FullName -like "*\ad\*") {
        continue
    }

    $content = Get-Content $file.FullName -Raw

    # Check if file has the old loader script (without interceptor)
    if ($content -match 'id="page-loader"' -and $content -notmatch 'Intercept hash-only anchor clicks') {
        $content = $content -replace [regex]::Escape($oldScript), $newScript
        Set-Content $file.FullName -Value $content -NoNewline
        Write-Host "Updated: $($file.Name)"
    }
}

Write-Host "Done!"
