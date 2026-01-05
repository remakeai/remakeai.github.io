# Claude Code Addendum: Commercial Developer Interest

This is a small update to capture commercial developer interest on the `/retrofit` page without creating a separate funnel.

---

## Update 1: Add "Building a Business" Subsection

In the **FOR DEVELOPERS & MAKERS** section, after the SDK/Platform info and before the developer signup form, add:

```
BUILDING A BUSINESS

Planning to sell apps commercially? Our app store will support 
paid apps with revenue sharing for developers. 

Details (pricing, revenue split, featuring program) coming as 
we approach launch. Interested in commercial development? 
Let us know below — we'll share program details with you first.
```

Keep this brief — it's a signal, not a pitch. You don't have the details yet.

---

## Update 2: Update Developer Signup Form

**Change from:**
```
JOIN AS A DEVELOPER

Get early SDK access and start building robot apps.

[Email address field]

☐ I'm a developer interested in building robot apps
☐ I'm an educator interested in robotics curriculum
☐ I already have development hardware (kit or rooted vacuum)

What do you want to build? (Optional)
[Text field]

[Join Developer Waitlist]
```

**Change to:**
```
JOIN AS A DEVELOPER

Get early SDK access and start building robot apps.

[Email address field]

☐ I'm a hobbyist/maker — building for fun or personal use
☐ I'm interested in commercial development — selling apps on the store
☐ I'm an educator — interested in robotics curriculum
☐ I already have development hardware (kit or rooted vacuum)

What do you want to build? (Optional)
[Text field]

[Join Developer Waitlist]
```

**Key change:** Split the generic "developer" checkbox into "hobbyist" and "commercial" to segment interest.

---

## Update 3: Tracking (Optional)

If using Tally or native forms, capture the commercial checkbox separately so you can:
- Count commercial vs hobbyist interest
- Reach out to commercial developers first when program is ready
- Tailor messaging in follow-up emails

If using Meta Pixel, you could track differently:

```javascript
// Hobbyist signup
fbq('track', 'Lead', {content_name: 'developer_hobbyist'});

// Commercial signup  
fbq('track', 'Lead', {content_name: 'developer_commercial'});
```

This is optional — even just the checkbox helps you segment manually later.

---

## Why This Approach

| Alternative | Problem |
|-------------|---------|
| Separate commercial funnel | Nothing to pitch yet (no users, no revenue share defined) |
| Ignore commercial devs | Miss high-value leads |
| Promise revenue share now | You haven't figured it out yet |
| **Checkbox + brief mention** | **Captures interest without overpromising** |

Commercial developers will self-identify. You can follow up with them directly when you have a real program to offer.

---

## Summary of Changes

| Location | Change |
|----------|--------|
| Developer section | Add "Building a Business" paragraph |
| Developer signup form | Split into hobbyist vs commercial checkboxes |
| Tracking (optional) | Separate events for hobbyist vs commercial |

These are minor copy/form changes — no new pages needed.
