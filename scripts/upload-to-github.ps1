# =============================================================================
# Upload Shopify Plein project to GitHub
# Project: shopify plein (plein.nl design clone)
# =============================================================================

$ErrorActionPreference = "Stop"
$RepoName = "shopify-plein"
$CommitMessage = "Initial commit for shopify plein project - plein.nl design"

Write-Host "=== Shopify Plein - GitHub Upload ===" -ForegroundColor Cyan
Write-Host ""

# Check if git is initialized
if (-not (Test-Path ".git")) {
    Write-Host "Initializing git repository..." -ForegroundColor Yellow
    git init
}

# Check for uncommitted changes or if this is first commit
$status = git status --porcelain 2>$null
$hasCommits = git rev-parse --git-dir 2>$null | ForEach-Object { Test-Path "$_\refs\heads\*" }

if ($status -or -not $hasCommits) {
    Write-Host "Adding all files..." -ForegroundColor Yellow
    git add .
    
    Write-Host "Creating commit: $CommitMessage" -ForegroundColor Yellow
    git commit -m $CommitMessage
} else {
    Write-Host "No changes to commit. Repository is up to date." -ForegroundColor Green
}

# Ensure main branch
git branch -M main 2>$null

Write-Host ""
Write-Host "=== Next Steps ===" -ForegroundColor Cyan
Write-Host "1. Create a new repository on GitHub named: $RepoName"
Write-Host "   Go to: https://github.com/new"
Write-Host ""
Write-Host "2. Add the remote and push (replace YOUR_USERNAME with your GitHub username):"
Write-Host "   git remote add origin https://github.com/YOUR_USERNAME/$RepoName.git"
Write-Host "   git push -u origin main"
Write-Host ""
Write-Host "   Or if using SSH:"
Write-Host "   git remote add origin git@github.com:YOUR_USERNAME/$RepoName.git"
Write-Host "   git push -u origin main"
Write-Host ""
Write-Host "=== Push to GitHub ===" -ForegroundColor Cyan
$remote = git remote get-url origin 2>$null
if ($remote) {
    Write-Host "Remote origin: $remote"
    Write-Host "Pushing to main..."
    git push -u origin main
} else {
    Write-Host "Adding remote: https://github.com/raheelms/shopify-plein.git"
    git remote add origin https://github.com/raheelms/shopify-plein.git
    Write-Host "Pushing to main..."
    git push -u origin main
}
