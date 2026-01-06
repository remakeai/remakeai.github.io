# Claude Code Instructions: Restyle Landing Pages to Match Main Site

## Objective

Restyle all landing pages to visually match the main site (remake.ai) while maintaining their conversion-focused structure (minimal header/footer, no distracting navigation).

## Pages to Update

**Reservation funnel:**
- `/reserve/playmate/`
- `/reserve/games/`
- `/reserve/screens/`
- `/reserve/innovation/`
- `/reserve/thanks/`

**Signup funnels:**
- `/signup/diy/`
- `/signup/partners/`

---

## Step 1: Extract Design Tokens from Main Site

Before making changes, inspect `https://remake.ai/` to extract:

### Colors
```css
/* Extract these values from the main site */
--color-background: /* main page background */
--color-text: /* primary text color */
--color-text-muted: /* secondary/lighter text */
--color-heading: /* heading color if different */
--color-primary: /* primary brand/button color */
--color-primary-hover: /* button hover state */
--color-accent: /* any accent colors */
--color-border: /* border colors */
--color-card-bg: /* card/section backgrounds */
```

### Typography
```css
/* Extract font family, sizes, weights */
--font-family: /* e.g., 'Inter', 'system-ui', sans-serif */
--font-size-base: /* body text size */
--font-size-small: /* smaller text */
--font-size-h1: /* main heading */
--font-size-h2: /* section headings */
--font-size-h3: /* card headings */
--font-weight-normal: /* body weight */
--font-weight-medium: /* slightly bold */
--font-weight-bold: /* headings, emphasis */
--line-height: /* base line height */
```

### Spacing
```css
/* Extract spacing rhythm */
--spacing-xs: /* smallest spacing */
--spacing-sm: /* small spacing */
--spacing-md: /* medium spacing */
--spacing-lg: /* large spacing */
--spacing-xl: /* section padding */
--container-max-width: /* max content width */
--border-radius: /* rounded corners */
```

---

## Step 2: Fix Critical Visual Issues

### Issue 1: Black Background

**Problem:** Landing pages use black/dark background which:
- Doesn't match main site
- Makes PayPal button text invisible
- Creates jarring transition from main site

**Fix:** Change to light background matching main site.

```css
/* REMOVE any dark background styles */
body {
  background: var(--color-background); /* Use main site background */
  color: var(--color-text);
}

/* Remove dark section backgrounds */
section {
  background: transparent; /* or var(--color-background) */
}
```

### Issue 2: Logo White Background on Dark

**Problem:** Logo has white background that pops against dark background.

**Fix:** With light background, this resolves itself. Ensure logo displays cleanly:

```css
.header-logo img {
  height: 40px; /* or match main site logo size */
  width: auto;
  /* No background needed on light background */
}
```

### Issue 3: PayPal Button Visibility

**Problem:** PayPal text may be invisible on dark backgrounds.

**Fix:** Light background fixes this. Also ensure button container has appropriate styling:

```css
[id^="paypal-container-"] {
  display: flex;
  justify-content: center;
  margin: 1.5rem auto;
  max-width: 300px;
}
```

---

## Step 3: Implement Consistent Header

### Landing Page Header (Minimal)

```html
<header class="landing-header">
  <a href="/" class="header-logo">
    <img src="/assets/remake_ai_logo_95x64px_sM-njGt3HJob3_3UYzTBG.png" alt="remake">
  </a>
</header>
```

### Header Styling

Match main site header styling but remove navigation:

```css
.landing-header {
  display: flex;
  justify-content: flex-start; /* or center if main site centers logo */
  align-items: center;
  padding: 1rem 2rem;
  max-width: var(--container-max-width);
  margin: 0 auto;
}

.header-logo img {
  height: 40px; /* Match main site */
  width: auto;
}
```

---

## Step 4: Implement Consistent Footer

### Landing Page Footer (Minimal)

```html
<footer class="landing-footer">
  <div class="footer-content">
    <p class="footer-copyright">© 2025 remake</p>
    <nav class="footer-links">
      <a href="/privacy-policy">Privacy Policy</a>
      <a href="mailto:hello@remake.ai">Contact</a>
    </nav>
  </div>
</footer>
```

### Footer Styling

```css
.landing-footer {
  margin-top: 4rem;
  padding: 2rem;
  border-top: 1px solid var(--color-border);
  text-align: center;
}

.footer-content {
  max-width: var(--container-max-width);
  margin: 0 auto;
}

.footer-copyright {
  color: var(--color-text-muted);
  font-size: var(--font-size-small);
  margin-bottom: 0.5rem;
}

.footer-links {
  display: flex;
  justify-content: center;
  gap: 1.5rem;
}

.footer-links a {
  color: var(--color-text-muted);
  font-size: var(--font-size-small);
  text-decoration: none;
}

.footer-links a:hover {
  color: var(--color-primary);
}
```

