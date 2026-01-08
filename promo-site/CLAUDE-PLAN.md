# Galaxy Promo Site Implementation Plan

## Overview
Build a promotional slideshow website for Galaxy Project conference booth displays. The site will feature 15 pages across 3 categories with auto-play functionality and Apple-inspired design aesthetics.

**Decisions confirmed:**
- Framework: Custom vanilla JS + CSS (lightweight, full control)
- Images: Extract only referenced images (2, 5, 6, 13) from RS.md
- Word cloud: Scrape GTN at build time, bundle data for offline use
- Deployment: Offline kiosk (single HTML file + bundled assets)

---

## Project Structure

```
promo-site/
├── index.html              # Single-file entry (can inline CSS/JS for true single-file)
├── css/
│   └── styles.css          # Apple-style design system
├── js/
│   ├── app.js              # Main application, slide management
│   ├── autoplay.js         # Timer/auto-advance logic
│   └── wordcloud.js        # D3-cloud for animated word cloud
├── content/                # Markdown slide content (compiled at build)
│   ├── 01-galaxy-numbers.md
│   ├── 02-user-growth.md
│   ├── 03-citations.md
│   ├── 04-scalability.md
│   ├── 05-tool-ecosystem.md
│   ├── 06-training-hub.md
│   ├── 07-applications.json  # Pre-fetched GTN topics
│   ├── 08-vgp.md
│   ├── 09-global-instances.md
│   ├── 10-iuc.md
│   ├── 11-iwc.md
│   ├── 12-biocontainers.md
│   ├── 13-planemo.md
│   ├── 14-pulsar.md
│   └── 15-tpv.md
├── images/
│   ├── image2.png          # User growth chart (extract from RS.md)
│   ├── image5.png          # Journal citations (extract from RS.md)
│   ├── image6.png          # ACCESS-CI infrastructure (extract from RS.md)
│   ├── image13.png         # GTA world map (extract from RS.md)
│   ├── tree.png            # VGP phylogenetic tree (existing)
│   └── screenshots/        # Server screenshots
│       ├── usegalaxy-org.png
│       ├── usegalaxy-eu.png
│       └── usegalaxy-org-au.png
├── build.sh                # Build script (extracts images, fetches GTN)
└── README.md
```

---

## Implementation Steps

### Step 1: Project Setup & Base HTML
- Create `promo-site/index.html` with semantic structure
- Set up slide container with data attributes for content
- Implement masthead navigation with 3 sections

### Step 2: Apple-Style CSS Design System
Create `css/styles.css` with:
- Typography: SF Pro Display with fallback stack (`-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto`)
- Color palette from usegalaxy.org: `#2c3143` (primary), `#FFD700` (accent), `#f8f9fa` (light text)
- Generous whitespace, large readable type
- Smooth transitions (0.6s ease-out)
- Responsive breakpoints

### Step 3: Extract Images from RS.md
Create `build.sh` script to:
```bash
# Extract base64 images 2, 5, 6, 13 from RS.md
# Decode and save as PNG files to images/
```

### Step 4: Fetch GTN Topics
Add to `build.sh`:
```bash
# Fetch https://training.galaxyproject.org/training-material/
# Parse scientific fields and methodologies
# Save as content/07-applications.json
```

### Step 5: Slide Management (app.js)
```javascript
// Core functionality:
// - Load slide content from DOM or JSON
// - Handle navigation (prev/next/goto)
// - Update masthead active state
// - Dispatch events for autoplay coordination
```

### Step 6: Auto-Play System (autoplay.js)
```javascript
const CONFIG = {
  interval: 10000,      // 10s per slide
  transitionDuration: 600,
  pauseOnHover: true,
  loop: true
};
// Progress bar animation
// Pause/resume on spacebar
// Reset timer on manual navigation
```

### Step 7: Animated Word Cloud (wordcloud.js)
- Use d3-cloud library (bundled for offline)
- Topics from GTN: Genomics, Transcriptomics, Proteomics, Metabolomics, Climate, Ecology, etc.
- Gentle floating animation
- Color palette matching site theme

### Step 8: Create Markdown Content Files
Extract content from RS.md sections:

| File | Source Section | Key Stats |
|------|----------------|-----------|
| 01-galaxy-numbers.md | 1.1 | 750K jobs/mo, 400K users, $2M infra |
| 02-user-growth.md | 1.3.2 | 600K worldwide, 100K new/year |
| 03-citations.md | 1.4.1 | 22,000+ citations, 1,455 journals |
| 04-scalability.md | 1.4.2 | ACCESS-CI, TACC, PSC, SDSC |
| 05-tool-ecosystem.md | 1.4.3 | BioConda 11,699, BioContainers 12,333 |
| 06-training-hub.md | 1.4.7 | 489 tutorials, 35 topics, GTA 2025 |
| 08-vgp.md | vgp.md | 600 species, Jetstream2 |

### Step 9: Capture Server Screenshots
- Take screenshots of usegalaxy.org, .eu, .org.au
- Crop to consistent dimensions (1280x800)
- Save to `images/screenshots/`

### Step 10: Fetch External Content
For ecosystem pages (10-15), fetch and bundle:
- GitHub repo descriptions and stats
- BioContainers overview

### Step 11: Polish & Testing
- Test keyboard navigation (arrows, space, escape)
- Verify offline functionality
- Check all transitions
- Responsive testing

---

## Slide Visual Design

### Global Use Section (Pages 1-6)
Clean stat cards with:
- Large numbers (72px font)
- Subtle icons
- Supporting text below

### Capabilities Section (Pages 7-8)
- Page 7: Full-screen animated word cloud
- Page 8: Split layout - text left, tree.png right

### Ecosystem Section (Pages 9-15)
- Cards with logos and brief descriptions
- GitHub-style stats (commits, PRs, releases)
- use logos when they are avaialble at respective github pages

---

## Key Files to Modify/Create

| File | Action |
|------|--------|
| `promo-site/index.html` | Create |
| `promo-site/css/styles.css` | Create |
| `promo-site/js/app.js` | Create |
| `promo-site/js/autoplay.js` | Create |
| `promo-site/js/wordcloud.js` | Create |
| `promo-site/build.sh` | Create |
| `promo-site/content/*.md` | Create (15 files) |
| `promo-site/images/*.png` | Extract from RS.md |

---

## Verification Plan

1. Run `./build.sh` - images extracted, GTN data fetched
2. Open `index.html` in browser - all 15 slides render
3. Press **Space** - auto-play starts/stops
4. Press **Arrow keys** - manual navigation works
5. Wait 10 seconds - slide auto-advances
6. Check Page 7 - word cloud animates
7. Resize browser - responsive layout adapts
8. Disconnect network - site works offline
9. Compare each slide to RS.md source data
