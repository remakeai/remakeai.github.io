# Claude Code Quick Fixes: Critical Issues Before Ads

These fixes are **URGENT** — the site cannot collect payments or show videos in its current state.

---

## FIX 1: PayPal Buttons (CRITICAL)

### Problem
All reserve pages show `PAYPAL_BUTTON_PLACEHOLDER` instead of actual payment buttons.

### Pages Affected
- `/reserve/playmate/`
- `/reserve/games/`
- `/reserve/screens/`
- `/reserve/innovation/`

### Solution

Replace ALL instances of:
```html
[Reserve for $1 → Get $20 Off](PAYPAL_BUTTON_PLACEHOLDER)
```

With a real PayPal button. User will provide one of these:

**Option A: PayPal.me link**
```html
<a href="https://www.paypal.com/paypalme/USERNAME/1" class="cta-button" target="_blank" rel="noopener">
  Reserve for $1 → Get $20 Off
</a>
```

**Option B: PayPal Button Code**
User will paste PayPal-generated button code.

**Option C: PayPal JS SDK**
```html
<div id="paypal-button-container"></div>
<script src="https://www.paypal.com/sdk/js?client-id=CLIENT_ID&currency=USD"></script>
<script>
  paypal.Buttons({
    createOrder: function(data, actions) {
      return actions.order.create({
        purchase_units: [{
          amount: { value: '1.00' },
          description: 'remake robot vacuum reservation - $20 discount'
        }]
      });
    },
    onApprove: function(data, actions) {
      return actions.order.capture().then(function(details) {
        window.location.href = '/reserve/thanks/';
      });
    }
  }).render('#paypal-button-container');
</script>
```

### Locations to Replace

Each reserve page has **multiple** CTA buttons:
1. Hero section CTA
2. Under each product tier card (3 buttons)
3. Final CTA section at bottom

**Total: 5 buttons per page × 4 pages = 20 replacements**

All buttons should go to the same PayPal checkout. User chooses model later.

---

## FIX 2: YouTube Video Embeds (CRITICAL)

### Problem
Video sections show text captions but no actual video player.

### Pages Affected
- `/reserve/playmate/` — "Watch a game of hide-and-seek in action"
- `/reserve/games/` — "See the robot app store in action"
- `/reserve/screens/` — "Watch screen time turn into play time"
- `/reserve/innovation/` — "See the future of home robots"

### Solution

Add YouTube embed above or replacing the caption text:

```html
<div class="video-container">
  <iframe 
    width="100%" 
    height="400" 
    src="https://www.youtube.com/embed/VIDEO_ID" 
    title="remake robot vacuum demo"
    frameborder="0" 
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
    allowfullscreen>
  </iframe>
</div>
<p class="video-caption">Watch a game of hide-and-seek in action</p>
```

### CSS for Responsive Video

```css
.video-container {
  position: relative;
  width: 100%;
  max-width: 800px;
  margin: 0 auto 1rem;
}

.video-container iframe {
  width: 100%;
  aspect-ratio: 16 / 9;
  height: auto;
  border-radius: 8px;
}

.video-caption {
  text-align: center;
  color: #666;
  font-size: 0.9rem;
  margin-top: 0.5rem;
}
```

### Video ID

User needs to provide the YouTube video ID. 

If the video URL is `https://www.youtube.com/watch?v=5xbXqkkQknk`, the ID is `5xbXqkkQknk`.

The homepage already links to this video, so likely use: `5xbXqkkQknk`

---

## FIX 3: Developer Kit Purchase Links (HIGH)

### Problem
On `/signup/diy/`, the ROS2 Kit ($150) and Vacuum Mockup Kit ($150) show prices but no way to purchase.

### Current State
```
### ROS2 Development Kit
$150
...
(no purchase link)
```

### Solution

Add purchase buttons/links to each kit card:

```html
<a href="STORE_URL_ROS2_KIT" class="buy-button" target="_blank" rel="noopener">
  Buy ROS2 Kit — $150
</a>
```

```html
<a href="STORE_URL_VACUUM_MOCKUP" class="buy-button" target="_blank" rel="noopener">
  Buy Vacuum Mockup — $150
</a>
```

User needs to provide:
- `STORE_URL_ROS2_KIT` — Link to ROS2 kit in their store
- `STORE_URL_VACUUM_MOCKUP` — Link to vacuum mockup kit in their store

If products aren't ready to sell yet, change to:

```html
<button class="buy-button disabled" disabled>
  Coming Soon — $150
</button>
```

Or add to the developer signup form:
```html
☐ I'm interested in purchasing a development kit ($150)
```

---

## FIX 4: Essential Tier Specs (HIGH)

### Problem
Essential tier specs on website don't match planned specs:

| Spec | Planned | On Website |
|------|---------|------------|
| Suction | 7,000 Pa | 3,000 Pa |
| Mop | Dual spinning, auto-lift | Static |
| Runtime | 150 min | 120 min |
| Dustbin | 400ml | Not shown |
| Water Tank | 300ml | Not shown |

### Decision Required
User needs to confirm: **Keep current specs or update to planned specs?**

### If Updating to Planned Specs

Find and replace on ALL reserve pages:

**Current Essential card:**
```
* Suction 3,000 Pa
* Navigation 2D LiDAR + Mapping
* Mop Static
* Runtime 120 minutes
* Dock Charging only
* Noise 65 dB
```

