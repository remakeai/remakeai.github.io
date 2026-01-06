# Claude Code Instructions: Revised Homepage

## Objective

Redesign the homepage to:
1. Tell the platform story clearly (10-second understanding)
2. Route visitors to appropriate funnels
3. Establish primary CTA (consumer reservation)
4. Remove Mailchimp signup (all leads go through purpose-built funnels)

---

## Current Problems

| Issue | Impact |
|-------|--------|
| Generic "Apps Marketplace" messaging | Doesn't differentiate or excite |
| Mailchimp signup | Fragments audience, no segmentation |
| Three audience boxes but weak CTAs | Unclear where to go |
| No visual explanation of platform | Hard to understand quickly |
| Buried video link | Misses engagement opportunity |

---

## New Homepage Structure

```
┌─────────────────────────────────────────────────────────────┐
│  HEADER                                                     │
│  Logo + minimal nav (Careers, About, Updates)               │
├─────────────────────────────────────────────────────────────┤
│  HERO                                                       │
│  ├── Headline: "The App Store for Home Robots"              │
│  ├── Subheadline: What this means                           │
│  ├── Primary CTA: Reserve for $1                            │
│  └── Secondary CTA: Watch Video                             │
├─────────────────────────────────────────────────────────────┤
│  VIDEO SECTION                                              │
│  └── Embedded YouTube explainer                             │
├─────────────────────────────────────────────────────────────┤
│  PLATFORM VISUAL                                            │
│  └── Simple 3-layer ecosystem diagram                       │
├─────────────────────────────────────────────────────────────┤
│  THE PROBLEM / SOLUTION                                     │
│  ├── Why robots today are limited                           │
│  └── How remake changes that                                │
├─────────────────────────────────────────────────────────────┤
│  AUDIENCE ROUTING                                           │
│  ├── For Families → /reserve/playmate                       │
│  ├── For Developers → /signup/diy                           │
│  └── For Partners → /signup/partners                        │
├─────────────────────────────────────────────────────────────┤
│  SOCIAL PROOF / STATUS                                      │
│  └── Launching 2026, reservations open, etc.                │
├─────────────────────────────────────────────────────────────┤
│  FOOTER                                                     │
│  └── Standard footer with links                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Section Content

### Header

Keep existing header structure but ensure nav is minimal:

```html
<header>
  <a href="/" class="logo">
    <img src="/assets/remake_ai_logo_95x64px_sM-njGt3HJob3_3UYzTBG.png" alt="remake">
  </a>
  <nav>
    <a href="https://www.linkedin.com/company/remake-ai/jobs/">Careers</a>
    <a href="https://iliaov.substack.com/">Updates</a>
    <a href="https://www.linkedin.com/company/remake-ai/about/">About</a>
  </nav>
</header>
```

---

### Hero Section

**Headline:**
```
The App Store for Home Robots
```

**Subheadline:**
```
Your robot vacuum learns to play hide-and-seek. Your robot dog gets new tricks. 
One platform connects apps, robots, and families.
```

**Primary CTA:**
```
[Reserve for $1 → Get $20 Off]  →  /reserve/playmate
```

**Secondary CTA:**
```
[Watch How It Works ↓]  →  scrolls to video section
```

**Trust line below CTAs:**
```
Launching 2026 • First 2,000 units • Fully refundable
```

---

### Video Section

Embed the explainer video directly (currently linked but not embedded):

```html
<section class="video-section">
  <div class="video-container">
    <iframe 
      src="https://www.youtube.com/embed/5xbXqkkQknk" 
      title="remake explainer video"
      frameborder="0" 
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
      allowfullscreen>
    </iframe>
  </div>
  <p class="video-caption">See how remake turns ordinary robots into playmates</p>
