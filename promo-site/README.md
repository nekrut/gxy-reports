# Galaxy Promo Site

A promotional slideshow website for Galaxy Project conference booth displays. Features 15 auto-playing slides showcasing Galaxy's global impact, capabilities, and ecosystem.

## Quick Start

```bash
# Open in browser
open index.html

# Or serve locally (optional)
python -m http.server 8000
# Then visit http://localhost:8000/promo-site/
```

## Features

- **15 slides** across 3 sections: Global Use, Capabilities, Ecosystem
- **Auto-play** with 3-second intervals and progress bar
- **Keyboard controls**: Space (pause/play), Arrow keys (navigate), Escape (resume)
- **Click navigation**: Dots, masthead links
- **Animated word cloud** showing Galaxy's application domains
- **Apple-inspired design** with Galaxy color scheme
- **Offline-ready**: Works without internet (except Slide 9 logos)

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

### Global Use (Slides 1-6)
| Slide | Title | Content |
|-------|-------|---------|
| 1 | Galaxy in Numbers | Key stats: 750K jobs/mo, 400K users, $2M compute |
| 2 | Widely Used | User growth chart, 600K worldwide users |
| 3 | Widely Cited | 22K+ citations across 1,455 journals |
| 4 | Highly Scalable | ACCESS-CI infrastructure diagram |
| 5 | Tool Ecosystem | BioConda, BioContainers, Galaxy wrappers |
| 6 | Training Hub | GTN stats, GTA 2025 world map |

### Capabilities (Slides 7-8)
| Slide | Title | Content |
|-------|-------|---------|
| 7 | Universe of Applications | Animated word cloud of GTN topics |
| 8 | Scalable Genome Assembly | VGP project, phylogenetic tree |

### Ecosystem (Slides 9-15)
| Slide | Title | Content |
|-------|-------|---------|
| 9 | Global Instances | usegalaxy.org, .eu, .org.au |
| 10 | IUC | Intergalactic Utilities Commission |
| 11 | IWC | Intergalactic Workflow Commission |
| 12 | BioContainers | Container ecosystem |
| 13 | Planemo | Developer toolkit |
| 14 | Pulsar | Distributed job execution |
| 15 | TPV | Total Perspective Vortex routing |

## File Structure

```
promo-site/
├── index.html          # Main site (single-file, self-contained)
├── favicon.svg         # Galaxy logo (from usegalaxy.org)
├── tree.png            # VGP phylogenetic tree (2.5MB)
├── images/
│   ├── image2.png      # User growth chart
│   ├── image5.png      # Citations by journal
│   ├── image6.png      # ACCESS-CI infrastructure
│   └── image13.png     # GTA 2025 world map
├── gxy_colors.pdf      # Galaxy color palette reference
├── vgp.md              # VGP content source
├── GOAL-PLAN.md        # Original requirements
├── CLAUDE-PLAN.md      # Implementation plan
└── README.md           # This file
```

## Configuration

Edit `CONFIG` in `index.html` to customize:

```javascript
const CONFIG = {
  interval: 3000,        // Slide duration in ms (default: 3 seconds)
  transitionDuration: 600, // Fade transition in ms
  loop: true             // Loop back to start after last slide
};
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

## Offline Usage

The site works offline except for Slide 9 (Global Instances) which loads logos from galaxyproject.org. To make fully offline:

1. Download the logos:
```bash
curl -o images/usegalaxy-org.png "https://galaxyproject.org/images/usegalaxy-logos/usegalaxy.org.png"
curl -o images/usegalaxy-eu.png "https://galaxyproject.org/images/usegalaxy-logos/usegalaxy.eu.png"
curl -o images/usegalaxy-org-au.png "https://galaxyproject.org/images/usegalaxy-logos/usegalaxy.org.au.png"
```

2. Update the `<img src="...">` paths in Slide 9 to use local files.

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
