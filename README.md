# Galaxy Year in Review Newsletter

HTML email newsletter showcasing Galaxy Project annual statistics and achievements.

## Files

```
gxy-reports/
├── README.md                      # This file
├── fetch_stats.sh                 # Script to fetch GitHub stats
├── galaxy-newsletter-2025.html    # Newsletter HTML template
└── assets/                        # (optional) Local copies of images
```

## Quick Start

```bash
# 1. Fetch latest stats
./fetch_stats.sh 2025

# 2. Open newsletter in browser to preview
firefox galaxy-newsletter-2025.html
# or
open galaxy-newsletter-2025.html  # macOS
```

## Data Sources

### GitHub Stats (automated via `fetch_stats.sh`)

The script fetches from these repositories:

| Repository | Metrics |
|------------|---------|
| galaxyproject/galaxy | commits, PRs |
| galaxyproject/training-material | commits, PRs |
| galaxyproject/tools-iuc | commits, PRs |
| galaxyproject/iwc | commits, PRs, workflow count |
| galaxyproject/planemo | commits, PRs, releases |
| galaxyproject/pulsar | commits, PRs, releases |
| galaxyproject/total-perspective-vortex | commits, PRs, releases |
| galaxyproject/galaxy-charts | commits, PRs |

### Usage Stats (manual - Looker Studio)

Usage metrics must be obtained manually from the Key Usage Indicators dashboard:

**URL:** https://lookerstudio.google.com/u/0/reporting/8cfee054-2ddd-4711-af5a-a7a8d62076bb

Export as PDF and extract:
- Total registered users (aggregate)
- Total jobs executed (aggregate)
- Total datasets stored (aggregate)
- Total workflows created (aggregate)
- Per-server job counts (usegalaxy.eu, usegalaxy.org, usegalaxy.org.au, usegalaxy.fr)

## Updating the Newsletter

### 1. Fetch GitHub Stats

```bash
./fetch_stats.sh 2025
```

### 2. Get Looker Studio Data

1. Visit the [dashboard](https://lookerstudio.google.com/u/0/reporting/8cfee054-2ddd-4711-af5a-a7a8d62076bb)
2. Download PDF or screenshot key metrics
3. Note aggregate totals from the last page

### 3. Update HTML

Edit `galaxy-newsletter-2025.html` and update these sections:

#### Global Impact Stats (~line 137)
```html
<div style="...font-size: 32px;...">650K+</div>  <!-- registered users -->
<div style="...font-size: 32px;...">186M+</div>  <!-- jobs executed -->
<div style="...font-size: 32px;...">333M+</div>  <!-- datasets stored -->
<div style="...font-size: 32px;...">862K+</div>  <!-- workflows created -->
```

#### Server Job Breakdown (~line 196)
Update job counts for each server (EU, US, AU, FR) and adjust progress bar widths proportionally.

#### Core Repository Stats (~line 205)
```html
<td>galaxy</td><td>7,554</td>           <!-- galaxy commits -->
<td>training-material</td><td>4,974</td> <!-- GTN commits -->
<td>tools-iuc</td><td>2,365</td>         <!-- IUC commits -->
```

#### IWC Stats (~line 590)
```html
<div>25</div>     <!-- workflow categories -->
<div>270</div>    <!-- PRs merged -->
<div>1,251</div>  <!-- commits -->
```

#### Infrastructure Tools (~line 472)
Update TPV, Galaxy Charts, Planemo, Pulsar stats.

### 4. Update Hero Background Image

The hero uses an external image. To change:

```html
<!-- Line ~46 -->
background-image: url('http://www.bumblebeagle.org/symperc/eth_24.png');
```

Replace URL or use a local file in `assets/`.

## External Dependencies

### Fonts & Icons (loaded via CDN)
- Google Fonts: Roboto
- Font Awesome 6.5.1 (for social icons)

### Social Media Links

Current footer links:
| Platform | URL |
|----------|-----|
| Mastodon (Galaxy) | https://mstdn.science/@galaxyproject |
| Mastodon (EU Freiburg) | https://social.bund.de/@galaxyfreiburg |
| Matrix | https://matrix.to/#/#usegalaxy-eu-announce:matrix.org |
| Bluesky | https://bsky.app/profile/galaxyproject.bsky.social |
| LinkedIn | https://www.linkedin.com/groups/4907635/ |

## Email Client Compatibility

The HTML is designed for email clients with:
- Table-based layout (Outlook compatibility)
- Inline styles
- MSO conditional comments for Outlook
- Responsive design via media queries

Tested/designed for:
- Gmail (web & mobile)
- Outlook (desktop & web)
- Apple Mail
- Mobile email clients

## Creating Next Year's Report

```bash
# 1. Copy template
cp galaxy-newsletter-2025.html galaxy-newsletter-2026.html

# 2. Fetch new stats
./fetch_stats.sh 2026

# 3. Get Looker Studio data (manual)

# 4. Update all stats in HTML

# 5. Update year references:
#    - Title: "2026 Year in Review"
#    - Preheader text
#    - Section headers mentioning year
#    - Release highlights section
#    - Events section
```

## Troubleshooting

### GitHub API Rate Limiting
If `fetch_stats.sh` returns 0s, you may be rate-limited. Solutions:
- Wait an hour
- Use authenticated requests: `curl -H "Authorization: token YOUR_TOKEN" ...`

### Font Awesome Icons Not Showing
Some email clients block external CSS. Icons have fallback text in `title` attributes.

### Background Image Not Showing
Some email clients (Outlook) don't support CSS background images. The fallback background color (#2c3143) will be used.

## License

Content is for Galaxy Project internal use.
