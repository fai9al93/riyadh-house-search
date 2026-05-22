# Riyadh North · House Search

A static, single-page app for a curated North Riyadh house hunt — 24 listings across 12 neighborhoods, filtered for villa / townhouse / penthouse properties in the 1.5M–2.1M SAR range with REDF financing in mind.

**Live site:** *will be available at* `https://<your-github-username>.github.io/riyadh-house-search/` *once GitHub Pages is enabled*

## Features

- Bilingual EN / AR with full RTL support
- Filter by neighborhood, type, max price, maid's room status, sort
- Each card links to the source listing on Aqar.fm / Bayut / Wasalt / Rakez
- Dark, minimalist design inspired by [brilliant.xyz](https://brilliant.xyz)
- No build step, no dependencies, just a single `index.html`

## Deploy to GitHub Pages

### Step 1 — Create the repo

1. Go to https://github.com/new
2. Repository name: `riyadh-house-search`
3. Public visibility
4. Don't add README / .gitignore (we have the files locally)
5. Click "Create repository"

### Step 2 — Push the files

From the project folder (`riyadh-house-search/`), run:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/<your-username>/riyadh-house-search.git
git push -u origin main
```

### Step 3 — Enable GitHub Pages

1. Go to the repo on GitHub → **Settings** → **Pages** (left sidebar)
2. Under "Source", select **Deploy from a branch**
3. Branch: `main`, Folder: `/ (root)`
4. Click **Save**
5. Wait 1–2 minutes — your site will be live at `https://<your-username>.github.io/riyadh-house-search/`

## File structure

```
riyadh-house-search/
├── index.html       # Everything: HTML, CSS, JS, data
├── README.md        # This file
└── .nojekyll        # Tells GitHub Pages not to process via Jekyll
```

## Updating listings

Listings are embedded in `index.html` as a JavaScript array (`const LISTINGS = [...]` near the bottom). Edit that array to add, remove, or update properties — then push to GitHub. Site updates in ~1 minute.

## Built

May 2026 · A personal project.
