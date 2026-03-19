# Shopify Theme Development Instructions

This file contains common Shopify CLI commands for managing and developing themes.

## Authentication
Before running any commands, ensure you are logged into your Shopify store.
```bash
shopify login --store=your-store-handle.myshopify.com
```

## Local Development
Start a local development server for your theme. It will provide a link for previewing changes in real-time.
```bash
shopify theme dev
```

## Pulling and Pushing Changes

### Pull from Remote
Download the latest version of a theme from Shopify to your local machine.
```bash
# Pull from a specific theme
shopify theme pull --theme=123456789

# List themes to find yours
shopify theme list
```

### Push to Remote
Upload your local changes to a theme on Shopify.

**Unpublished Theme (Safe):**
```bash
# Push to a specific unpublished theme
shopify theme push --theme=123456789
```

**Live Theme (CAUTION):**
```bash
# Push directly to the live/production theme
shopify theme push --live --allow-live
```

## Theme Utilities

### List Themes
See all themes currently installed in your Shopify store.
```bash
shopify theme list
```

### Linting & Checking
Check your theme for best practices and syntax errors.
```bash
shopify theme check
```

## Shortcuts (package.json)
If `package.json` exists with scripts, you can run them using `npm run`:
- `npm run dev` (Mapped to `shopify theme dev`)
- `npm run push` (Mapped to `shopify theme push`)
