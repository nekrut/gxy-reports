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

## Features

- **12 slides** across 4 sections: 1-2-3, Global Use, Capabilities, Ecosystem
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

### 1-2-3 (Slides 1-4)
| Slide | Title | Content |
|-------|-------|---------|
| 1 | Get your data! | Upload from computer, web, SRA, anywhere |
| 2 | Run a tool! | Select from 1,000s of tools |
| 3 | Run a workflow! | Select from 100s of community curated workflows |
| 4 | Interpret! | Use integrated Jupyter, RStudio, or AI tools |

### Global Use (Slides 5-8)
| Slide | Title | Content |
|-------|-------|---------|
| 5 | Galaxy in Numbers | Key stats: 750K jobs/mo, 400K users, $2M compute |
| 6 | Highly Scalable | ACCESS-CI infrastructure map |
| 7 | Tool Ecosystem | BioConda, BioContainers, Galaxy wrappers |
| 8 | Training Hub | GTN stats, GTA 2025 world map |

### Capabilities (Slides 9-10)
| Slide | Title | Content |
|-------|-------|---------|
| 9 | Universe of Applications | Sparkly grid of GTN topics |
| 10 | Scalable Genome Assembly | VGP project, phylogenetic tree |

### Ecosystem (Slides 11-12)
| Slide | Title | Content |
|-------|-------|---------|
| 11 | Global Instances | usegalaxy.org, .eu, .org.au (galaxies.svg background) |
| 12 | Galaxy Ecosystem | 6-panel grid: IUC, IWC, BioContainers, Planemo, Pulsar, TPV |

## File Structure

```
promo-site/
├── index.html          # Main site (single-file, self-contained)
├── favicon.svg         # Galaxy logo (from usegalaxy.org)
├── tree.png            # VGP phylogenetic tree
├── upload.png          # Get your data slide image
├── run-tool.png        # Run a tool slide image
├── run-wf.png          # Run a workflow slide image
├── interpret.png       # Interpret slide image
├── access-map.svg      # ACCESS-CI infrastructure map
├── map_number.svg      # GTA 2025 world map
├── galaxies.svg        # Global instances background
├── images/
│   ├── image5.png      # Citations by journal
│   ├── iuc-logo.png    # IUC logo
│   ├── iwc-logo.png    # IWC logo
│   ├── biocontainers-logo.png
│   ├── planemo-logo.png
│   ├── pulsar-logo.png
│   └── tpv-logo.png
├── gxy_colors.pdf      # Galaxy color palette reference
├── vgp.md              # VGP content source
├── GOAL-PLAN.md        # Original requirements
├── CLAUDE-PLAN.md      # Implementation plan
└── README.md           # This file
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
