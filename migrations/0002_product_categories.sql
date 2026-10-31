ALTER TABLE products ADD COLUMN category TEXT NOT NULL DEFAULT 'Uncategorized';
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category);
