import json
import csv
import os

eans = [
    "0000059082842",
    "0000059092582",
    "0000059095842",
    "0000059096733",
    "0000087222081",
    "0000090162916",
    "0011111614406",
    "0025675014930",
    "0665355571775",
    "0710663001732"
]

json_dir = r"d:\My Files\Workspace\my_projects\shopify\jsons"
csv_path = r"d:\My Files\Workspace\my_projects\shopify\products_import.csv"

# Basic Shopify CSV Headers
headers = [
    "Handle", "Title", "Body (HTML)", "Vendor", "Standard Product Type", 
    "Custom Product Type", "Tags", "Published", "Option1 Name", "Option1 Value", 
    "Variant SKU", "Variant Grams", "Variant Inventory Tracker", 
    "Variant Inventory Qty", "Variant Inventory Policy", 
    "Variant Fulfillment Service", "Variant Price", "Variant Compare At Price", 
    "Variant Requires Shipping", "Variant Taxable", "Variant Barcode", 
    "Image Src", "Status"
]

data = []

for ean in eans:
    file_path = os.path.join(json_dir, f"{ean}.json")
    if not os.path.exists(file_path):
        print(f"Skipping {ean}, file not found.")
        continue
        
    with open(file_path, 'r', encoding='utf-8') as f:
        content = json.load(f)
        
    attributes = content.get('catalog', {}).get('attributes', [])
    
    title = ""
    description = ""
    manufacturer = "My Store" # Default
    
    for attr in attributes:
        if attr['id'] == 'Title':
            title = attr['values'][0]['value']
        elif attr['id'] == 'Description':
            description = attr['values'][0]['value']
        elif attr['id'] == 'Manufacturer Name':
            manufacturer = attr['values'][0]['value']
            
    # Get Primary Image
    image_src = ""
    assets_list = content.get('assets', {}).get('assets', [])
    for asset in assets_list:
        if asset.get('usage') == 'PRIMARY':
            variants = asset.get('variants', [])
            if variants:
                # Find medium or largest
                variant = next((v for v in variants if v.get('size') == 'medium'), variants[0])
                image_src = variant.get('url', '')
                break
    
    if not image_src and assets_list:
         # Fallback to any image
         image_src = assets_list[0].get('variants', [{}])[0].get('url', '')

    handle = title.lower().replace(' ', '-').replace('/', '-').replace('--', '-') if title else ean
    # remove other special chars
    import re
    handle = re.sub(r'[^a-z0-9-]', '', handle)
    
    row = {
        "Handle": handle,
        "Title": title,
        "Body (HTML)": description,
        "Vendor": manufacturer,
        "Standard Product Type": "",
        "Custom Product Type": "Personal Care",
        "Tags": "import",
        "Published": "TRUE",
        "Option1 Name": "Title",
        "Option1 Value": "Default Title",
        "Variant SKU": ean,
        "Variant Grams": "0",
        "Variant Inventory Tracker": "shopify",
        "Variant Inventory Qty": "100",
        "Variant Inventory Policy": "deny",
        "Variant Fulfillment Service": "manual",
        "Variant Price": "19.99",
        "Variant Compare At Price": "",
        "Variant Requires Shipping": "TRUE",
        "Variant Taxable": "TRUE",
        "Variant Barcode": ean,
        "Image Src": image_src,
        "Status": "active"
    }
    data.append(row)

with open(csv_path, 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=headers)
    writer.writeheader()
    for row in data:
        writer.writerow(row)

print(f"Successfully generated {len(data)} products in {csv_path}")
