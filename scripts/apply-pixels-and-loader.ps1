# Apply Pixels and Loader Script
# This script inserts Facebook/Reddit tracking pixels and a loading spinner into all HTML files.
# It also fixes anchor navigation issues by removing smooth scroll and fixing same-page anchor links.
# Run this after regenerating static site content.

$basePath = $PSScriptRoot | Split-Path -Parent
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

# Scroll fix - must be FIRST in head to prevent browser's initial scroll
$scrollFix = @'
<!-- Scroll Fix -->
    <script>if('scrollRestoration' in history)history.scrollRestoration='manual';window.scrollTo(0,0);</script>
'@

# Pixel code to insert into <head>
$pixelCode = @'
<!-- Meta Pixel Code -->
    <script>
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    '/fbevents.js');
    fbq('init', '346568425169694');
    fbq('track', 'PageView');
    </script>
    <noscript><img height="1" width="1" style="display:none"
    src="https://www.facebook.com/tr?id=346568425169694&ev=PageView&noscript=1"
    /></noscript>
    <!-- End Meta Pixel Code -->
    <!-- Reddit Pixel -->
    <script>
    !function(w,d){if(!w.rdt){var p=w.rdt=function(){p.sendEvent?p.sendEvent.apply(p,arguments):p.callQueue.push(arguments)};p.callQueue=[];var t=d.createElement("script");t.src="/reddit-pixel.js",t.async=!0;var s=d.getElementsByTagName("script")[0];s.parentNode.insertBefore(t,s)}}(window,document);rdt('init','a2_feojnozacoug');rdt('track', 'PageVisit');
    </script>
    <!-- DO NOT MODIFY UNLESS TO REPLACE A USER IDENTIFIER -->
    <!-- End Reddit Pixel -->
'@

# Loading overlay HTML
$loaderHtml = @'
<!-- Loading Overlay -->
    <style>
      #page-loader {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgb(245 247 250);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 99999;
        transition: opacity 0.3s ease-out;
      }
      #page-loader.hidden {
        opacity: 0;
        pointer-events: none;
      }
      .spinner {
        width: 40px;
        height: 40px;
        border: 3px solid rgb(182 188 205);
        border-top-color: rgb(45 102 196);
        border-radius: 50%;
        animation: spin 0.8s linear infinite;
      }
      @keyframes spin {
        to { transform: rotate(360deg); }
      }
    </style>
    <div id="page-loader"><div class="spinner"></div></div>
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
    <!-- End Loading Overlay -->
'@

Write-Host "Applying pixels and loader to HTML files in: $basePath"
Write-Host ""

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    $modified = $false

    # Skip files in the ad folder
    if ($file.FullName -like "*\ad\*") {
        Write-Host "Skipped (ad folder): $($file.Name)"
        continue
    }

    # Insert scroll fix as FIRST thing in head (before anything else)
    if ($content -notmatch 'Scroll Fix') {
        $content = $content -replace '(<head[^>]*>)', "`$1`n$scrollFix"
        $modified = $true
    }

    # Insert pixels after scroll fix
    if ($content -notmatch 'Meta Pixel Code') {
        $content = $content -replace '(<!-- Scroll Fix -->.*?</script>)', "`$1`n$pixelCode"
        $modified = $true
    }

    # Insert loader after <body ...> if not already present
    if ($content -notmatch 'id="page-loader"') {
        $content = $content -replace '(<body[^>]*>)', "`$1`n$loaderHtml"
        $modified = $true
    }

    # Remove scroll-behavior: smooth (causes issues with anchor navigation)
    if ($content -match 'scroll-behavior:\s*smooth') {
        $pattern = '/\*\s*Make links scroll to their sections smoothly\.\s*\*/\s*\r?\n\s*\*\s*\{\s*\r?\n\s*scroll-behavior:\s*smooth;\s*\r?\n\s*\}'
        $content = $content -replace $pattern, ''
        $modified = $true
    }

    # Fix same-page anchor links to use relative hash (bypasses Vike's client-side routing)
    $relativePath = $file.FullName.Replace($basePath, '').Replace('\', '/').Replace('/index.html', '')
    if ($relativePath -eq '') { $relativePath = '/' }
    $anchorPattern = "href=""$relativePath#([^""]+)"""
    if ($content -match $anchorPattern) {
        $content = $content -replace $anchorPattern, 'href="#$1"'
        $modified = $true
    }

    if ($modified) {
        Set-Content $file.FullName -Value $content -NoNewline
        Write-Host "Updated: $($file.FullName)"
    } else {
        Write-Host "Skipped (already has changes): $($file.Name)"
    }
}

Write-Host ""
Write-Host "Done!"
