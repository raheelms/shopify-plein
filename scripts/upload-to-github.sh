#!/bin/bash
# =============================================================================
# Upload Shopify Plein project to GitHub
# Project: shopify plein (plein.nl design clone)
# =============================================================================

set -e
REPO_NAME="shopify-plein"
COMMIT_MSG="Initial commit for shopify plein project - plein.nl design"

echo "=== Shopify Plein - GitHub Upload ==="
echo ""

# Initialize git if needed
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
fi

# Add and commit if there are changes
if [ -n "$(git status --porcelain)" ] || ! git rev-parse --verify HEAD &>/dev/null; then
    echo "Adding all files..."
    git add .
    echo "Creating commit: $COMMIT_MSG"
    git commit -m "$COMMIT_MSG"
else
    echo "No changes to commit. Repository is up to date."
fi

# Ensure main branch
git branch -M main 2>/dev/null || true

echo ""
echo "=== Next Steps ==="
echo "1. Create a new repository on GitHub named: $REPO_NAME"
echo "   Go to: https://github.com/new"
echo ""
echo "2. Add the remote and push (replace YOUR_USERNAME with your GitHub username):"
echo "   git remote add origin https://github.com/YOUR_USERNAME/$REPO_NAME.git"
echo "   git push -u origin main"
echo ""
echo "   Or if using SSH:"
echo "   git remote add origin git@github.com:YOUR_USERNAME/$REPO_NAME.git"
echo "   git push -u origin main"
echo ""
echo "=== Quick push (if remote already exists) ==="
if git remote get-url origin &>/dev/null; then
    echo "Remote origin: $(git remote get-url origin)"
    echo "Run: git push -u origin main"
else
    echo "No remote configured yet. Add origin first (see steps above)."
fi
