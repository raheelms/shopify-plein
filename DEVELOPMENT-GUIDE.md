# Shopify Theme Development Guide

This guide contains everything you need to set up, manage, and develop this Shopify theme.

## 1. Prerequisites
Ensure the following are installed on your Windows system:
- **Node.js (v20.10+):** [Download](https://nodejs.org/)
- **Git:** [Download](https://git-scm.com/downloads)
- **Shopify CLI:** Install globally via PowerShell:
  ```powershell
  npm install -g @shopify/cli@latest
  ```

## 2. Connecting to Your Store
To start developing, navigate to this folder in your terminal and run:

```powershell
shopify theme dev --store "myfresh-clean.myshopify.com"
```

### Critical Tips for Login:
- **Use Double Quotes:** Always wrap the store URL in `" "` to avoid errors with special characters (like `&`).
- **Store Handle:** Use the "Handle" (small text below the name in the Partner Dashboard), not necessarily the store name.
- **Storefront Password:** When prompted for a password, it's your **Storefront Password** (found in *Admin > Online Store > Preferences > Password protection*), not your account password.

## 3. Local Development URLS
Once successul, you will see two URLs:
- **Local Preview:** `http://127.0.0.1:9292` (See your changes live as you save files).
- **Editor Preview:** A link to the Shopify Theme Editor for your specific development theme.

## 4. Common Commands
| Command | Usage |
| :--- | :--- |
| `shopify theme dev` | Starts the local server and auto-reloads. |
| `shopify theme check` | Checks your code for errors/performance issues. |
| `shopify theme pull` | Downloads the latest code from the store to your PC. |
| `shopify theme push` | Uploads your local code to a specific theme on Shopify. |

## 5. Folder Structure
- `/assets`: Images, CSS, and JS files.
- `/layout`: The main wrapper (`theme.liquid`).
- `/sections`: Modular building blocks (Header, Footer, Feature Product).
- `/templates`: JSON files determining page layouts.
- `/snippets`: Reusable small code bits.

## 6. Creating New Features
### Example: Custom Section
1. Create `sections/my-new-section.liquid`.
2. Add your HTML and a `{% schema %}` block to make it editable in the Shopify Theme Editor.
## 7. Data & The Database
### Where is the database?
Shopify is a **SaaS (Software as a Service)** platform. Unlike traditional apps where you might see a `mysql.db` or `sqlite` file, Shopify's database is **hosted and managed by Shopify**.

- **No Local Database:** You don't have a local database file. All product, customer, and order data lives on Shopify's servers.
- **Managing Data:** You manage your "database" through the **Shopify Admin** (for adding products, etc.) or via the **Shopify API**.
- **Liquid Access:** In your theme files, you access this data using the **Liquid** templating language (e.g., `{{ product.title }}`).

### Adding Bulk Data
If you need to add many products at once, you use a **CSV Import**:
1. Go to **Products** in Shopify Admin.
2. Click **Import**.
3. Upload a CSV file (like the [products_import.csv](file:///d:/My%20Files/Workspace/my_projects/shopify/products_import.csv) I created for you).