**Replace with:**
```
* Suction 7,000 Pa
* Navigation 2D LiDAR + Mapping
* Mop Dual spinning pads, auto-lift
* Runtime 150 minutes
* Dock Standard charging
* Threshold 20mm climb
```

Pages to update:
- `/reserve/playmate/`
- `/reserve/games/`
- `/reserve/screens/`
- `/reserve/innovation/`

---

## FIX 5: Homepage Routing (MEDIUM)

### Problem
Homepage uses separate Mailchimp signup instead of routing to funnels.

### Current State
- "Join Launch Waitlist" → Mailchimp embed
- Fragments audience into separate list
- Doesn't route to conversion funnels

### Solution

Replace the Mailchimp signup section with funnel routing:

```html
<section class="funnel-routing">
  <h2>Get Started</h2>
  
  <div class="route-cards">
    <div class="route-card">
      <h3>For Families</h3>
      <p>Reserve a robot vacuum that plays games with your kids.</p>
      <a href="/reserve/playmate/" class="cta-button">Reserve for $1 →</a>
    </div>
    
    <div class="route-card">
      <h3>For Developers</h3>
      <p>Build apps for robots. Free SDK access.</p>
      <a href="/signup/diy/" class="cta-button secondary">Join Developer Program →</a>
    </div>
    
    <div class="route-card">
      <h3>For Partners</h3>
      <p>Game studios, educators, and content creators.</p>
      <a href="/signup/partners/" class="cta-button secondary">Partner With Us →</a>
    </div>
  </div>
</section>
```

### Also Update Hero CTA

**Current:**
```html
[Join Launch Waitlist](/#signup)
```

**Change to:**
```html
[Reserve for $1 →](/reserve/playmate/)
```

### Keep or Remove Mailchimp?

**Recommendation:** Remove Mailchimp signup entirely. All leads should go through the purpose-built funnels which have proper tracking and segmentation.

If user wants to keep a general signup for people who don't fit other categories, move it to footer only:

```html
<footer>
  <p>Just want updates? <a href="MAILCHIMP_LINK">Join our newsletter</a></p>
</footer>
```

---

## FIX 6: Cross-Navigation (LOW)

### Problem
Pages don't link to each other, making it hard for visitors to find the right funnel.

### Solution

Add subtle cross-links in page footers:

**On Reserve pages (`/reserve/*`):**
```html
<p class="cross-link">Already have a robot vacuum? <a href="/signup/diy/">Get free software for your existing vacuum →</a></p>
```

**On DIY page (`/signup/diy/`):**
```html
<p class="cross-link">Want plug-and-play hardware? <a href="/reserve/playmate/">Reserve a remake robot →</a></p>
```

**On Partners page (`/signup/partners/`):**
```html
<p class="cross-link">Individual developer? <a href="/signup/diy/">Join our developer program →</a></p>
```

### Placement
Add just above the footer, styled subtly:

```css
.cross-link {
  text-align: center;
  padding: 2rem 1rem;
  background: #f8f8f8;
  color: #666;
  font-size: 0.9rem;
}

.cross-link a {
  color: #0066cc;
}
```

---

## IMPLEMENTATION CHECKLIST

### Before ANY Ads (Do First)
- [ ] Replace PayPal placeholders with real buttons (20 buttons across 4 pages)
- [ ] Embed YouTube video on all reserve pages
- [ ] Confirm video ID to use (likely `5xbXqkkQknk`)

### Before Scaling
- [ ] Add purchase links for dev kits (or "Coming Soon")
- [ ] Confirm Essential tier specs — update if needed
- [ ] Update homepage to route to funnels
- [ ] Remove or de-emphasize Mailchimp signup

### Nice to Have
- [ ] Add cross-navigation links in footers
- [ ] Test all payment flows end-to-end
- [ ] Verify Meta Pixel fires on thank you page

---

## PLACEHOLDERS USER NEEDS TO PROVIDE

| Placeholder | Where | User Action |
|-------------|-------|-------------|
| PayPal button code or PayPal.me link | All reserve pages | Set up PayPal and provide code |
| YouTube video ID | All reserve pages | Confirm which video to use |
| ROS2 Kit store URL | /signup/diy/ | Provide link or confirm "Coming Soon" |
| Vacuum Mockup store URL | /signup/diy/ | Provide link or confirm "Coming Soon" |
| Essential tier specs | All reserve pages | Confirm: keep 3,000 Pa or update to 7,000 Pa? |

---

## TESTING AFTER FIXES

1. **Payment flow:** Click reserve button → PayPal checkout → Complete $1 payment → Land on /reserve/thanks/
2. **Video playback:** Videos load and play on all reserve pages
3. **Dev kit links:** Kit purchase buttons lead to correct store pages
4. **Mobile:** All fixes work on mobile devices
5. **Tracking:** Meta Pixel fires `Purchase` event on thank you page

---

## PRIORITY ORDER

```
1. PayPal buttons      ← Can't collect money without this
2. YouTube embeds      ← Can't show product without this  
3. Dev kit links       ← Blocking potential sales
4. Essential specs     ← May affect purchase decisions
5. Homepage routing    ← Improves conversion
6. Cross-navigation    ← Nice to have
```

Fix #1 and #2 today. Fix #3-4 this week. Fix #5-6 before scaling ads.
