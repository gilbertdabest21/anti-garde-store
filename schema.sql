PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS products (
 id TEXT PRIMARY KEY, name TEXT NOT NULL, category TEXT NOT NULL DEFAULT 'Uncategorized', description TEXT DEFAULT '', price INTEGER NOT NULL DEFAULT 0,
 cost INTEGER NOT NULL DEFAULT 0, image_url TEXT DEFAULT '', active INTEGER NOT NULL DEFAULT 1,
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS variants (
 id TEXT PRIMARY KEY, product_id TEXT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
 sku TEXT NOT NULL UNIQUE, size TEXT NOT NULL, color TEXT DEFAULT '', stock INTEGER NOT NULL DEFAULT 0 CHECK(stock >= 0),
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS inventory_movements (
 id TEXT PRIMARY KEY, variant_id TEXT NOT NULL REFERENCES variants(id), change_qty INTEGER NOT NULL,
 reason TEXT NOT NULL, note TEXT DEFAULT '', created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS orders (
 id TEXT PRIMARY KEY, customer_name TEXT NOT NULL, phone TEXT NOT NULL, email TEXT DEFAULT '',
 payment_method TEXT NOT NULL, payment_status TEXT NOT NULL DEFAULT 'pending',
 shipping_method TEXT NOT NULL, shipping_fee INTEGER NOT NULL DEFAULT 0,
 subtotal INTEGER NOT NULL DEFAULT 0, discount INTEGER NOT NULL DEFAULT 0, total INTEGER NOT NULL DEFAULT 0,
 order_status TEXT NOT NULL DEFAULT 'pending', tracking_number TEXT DEFAULT '', notes TEXT DEFAULT '',
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS order_items (
 id TEXT PRIMARY KEY, order_id TEXT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
 variant_id TEXT REFERENCES variants(id), product_name TEXT NOT NULL, sku TEXT DEFAULT '',
 size TEXT DEFAULT '', quantity INTEGER NOT NULL, unit_price INTEGER NOT NULL, unit_cost INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS expenses (
 id TEXT PRIMARY KEY, category TEXT NOT NULL, description TEXT NOT NULL, amount INTEGER NOT NULL,
 expense_date TEXT NOT NULL, created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS settings (key TEXT PRIMARY KEY, value TEXT NOT NULL);
INSERT OR IGNORE INTO settings(key,value) VALUES
 ('free_shipping_threshold','500'),('shipping_711','60'),('shipping_familymart','60'),
 ('shipping_post','80'),('currency','TWD'),('payment_provider','ecpay');

CREATE TABLE IF NOT EXISTS categories (
 id TEXT PRIMARY KEY, name TEXT NOT NULL UNIQUE, sort_order INTEGER NOT NULL DEFAULT 0,
 active INTEGER NOT NULL DEFAULT 1, created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT OR IGNORE INTO categories(id,name,sort_order) VALUES
 ('cat-oversized','Oversized Clothing',1),('cat-tees','T-Shirts',2),('cat-hoodies','Hoodies',3),
 ('cat-pants','Pants',4),('cat-outerwear','Outerwear',5),('cat-accessories','Accessories',6),
 ('cat-limited','Limited Drops',7),('cat-uncategorized','Uncategorized',99);
CREATE TABLE IF NOT EXISTS content_pages (
 id TEXT PRIMARY KEY, slug TEXT NOT NULL UNIQUE, title TEXT NOT NULL, description TEXT DEFAULT '',
 body TEXT DEFAULT '', menu_label TEXT NOT NULL, active INTEGER NOT NULL DEFAULT 1,
 sort_order INTEGER NOT NULL DEFAULT 0, created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