</section>
```

---

### Platform Visual Section

**Headline:**
```
How It Works
```

**Visual: 3-Layer Ecosystem**

Create a simple, clean diagram showing:

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                         APPS                                │
│            Games • Education • Security • Utility           │
│                                                             │
│         Built by developers. New apps every week.           │
│                                                             │
│                          ↕                                  │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                      PLATFORM                        │   │
│  │                    (remake)                          │   │
│  │                                                      │   │
│  │   Connects everything. Runs on any compatible robot. │   │
│  └─────────────────────────────────────────────────────┘   │
│                          ↕                                  │
│                                                             │
│                        ROBOTS                               │
│          Vacuums • Quadrupeds • Drones • More              │
│                                                             │
│         Starting with robot vacuums. Expanding.            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Implementation notes:**
- Use CSS/HTML to create this visually
- Keep it simple — boxes with arrows
- Mobile: Stack vertically
- Use brand colors for the platform layer (it's the hero)

**Text below diagram:**
```
Write an app once. Run it on any robot.
Buy a robot once. Get new apps forever.
```

---

### Problem / Solution Section

**Headline:**
```
Robots Today Are Stuck
```

**The Problem (3 short points):**

```
🔒 Locked Down
Your robot only does what the manufacturer programmed. 
No new features. No games. No growth.

📱 Siloed Apps
Every robot brand has its own app. 
Nothing works together. No ecosystem.

😴 Gets Boring
Kids play with it once, then it sits in the corner. 
Robots should get MORE interesting over time, not less.
```

**The Solution:**

```
remake changes that.

We're building the app layer for home robots — starting with 
robot vacuums that play hide-and-seek with your kids.

One platform. New apps every week. Robots that grow with your family.
```

---

### Audience Routing Section

**Headline:**
```
Get Started
```

**Three cards:**

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐ │
│  │                 │  │                 │  │             │ │
│  │  FOR FAMILIES   │  │  FOR DEVELOPERS │  │ FOR PARTNERS│ │
│  │                 │  │                 │  │             │ │
│  │  A robot that   │  │  Build apps for │  │ Game studios│ │
│  │  plays with     │  │  robots. Free   │  │ & educators │ │
│  │  your kids.     │  │  SDK access.    │  │ welcome.    │ │
│  │                 │  │                 │  │             │ │
│  │  [Reserve $1]   │  │  [Join Free →]  │  │ [Partner →] │ │
│  │                 │  │                 │  │             │ │
│  │  $199-499       │  │  Free software  │  │ Revenue     │ │
│  │  Ships 2026     │  │  + $150 kits    │  │ sharing     │ │
│  │                 │  │                 │  │             │ │
│  └─────────────────┘  └─────────────────┘  └─────────────┘ │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Card 1: For Families**
```
Headline: For Families
Body: A robot vacuum that cleans AND plays hide-and-seek with your kids. New games added regularly.
CTA: [Reserve for $1 →]
Link: /reserve/playmate
Footer: $199-499 • Ships Holiday 2026
```

**Card 2: For Developers**
```
Headline: For Developers
Body: Build apps for robots. Free SDK access. Use your own vacuum or buy a dev kit.
CTA: [Join Developer Program →]
Link: /signup/diy
Footer: Free to start • Kits from $150
```

**Card 3: For Partners**
```
Headline: For Partners
Body: Game studios and educators — bring your content to a new platform. Revenue sharing available.
CTA: [Explore Partnership →]
Link: /signup/partners
Footer: 70/30 revenue share
```

---

### Social Proof / Status Section

**Headline:**
```
Launching 2026
```

**Content:**
```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   📅                    🎯                    🇺🇸           │
│   Spring 2026           First 2,000          US-Based       │
│   Campaign Launch       Units Reserved       Company        │
│                         First Come,                         │
│                         First Served                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**When you have real numbers, update to:**
```
X reservations • Y developers • Launching Spring 2026
```

**Final CTA:**
```
[Reserve Your Spot → $1, Fully Refundable]
```

---

### Footer

Keep similar to current but ensure consistency:

