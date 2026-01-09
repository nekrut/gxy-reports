# Galaxy Promo Site

A promotional slideshow website for Galaxy Project conference booth displays. Features 12 auto-playing slides showcasing Galaxy's workflow, global impact, capabilities, and ecosystem.

## Quick Start

```bash
# Open in browser
open index.html

# Or serve locally (optional)
python -m http.server 8000
# Then visit http://localhost:8000/promo-site/
```

## Editing Slides

Slide content is defined in `slides.md` and compiled to `index.html` via a build script.

```bash
# Install dependencies (first time only)
npm install

# Rebuild after editing slides.md
npm run build
```

### Markdown Format

```markdown
---
title: Galaxy Promo Site
masthead:
  - name: 1-2-3
    section: intro
---

# [section] Slide Title
> Subtitle text

Content here...

---

# [section] Next Slide
...
```

### Supported Slide Types

| Type | Directive | Description |
|------|-----------|-------------|
| Stats | `\| Stat \| Label \|` table | Grid of stat cards with colors |
| Intro | Default (with image) | Title, subtitle, centered image |
| Split | `> split` or `> split: reverse` | Two-column: text + image |
| Wordcloud | `> type: wordcloud` | Sparkly topic grid |
| Ecosystem | `> type: ecosystem` | Panel grid with logos |
| Galaxies | `> type: galaxies` | Global instances slide |
| Links | `> type: links` | Grid of clickable link cards |
| QR | `> type: qr` | Large centered QR code |

### Special Syntax

- `# [section] Title` - Section tag for masthead navigation
- `::: highlight ... :::` - Yellow-bordered highlight box
- `![alt](path)` - Images
- `**bold**` - Bold text in paragraphs

## Features

- **14 slides** across 4 sections: 1-2-3, Global Use, Capabilities, Ecosystem
- **Auto-play** with configurable per-slide durations and progress bar
- **Keyboard controls**: Space (pause/play), Arrow keys (navigate), Escape (resume)
- **Click navigation**: Dots, masthead links
- **Sparkly topic grid** with clickable links to GTN topics
- **Apple-inspired design** with Galaxy color scheme
- **Offline-ready**: All assets stored locally

## Controls

| Key | Action |
|-----|--------|
| `Space` | Pause / Resume auto-play |
| `→` | Next slide |
| `←` | Previous slide |
| `Escape` | Resume auto-play |

You can also click:
- **Dots** at bottom center to jump to any slide
- **Masthead links** to jump to section start

## Slide Overview

### Hero (Slide 1)
| Slide | Title | Content |
|-------|-------|---------|
| 1 | Galaxy is free, powerful, scales! | Key stats: 750K jobs/mo, 400K users, $2M compute |

### 1-2-3 (Slides 2-5)
| Slide | Title | Content |
|-------|-------|---------|
| 2 | Get your data! | Upload from computer, web, SRA, anywhere |
| 3 | Run a tool! | Select from 1,000s of tools |
| 4 | Run a workflow! | Select from 100s of community curated workflows |
| 5 | Interpret! | Use integrated Jupyter, RStudio, or AI tools |

### Global Use (Slides 6-8)
| Slide | Title | Content |
|-------|-------|---------|
| 6 | Highly Scalable | ACCESS-CI infrastructure map |
| 7 | Tool Ecosystem | BioConda, BioContainers, Galaxy wrappers |
| 8 | Training Hub | GTN stats, GTA 2025 world map |

### Capabilities (Slides 9-10)
| Slide | Title | Content |
|-------|-------|---------|
| 9 | Universe of Applications | Sparkly grid of GTN topics |
| 10 | Scalable Genome Assembly | VGP project, phylogenetic tree |

### Ecosystem (Slides 11-14)
| Slide | Title | Content |
|-------|-------|---------|
| 11 | Global Instances | usegalaxy.org, .eu, .org.au (galaxies.svg background) |
| 12 | Galaxy Ecosystem | 6-panel grid: IUC, IWC, BioContainers, Planemo, Pulsar, TPV |
| 13 | galaxyproject.org | Key links grid (US, EU, AU, VGP, Hub, Training, IWC, GitHub) |
| 14 | gxy.io/what-is-galaxy | QR code for sharing |

## File Structure

```
promo-site/
├── index.html          # Generated output (do not edit directly)
├── slides.md           # Slide content source (edit this!)
├── build.js            # Build script (markdown → HTML)
├── template.html       # HTML template with CSS/JS
├── package.json        # npm dependencies
├── favicon.svg         # Galaxy logo (browser favicon)
├── README.md           # This file
├── images/             # All slide images
│   ├── upload.png          # 1-2-3: Get your data
│   ├── run-tool.png        # 1-2-3: Run a tool
│   ├── run-wf.png          # 1-2-3: Run a workflow
│   ├── interpret.png       # 1-2-3: Interpret
│   ├── access-map.svg      # ACCESS-CI infrastructure map
│   ├── map_number.svg      # GTA 2025 world map
│   ├── galaxies.svg        # Global instances background
│   ├── tree.png            # VGP phylogenetic tree
│   ├── iuc-logo.png        # Ecosystem logos
│   ├── iwc-logo.png
│   ├── biocontainers-logo.png
│   ├── planemo-logo.png
│   ├── pulsar-logo.png
│   └── tpv-logo.png
└── docs/               # Reference materials
    ├── vgp.md              # VGP content source
    └── gxy_colors.pdf      # Galaxy color palette
```

## Configuration

### Global Settings

Edit `CONFIG` in `index.html` to customize defaults:

```javascript
const CONFIG = {
  interval: 3000,        // Default slide duration in ms (3 seconds)
  transitionDuration: 600, // Fade transition in ms
  loop: true             // Loop back to start after last slide
};
```

### Per-Slide Duration

Each slide can have its own display duration using the `data-duration` attribute (in milliseconds):

```html
<!-- This slide displays for 5 seconds -->
<section class="slide" data-section="global" data-duration="5000">

<!-- This slide uses the default (3 seconds) -->
<section class="slide" data-section="global">
```

## Color Palette

Uses official Galaxy colors from `gxy_colors.pdf`:

| Color | Hex | Usage |
|-------|-----|-------|
| Primary | `#2c3143` | Masthead, dark backgrounds |
| Accent | `#FFD700` | Progress bar, highlights |
| Orange | `#fe7f02` | Stat cards |
| Blue | `#2077b3` | Stat cards |
| Green | `#74c376` | Stat cards |
| Red | `#e31a1e` | Stat cards |
| Yellow | `#ffd602` | Stat cards |

## Data Sources

- **Statistics**: From RS.md (renewal grant document)
- **Images**: Extracted from RS.md base64 data
- **Word cloud topics**: Galaxy Training Network (training.galaxyproject.org)
- **GitHub stats**: Fetched from respective repositories

## Browser Support

Tested on modern browsers:
- Chrome/Edge (recommended)
- Firefox
- Safari

## Kiosk Mode

For conference booth display, use browser's kiosk/full-screen mode:
- **Chrome**: `--kiosk` flag or F11
- **Firefox**: F11 for fullscreen
- **Safari**: Cmd+Ctrl+F for fullscreen

## License

Content is for Galaxy Project use. Images and statistics from official Galaxy sources.