---

## Step 5: Section Styling

### Hero Section

```css
.hero {
  padding: var(--spacing-xl) var(--spacing-md);
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
}

.hero h1 {
  font-size: var(--font-size-h1);
  font-weight: var(--font-weight-bold);
  color: var(--color-heading);
  margin-bottom: 1rem;
  line-height: 1.2;
}

.hero .subheadline {
  font-size: 1.25rem;
  color: var(--color-text-muted);
  margin-bottom: 2rem;
  line-height: 1.6;
}
```

### Product Tier Cards

```css
.tier-cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
  max-width: 1000px;
  margin: 0 auto;
  padding: var(--spacing-md);
}

.tier-card {
  background: var(--color-card-bg);
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius);
  padding: 2rem;
  text-align: center;
}

.tier-card.popular {
  border-color: var(--color-primary);
  /* Or remove the "Popular" badge entirely per earlier discussion */
}

.tier-card h3 {
  font-size: var(--font-size-h3);
  font-weight: var(--font-weight-bold);
  margin-bottom: 0.5rem;
}

.tier-card .price {
  font-size: 2rem;
  font-weight: var(--font-weight-bold);
  color: var(--color-heading);
}

.tier-card .price-original {
  text-decoration: line-through;
  color: var(--color-text-muted);
  font-size: 1rem;
}

.tier-card ul {
  text-align: left;
  list-style: none;
  padding: 0;
  margin: 1.5rem 0;
}

.tier-card li {
  padding: 0.5rem 0;
  border-bottom: 1px solid var(--color-border);
  font-size: 0.9rem;
}
```

### Feature/Benefits Sections

```css
.features-section {
  padding: var(--spacing-xl) var(--spacing-md);
  max-width: var(--container-max-width);
  margin: 0 auto;
}

.features-section h2 {
  font-size: var(--font-size-h2);
  font-weight: var(--font-weight-bold);
  text-align: center;
  margin-bottom: 2rem;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.feature-item {
  text-align: center;
}

.feature-item h3 {
  font-size: 1.1rem;
  font-weight: var(--font-weight-medium);
  margin: 1rem 0 0.5rem;
}

.feature-item p {
  color: var(--color-text-muted);
  font-size: 0.95rem;
}
```

### Privacy/Cloud Section

```css
.privacy-section {
  background: var(--color-card-bg);
  padding: var(--spacing-xl) var(--spacing-md);
  margin: var(--spacing-xl) 0;
}

.privacy-modes {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
  max-width: 800px;
  margin: 2rem auto;
}

.privacy-mode {
  padding: 1.5rem;
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius);
  background: var(--color-background);
}

.privacy-badges {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 1rem;
  margin-top: 2rem;
}

.badge {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.5rem 1rem;
  background: var(--color-background);
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius);
  font-size: 0.85rem;
}
```

### FAQ Section

```css
.faq-section {
  padding: var(--spacing-xl) var(--spacing-md);
  max-width: 800px;
  margin: 0 auto;
}

.faq-item {
  border-bottom: 1px solid var(--color-border);
}

.faq-question {
  padding: 1.25rem 0;
  font-weight: var(--font-weight-medium);
  cursor: pointer;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.faq-question::after {
  content: '+';
  font-size: 1.5rem;
  color: var(--color-text-muted);
}

.faq-item.open .faq-question::after {
  content: '−';
}

.faq-answer {
  padding: 0 0 1.25rem;
  color: var(--color-text-muted);
  display: none;
}

.faq-item.open .faq-answer {
  display: block;
}
```

### How It Works Section

```css
.steps-section {
  padding: var(--spacing-xl) var(--spacing-md);
  max-width: var(--container-max-width);
  margin: 0 auto;
}

.steps {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 2rem;
  margin-top: 2rem;
}

.step {
  text-align: center;
}

.step-number {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: var(--color-primary);
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1rem;
  font-weight: var(--font-weight-bold);
}

.step h3 {
  font-size: 1rem;
  font-weight: var(--font-weight-medium);
  margin-bottom: 0.5rem;
}

.step p {
  font-size: 0.9rem;
  color: var(--color-text-muted);
}
```

---

## Step 6: Button Styling

Match main site button styling:

