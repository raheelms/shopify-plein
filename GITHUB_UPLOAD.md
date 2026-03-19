# Upload Shopify Plein to GitHub

This guide helps you upload the **shopify plein** project (plein.nl design clone) to GitHub as a new repository.

## Quick Start

### Windows (PowerShell)
```powershell
.\scripts\upload-to-github.ps1
```

### Mac/Linux
```bash
chmod +x scripts/upload-to-github.sh
./scripts/upload-to-github.sh
```

## Manual Steps

1. **Create a new repository on GitHub**
   - Go to [https://github.com/new](https://github.com/new)
   - Name it: `shopify-plein`
   - Do NOT initialize with README (project already has files)

2. **Add remote and push** (or run `.\scripts\upload-to-github.ps1`)
   ```bash
   git remote add origin https://github.com/raheelms/shopify-plein.git
   git branch -M main
   git push -u origin main
   ```

   Repo: https://github.com/raheelms/shopify-plein

## Project Info

- **Name:** shopify plein
- **Design:** Based on plein.nl (Dutch e-commerce)
- **Stack:** Shopify theme (Liquid, Tailwind CSS)
