PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS categories (
 id TEXT PRIMARY KEY,
 name TEXT NOT NULL UNIQUE,
 sort_order INTEGER NOT NULL DEFAULT 0,
 active INTEGER NOT NULL DEFAULT 1,
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT OR IGNORE INTO categories(id,name,sort_order) VALUES
 ('cat-oversized','Oversized Clothing',1),
 ('cat-tees','T-Shirts',2),
 ('cat-hoodies','Hoodies',3),
 ('cat-pants','Pants',4),
 ('cat-outerwear','Outerwear',5),
 ('cat-accessories','Accessories',6),
 ('cat-limited','Limited Drops',7),
 ('cat-uncategorized','Uncategorized',99);
CREATE TABLE IF NOT EXISTS content_pages (
 id TEXT PRIMARY KEY,
 slug TEXT NOT NULL UNIQUE,
 title TEXT NOT NULL,
 description TEXT DEFAULT '',
 body TEXT DEFAULT '',
 menu_label TEXT NOT NULL,
 active INTEGER NOT NULL DEFAULT 1,
 sort_order INTEGER NOT NULL DEFAULT 0,
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