```css
.cta-button {
  display: inline-block;
  padding: 0.875rem 2rem;
  background: var(--color-primary);
  color: white;
  font-weight: var(--font-weight-medium);
  font-size: 1rem;
  border-radius: var(--border-radius);
  text-decoration: none;
  border: none;
  cursor: pointer;
  transition: background 0.2s ease;
}

.cta-button:hover {
  background: var(--color-primary-hover);
}

.cta-button.secondary {
  background: transparent;
  border: 1px solid var(--color-primary);
  color: var(--color-primary);
}

.cta-button.secondary:hover {
  background: var(--color-primary);
  color: white;
}
```

---

## Step 7: Video Container

```css
.video-section {
  padding: var(--spacing-lg) var(--spacing-md);
  max-width: 800px;
  margin: 0 auto;
}

.video-container {
  position: relative;
  width: 100%;
  border-radius: var(--border-radius);
  overflow: hidden;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.video-container iframe {
  width: 100%;
  aspect-ratio: 16 / 9;
  height: auto;
  display: block;
}

.video-caption {
  text-align: center;
  color: var(--color-text-muted);
  font-size: 0.9rem;
  margin-top: 1rem;
}
```

---

## Step 8: Form Styling (for signup pages)

```css
.form-group {
  margin-bottom: 1.25rem;
}

.form-label {
  display: block;
  font-weight: var(--font-weight-medium);
  margin-bottom: 0.5rem;
  font-size: 0.9rem;
}

.form-input,
.form-select,
.form-textarea {
  width: 100%;
  padding: 0.75rem 1rem;
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius);
  font-size: 1rem;
  font-family: inherit;
  background: var(--color-background);
  color: var(--color-text);
}

.form-input:focus,
.form-select:focus,
.form-textarea:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(var(--color-primary-rgb), 0.1);
}

.form-checkbox {
  display: flex;
  align-items: flex-start;
  gap: 0.75rem;
  margin-bottom: 0.75rem;
}

.form-checkbox input {
  margin-top: 0.25rem;
}
```

---

## Step 9: Trust Elements & Fine Print

```css
.trust-line {
  text-align: center;
  color: var(--color-text-muted);
  font-size: 0.85rem;
  margin-top: 1rem;
}

.scarcity-text {
  text-align: center;
  font-size: 0.9rem;
  color: var(--color-text-muted);
  margin-top: 0.75rem;
}

.disclaimer {
  font-size: 0.8rem;
  color: var(--color-text-muted);
  text-align: center;
  margin-top: 1.5rem;
  line-height: 1.6;
}
```

---

## Step 10: Responsive Adjustments

```css
@media (max-width: 768px) {
  .hero h1 {
    font-size: 2rem;
  }
  
  .hero .subheadline {
    font-size: 1.1rem;
  }
  
  .tier-cards {
    grid-template-columns: 1fr;
  }
  
  .features-grid {
    grid-template-columns: 1fr;
  }
  
  .steps {
    grid-template-columns: 1fr;
  }
  
  .privacy-modes {
    grid-template-columns: 1fr;
  }
  
  .landing-header {
    padding: 1rem;
  }
}
```

---

## Implementation Checklist

### Extract from main site
- [ ] Inspect remake.ai CSS
- [ ] Document color palette
- [ ] Document typography (fonts, sizes, weights)
- [ ] Document spacing values
- [ ] Document border-radius values

### Apply to landing pages
- [ ] Change background from dark to light
- [ ] Update all text colors
- [ ] Apply correct typography
- [ ] Style header (minimal, logo only)
- [ ] Style footer (minimal)
- [ ] Style hero sections
- [ ] Style product tier cards
- [ ] Style feature/benefits grids
- [ ] Style privacy section
- [ ] Style FAQ accordion
- [ ] Style how-it-works steps
- [ ] Style forms (signup pages)
- [ ] Style video containers
- [ ] Add responsive breakpoints

### Test
- [ ] All pages match main site look
- [ ] PayPal buttons visible and functional
- [ ] Logo displays correctly
- [ ] Mobile responsive
- [ ] Transitions from main site feel seamless

---

## Final Notes

### What Should Match Main Site
- Colors (background, text, accents)
- Typography (font family, sizes, weights)
- Spacing rhythm
- Border radius
- Button styling
- Overall "feel"

### What Should Remain Different
- No full navigation header (just logo)
- No full footer (just minimal legal links)
- Conversion-focused layout (not exploratory)
- Single clear CTA path

The goal is visual consistency so moving from main site → landing page feels like staying on the same site, while maintaining the focused conversion structure.