```html
<footer>
  <div class="footer-content">
    <div class="footer-logo">
      <a href="/">
        <img src="/assets/remake_ai_logo_95x64px_sM-njGt3HJob3_3UYzTBG.png" alt="remake">
      </a>
    </div>
    
    <div class="footer-section">
      <h4>Company</h4>
      <a href="https://www.linkedin.com/company/remake-ai/jobs/">Careers</a>
      <a href="https://www.linkedin.com/company/remake-ai/about/">About</a>
      <a href="https://iliaov.substack.com/">Founder Updates</a>
    </div>
    
    <div class="footer-section">
      <h4>Connect</h4>
      <a href="https://www.linkedin.com/company/remake-ai/">LinkedIn</a>
      <a href="https://www.facebook.com/remakeai">Facebook</a>
      <a href="https://youtube.com/@remakeai">YouTube</a>
      <a href="https://iliaov.substack.com/">Substack</a>
    </div>
    
    <div class="footer-section">
      <h4>Legal</h4>
      <a href="/privacy-policy">Privacy Policy</a>
      <a href="mailto:hello@remake.ai">Contact</a>
    </div>
  </div>
  
  <div class="footer-bottom">
    <p>© 2025 remake</p>
  </div>
</footer>
```

---

## What to REMOVE

### Mailchimp Signup Form

**Remove entirely.** 

Current Mailchimp signup fragments your audience into a separate list with no segmentation. All leads should go through the purpose-built funnels:

- Families → /reserve/playmate (captures email via PayPal)
- Developers → /signup/diy (captures email + interests)
- Partners → /signup/partners (captures company + interests)

If someone doesn't fit those categories, they can subscribe to your Substack (founder updates) via the link in the footer.

### Generic "Apps Marketplace" Messaging

Replace with specific, concrete language:
- ❌ "Apps Marketplace for Consumer Robots"
- ✅ "The App Store for Home Robots"

- ❌ "Unlock the full potential of your home robot"
- ✅ "Your robot vacuum learns to play hide-and-seek"

### "More Helpful / More Personal / More Fun" Section

This is too generic. Replace with the Problem/Solution section that tells a story.

---

## Design Notes

### Hierarchy

1. **Hero** — Biggest, boldest. One clear message.
2. **Video** — Immediately shows what this is
3. **Platform visual** — Explains how it works
4. **Problem/Solution** — Builds understanding
5. **Routing cards** — Equal weight, clear paths
6. **Status/CTA** — Reinforces launch timing

### Visual Consistency

Apply the same styling as landing pages:
- Same colors, typography, spacing
- Same button styles
- Same card styles
- Feels like one cohesive site

### Mobile

- Stack everything vertically
- Routing cards: full width, stacked
- Platform diagram: simplified or stacked vertically
- Video: responsive embed

---

## Implementation Checklist

### Content
- [ ] Update hero headline and subheadline
- [ ] Embed video (not just link)
- [ ] Create platform ecosystem diagram
- [ ] Write problem/solution section
- [ ] Create 3 routing cards with CTAs
- [ ] Add status/launch section
- [ ] Update footer

### Remove
- [ ] Remove Mailchimp signup form entirely
- [ ] Remove generic "More Helpful / Personal / Fun" section
- [ ] Remove "Join Launch Waitlist" CTA (replace with specific CTAs)

### Technical
- [ ] All CTAs link to correct funnel pages
- [ ] Video embeds properly
- [ ] Platform diagram renders on mobile
- [ ] Meta Pixel still fires PageView

### Quality
- [ ] 10-second understanding test: Does a visitor immediately get what remake does?
- [ ] Clear next step: Does every visitor know where to go?
- [ ] No dead ends: Every section leads somewhere

---

## Before/After Comparison

| Element | Before | After |
|---------|--------|-------|
| Headline | "Apps Marketplace for Consumer Robots" | "The App Store for Home Robots" |
| Primary CTA | "Join Launch Waitlist" → Mailchimp | "Reserve for $1" → /reserve/playmate |
| Video | External link | Embedded |
| Platform explanation | None | Visual diagram |
| Value prop | Generic benefits | Problem/solution story |
| Audience routing | Weak boxes | Clear cards with CTAs |
| Email capture | Mailchimp (unsegmented) | Through funnels (segmented) |

---

## Summary

The revised homepage:

1. **Tells the platform story** in 10 seconds (headline + diagram)
2. **Shows, don't tell** (embedded video)
3. **Routes visitors** to appropriate funnels (3 clear paths)
4. **Prioritizes consumer reservation** (primary CTA throughout)
5. **Eliminates fragmentation** (no more Mailchimp sidebar)

This transforms the homepage from a generic "what we do" page into a strategic routing hub that supports your validation goals.
