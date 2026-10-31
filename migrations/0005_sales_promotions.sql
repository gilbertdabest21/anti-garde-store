ALTER TABLE products ADD COLUMN sale_price INTEGER;
CREATE INDEX IF NOT EXISTS idx_orders_status_payment ON orders(order_status,payment_status);
