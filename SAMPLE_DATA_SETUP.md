# Sample Data Setup Guide

This guide helps you populate your Shopify store with sample products and collections so you can see the collection grid, descriptions, sidebar categories, and Snel winkelen links (plein.nl style).

## 1. Import Products

1. In **Shopify Admin**, go to **Products** → **Import**
2. Click **Add file** and select `products.csv` (in the theme folder root)
3. Click **Upload and continue** → **Import products**

This creates **15 products** in a collection called **Gezondheid**.

## 2. Create Subcollections (Automated)

The theme expects a menu with **Gezondheid** as parent and subcollections as children. Create these automated collections:

| Collection | Condition |
|------------|-----------|
| **Voedingssupplementen** | Product type → is equal to → Voedingssupplementen |
| **Homeopathie** | Product type → is equal to → Homeopathie |
| **Natuurlijke Geneeskunde** | Product type → is equal to → Natuurlijke Geneeskunde |

**Steps:**
1. **Products** → **Collections** → **Create collection**
2. Name: `Voedingssupplementen`, handle: `voedingssupplementen`
3. **Conditions** → Automated → Add condition: **Product type** → **is equal to** → `Voedingssupplementen`
4. Save. Repeat for **Homeopathie** and **Natuurlijke Geneeskunde**.

## 3. Add Collection Descriptions (SEO)

Add descriptions for each collection so they appear on the collection page and in the grid:

1. **Products** → **Collections** → open each collection
2. In **Description**, add SEO-friendly text, e.g.:

**Gezondheid:**
```
Ontdek onze uitgebreide collectie natuurlijke gezondheidsproducten. Van vitamines en mineralen tot homeopathie en etherische oliën. Kies voor kwaliteit en ondersteuning van uw welzijn.
```

**Voedingssupplementen:**
```
Vitamines, mineralen en supplementen voor dagelijkse ondersteuning. Vitamine D, omega-3, multivitamines en meer. Alle producten van hoogwaardige kwaliteit.
```

**Homeopathie:**
```
Klassieke homeopathische middelen voor het hele gezin. Arnica, Echinacea, Valeriaan en meer. Zacht en effectief.
```

**Natuurlijke Geneeskunde:**
```
Etherische oliën en natuurlijke producten. Tea tree, lavendel, eucalyptus en colloidaal zilver. Puur en krachtig.
```

## 4. Set Up Main Menu (Navigation)

The theme uses `main-menu` for the header and collection sidebar. Set it up so **Gezondheid** has subcollections:

1. **Online Store** → **Navigation** → **main-menu** (or create it)
2. Add structure:
   - **Gezondheid** → Link: `/collections/gezondheid`
   - Under Gezondheid, add child links:
     - **Voedingssupplementen** → `/collections/voedingssupplementen`
     - **Homeopathie** → `/collections/homeopathie`
     - **Natuurlijke Geneeskunde** → `/collections/natuurlijke-geneeskunde`

3. Save menu.

## 5. Collection "All" Page

The `/collections/all` page shows all products in your store. To add a description:

1. **Products** → **Collections**
2. Find **All products** (or **Frontpage** / handle `all`)
3. Add a description for SEO, e.g.:
```
Welkom bij onze webshop. Ontdek ons volledige assortiment aan natuurlijke gezondheidsproducten, vitamines, homeopathie en meer. Vrij verzending vanaf €50.
```

## 6. Where to See Everything

| Page | What you'll see |
|------|-----------------|
| `/collections` | **Collections grid** – all collections with images and descriptions |
| `/collections/gezondheid` | Product grid, sidebar **Categorie** links, **Snel winkelen** text links, full description at bottom |
| `/collections/all` | All products, with description if you added one |

## 7. Optional: Add Collection Images

For a nicer collections grid, add a **Featured image** to each collection in Admin. Without images, the theme uses placeholder SVGs.

## Troubleshooting

- **No sidebar categories?** Ensure `main-menu` has Gezondheid with child links to the subcollections.
- **Snel winkelen empty?** Same as above – it uses the same menu structure.
- **Empty product grid?** Re-run the product import or check that products are published to Online Store.
