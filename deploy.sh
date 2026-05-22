#!/usr/bin/env bash
# Deploy riyadh-house-search to GitHub Pages
# Usage: bash deploy.sh

set -e

cd "$(dirname "$0")"

echo ""
echo "================================================="
echo "  Riyadh North House Search · GitHub deploy"
echo "================================================="
echo ""

# Get GitHub username
read -rp "Your GitHub username: " GH_USER
if [ -z "$GH_USER" ]; then
  echo "Username required. Aborting."
  exit 1
fi

REPO="riyadh-house-search"

# Initialize git if not already
if [ ! -d .git ]; then
  git init -q
  echo "✓ Initialized git repo"
fi

# Stage and commit
git add .
if git diff --cached --quiet; then
  echo "✓ Nothing to commit (already up to date)"
else
  git commit -q -m "Initial commit: Riyadh North house search app"
  echo "✓ Committed files"
fi

git branch -M main 2>/dev/null || true

# Check for gh CLI
if command -v gh >/dev/null 2>&1; then
  echo ""
  echo "→ GitHub CLI detected. Creating repo..."
  gh auth status >/dev/null 2>&1 || { echo "Please run: gh auth login"; exit 1; }
  gh repo create "$GH_USER/$REPO" --public --source=. --remote=origin --push -d "Riyadh North · House Search" || {
    echo "Repo may already exist. Adding remote and pushing..."
    git remote add origin "https://github.com/$GH_USER/$REPO.git" 2>/dev/null || true
    git push -u origin main
  }
  echo ""
  echo "→ Enabling GitHub Pages..."
  gh api -X POST "repos/$GH_USER/$REPO/pages" \
    -f "source[branch]=main" \
    -f "source[path]=/" 2>/dev/null || \
  gh api -X PUT "repos/$GH_USER/$REPO/pages" \
    -f "source[branch]=main" \
    -f "source[path]=/" 2>/dev/null || \
    echo "  (Pages may already be enabled, or enable it manually at Settings → Pages)"
else
  echo ""
  echo "→ GitHub CLI (gh) not found. Using plain git."
  echo ""
  echo "  Step 1: Create the repo manually:"
  echo "    Open: https://github.com/new"
  echo "    Name: $REPO"
  echo "    Visibility: Public"
  echo "    DO NOT add README, .gitignore, or license"
  echo "    Click 'Create repository'"
  echo ""
  read -rp "Press Enter once the repo is created..." _

  git remote add origin "https://github.com/$GH_USER/$REPO.git" 2>/dev/null || \
    git remote set-url origin "https://github.com/$GH_USER/$REPO.git"

  echo ""
  echo "→ Pushing to GitHub (you may be prompted for credentials)..."
  git push -u origin main

  echo ""
  echo "→ Enable GitHub Pages manually:"
  echo "  Open: https://github.com/$GH_USER/$REPO/settings/pages"
  echo "  Source: Deploy from a branch"
  echo "  Branch: main / (root) → Save"
fi

echo ""
echo "================================================="
echo "  Done!"
echo "  Your site will be live in 1-2 min at:"
echo "  https://$GH_USER.github.io/$REPO/"
echo "================================================="
