-- ============================================================
-- nestora Seed Data — Digital Goods (Gadgets, Phones, Accessories)
-- Run via: GET /api/db/seed?secret=seed-db-2024
-- ============================================================

-- ── Categories ───────────────────────────────────────────────

-- Parent categories
-- ── Create Parent Categories for Nestora ──

INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count) VALUES
  ('Smartphones & Tablets',   'smartphones-tablets',   'Latest smartphones and tablets from top brands',              NULL, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400', 0),
  ('Laptops & Computers',     'laptops-computers',     'Powerful laptops, desktops and computer accessories',         NULL, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400', 0),
  ('Audio & Headphones',      'audio-headphones',      'Premium earbuds, headphones and portable speakers',           NULL, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400', 0),
  ('Phone Accessories',       'phone-accessories',     'Cases, chargers, power banks and more',                       NULL, 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400', 0),
  ('Smartwatches & Wearables','smartwatches-wearables','Smart watches, fitness trackers and wearable tech',           NULL, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400', 0),
  ('Cameras & Photography',   'cameras-photography',   'Digital cameras, action cameras and photography gear',        NULL, 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400', 0),
  ('Gaming',                  'gaming',                'Consoles, games and gaming peripherals',                      NULL, 'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=400', 0),
  ('Computer Accessories',    'computer-accessories',  'Keyboards, mice, monitors and peripherals',                   NULL, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400', 0)
ON CONFLICT (slug) DO NOTHING;

-- Sub-categories (parent_id resolved by slug lookup)
-- ── Create Sub-Categories for Nestora ──

-- Android Phones under Smartphones & Tablets
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Android Phones', 'android-phones', 'Samsung, Tecno, Infinix and more', id, 'https://images.unsplash.com/photo-1570101945621-945409a6370f?w=400', 0
FROM nestora_categories WHERE slug = 'smartphones-tablets'
ON CONFLICT (slug) DO NOTHING;

-- iPhones & iPads under Smartphones & Tablets
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'iPhones & iPads', 'iphones-ipads', 'Apple iPhone and iPad lineup', id, 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=400', 0
FROM nestora_categories WHERE slug = 'smartphones-tablets'
ON CONFLICT (slug) DO NOTHING;

-- Laptops under Laptops & Computers
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Laptops', 'laptops', 'MacBook, Dell, HP, Lenovo and more', id, 'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400', 0
FROM nestora_categories WHERE slug = 'laptops-computers'
ON CONFLICT (slug) DO NOTHING;

-- Earbuds under Audio & Headphones
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Earbuds & Earphones', 'earbuds', 'True wireless and wired earbuds', id, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=400', 0
FROM nestora_categories WHERE slug = 'audio-headphones'
ON CONFLICT (slug) DO NOTHING;

-- Headphones under Audio & Headphones
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Over-Ear Headphones', 'headphones', 'Premium over-ear and on-ear headphones', id, 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=400', 0
FROM nestora_categories WHERE slug = 'audio-headphones'
ON CONFLICT (slug) DO NOTHING;

-- Portable Speakers under Audio & Headphones
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Portable Speakers', 'portable-speakers', 'Bluetooth and wireless portable speakers', id, 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400', 0
FROM nestora_categories WHERE slug = 'audio-headphones'
ON CONFLICT (slug) DO NOTHING;

-- Cases under Phone Accessories
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Cases & Covers', 'cases-covers', 'Protective cases for phones and tablets', id, 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=400', 0
FROM nestora_categories WHERE slug = 'phone-accessories'
ON CONFLICT (slug) DO NOTHING;

-- Chargers under Phone Accessories
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Chargers & Cables', 'chargers-cables', 'Fast chargers, USB cables and adapters', id, 'https://images.unsplash.com/photo-1623126908029-58cb08a2b272?w=400', 0
FROM nestora_categories WHERE slug = 'phone-accessories'
ON CONFLICT (slug) DO NOTHING;

-- Power Banks under Phone Accessories
INSERT INTO nestora_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Power Banks', 'power-banks', 'Portable power banks and charging stations', id, 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c5?w=400', 0
FROM nestora_categories WHERE slug = 'phone-accessories'
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- Nestora Seed Data — Part 1 (Products 1 - 15)
-- ============================================================

INSERT INTO nestora_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status) VALUES
-- 1. Samsung Galaxy S24 Ultra
('Samsung Galaxy S24 Ultra', 'samsung-galaxy-s24-ultra', 'SAM-S24U-256', 'Featuring a 6.8" Dynamic AMOLED 2X display with 120Hz refresh rate, Snapdragon 8 Gen 3, a 200MP quad-camera system, and the built-in S Pen.', 'Flagship Android phone with 200MP camera and built-in S Pen', 1250000, 1350000, 1250000, 'instock', 15, 28, 4.80, 'publish'),

-- 2. iPhone 15 Pro Max
('Apple iPhone 15 Pro Max', 'apple-iphone-15-pro-max', 'APL-IP15PM-256', 'Most advanced A17 Pro chip, a 48MP main camera with 5x telephoto zoom, titanium design, and the new Action Button.', 'Apple powerful iPhone with titanium build and 5x zoom', 1550000, 1650000, 1550000, 'instock', 10, 35, 4.90, 'publish'),

-- 3. Samsung Galaxy A55 5G
('Samsung Galaxy A55 5G', 'samsung-galaxy-a55-5g', 'SAM-A55-128', 'Mid-range performance. Featuring a 6.6" Super AMOLED display, 50MP OIS camera, and IP67 water resistance.', 'Premium mid-range 5G phone with 50MP OIS camera', 380000, 420000, 380000, 'instock', 30, 18, 4.50, 'publish'),

-- 4. Google Pixel 8 Pro
('Google Pixel 8 Pro', 'google-pixel-8-pro', 'GOG-P8P-128', 'The all-pro phone engineered by Google. Features a 6.7-inch Super Actua display and the custom Google Tensor G3 chip.', 'Google flagship with superior AI camera features', 950000, 1050000, 950000, 'instock', 12, 42, 4.85, 'publish'),

-- 5. Apple iPad Pro 12.9" M2
('Apple iPad Pro 12.9" M2', 'apple-ipad-pro-12-m2', 'APL-IPP12-256', 'Ultimate iPad experience. Featuring a 12.9" Liquid Retina XDR display with ProMotion and the M2 chip.', 'Ultimate iPad with M2 chip and Liquid Retina XDR display', 920000, 980000, 920000, 'instock', 8, 22, 4.85, 'publish'),

-- 6. MacBook Pro 14" M3 Pro
('Apple MacBook Pro 14" M3 Pro', 'apple-macbook-pro-14-m3-pro', 'APL-MBP14-M3', 'extraordinary performance for pro workflows. Features a stunning Liquid Retina XDR display and 18 hours battery life.', 'Professional laptop with M3 Pro chip and up to 18hr battery', 1850000, 1950000, 1850000, 'instock', 6, 19, 4.90, 'publish'),

-- 7. Dell XPS 15 (2024)
('Dell XPS 15 (2024)', 'dell-xps-15-2024', 'DEL-XPS15-i7', 'OLED 3.5K display, 32GB DDR5 RAM, and 1TB NVMe SSD. Perfect for creators and professionals.', 'Premium thin-and-light laptop with RTX 4060 and OLED display', 1280000, 1380000, 1280000, 'instock', 10, 14, 4.60, 'publish'),

-- 8. ASUS ROG Zephyrus G14
('ASUS ROG Zephyrus G14 Gaming', 'asus-rog-zephyrus-g14', 'ASU-ROG-G14', 'Powerful 14-inch gaming laptop with Ryzen 9 processor and RTX 4070 Graphics. Compact yet extremely fast.', 'The ultimate compact gaming laptop', 1450000, 1550000, 1450000, 'instock', 5, 21, 4.70, 'publish'),

-- 9. Sony WH-1000XM5
('Sony WH-1000XM5 Headphones', 'sony-wh-1000xm5', 'SNY-WH1000XM5-BLK', 'Industry-leading noise cancellation with 8 microphones and two processors. 30-hour battery life.', 'Industry-leading ANC headphones with 30hr battery', 285000, 310000, 285000, 'instock', 22, 38, 4.75, 'publish'),

-- 10. Bose QuietComfort Ultra
('Bose QuietComfort Ultra', 'bose-quietcomfort-ultra', 'BSE-QCU-BLK', 'World-class noise cancellation, spatial audio, and premium Bose comfort for long listening sessions.', 'World-class noise cancellation with spatial audio', 315000, 350000, 315000, 'instock', 15, 29, 4.80, 'publish'),

-- 11. JBL Charge 5
('JBL Charge 5 Portable Speaker', 'jbl-charge-5', 'JBL-CHG5-BLK', 'Powerful JBL Pro Sound from a rugged, IP67 waterproof and dustproof design. 20 hours of playtime.', 'IP67 waterproof speaker with 20hr playtime', 88000, 98000, 88000, 'instock', 28, 30, 4.65, 'publish'),

-- 12. Apple Watch Ultra 2
('Apple Watch Ultra 2', 'apple-watch-ultra-2', 'APL-AWU2-ORG', 'The most rugged and capable Apple Watch. 49mm titanium case, dual-frequency GPS, and up to 36-hour battery.', 'Ultimate rugged smartwatch for athletes and adventurers', 850000, 920000, 850000, 'instock', 10, 44, 4.95, 'publish'),

-- 13. Samsung Galaxy Watch 6 Classic
('Samsung Galaxy Watch 6 Classic', 'samsung-galaxy-watch-6-classic-47mm', 'SAM-GW6C-47-BLK', 'Brings back the iconic rotating bezel. Features advanced health tracking and sapphire crystal glass.', 'Premium smartwatch with rotating bezel and health tracking', 255000, 285000, 255000, 'instock', 15, 17, 4.55, 'publish'),

-- 14. PlayStation 5 Slim
('Sony PlayStation 5 Slim (Disc)', 'sony-playstation-5-slim', 'SNY-PS5-SLM-WHT', 'The new Slim design with 1TB SSD. Experience lightning-fast loading and breathtaking 4K gaming.', 'Next-gen gaming console in a new slim profile', 680000, 750000, 680000, 'instock', 20, 110, 4.90, 'publish'),

-- 15. Nintendo Switch OLED
('Nintendo Switch OLED Model', 'nintendo-switch-oled', 'NIN-SW-OLED-WHT', 'Features a vibrant 7-inch OLED screen, a wide adjustable stand, and wired LAN port.', 'The best handheld gaming experience with OLED', 385000, 420000, 385000, 'instock', 25, 62, 4.70, 'publish')
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- Nestora Seed Data — Part 2 (Products 16 - 30 + Meta)
-- ============================================================

INSERT INTO nestora_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status) VALUES
-- 16. Anker 67W GaN Charger
('Anker 67W GaN Wall Charger', 'anker-67w-gan-usb-c-charger', 'ANK-67W-GAN-BLK', 'Three ports (2x USB-C, 1x USB-A) with intelligent power distribution. Charges MacBook Pro at 67W.', 'Fast GaN charger with 3 ports for all devices', 28000, 32000, 28000, 'instock', 60, 42, 4.70, 'publish'),

-- 17. Baseus 20000mAh Power Bank
('Baseus 20000mAh 65W Power Bank', 'baseus-20000mah-65w-power-bank', 'BAS-20K-65W-WHT', '20000mAh capacity with 65W output. Powerful enough to charge a laptop via USB-C.', 'High-capacity laptop-grade power bank', 48000, 55000, 48000, 'instock', 45, 33, 4.60, 'publish'),

-- 18. Sony ZV-E10 Camera
('Sony ZV-E10 Mirrorless Camera', 'sony-zv-e10-mirrorless-body', 'SNY-ZVE10-BLK', 'Interchangeable lens system designed specifically for vloggers and content creators. 4K Video.', 'Vlogger-focused mirrorless camera with 4K video', 395000, 430000, 395000, 'instock', 12, 22, 4.55, 'publish'),

-- 19. GoPro Hero 12 Black
('GoPro HERO12 Black Action Cam', 'gopro-hero12-black', 'GPR-H12B-BLK', '5.3K60 video and 27MP photos. Features HyperSmooth 6.0 stabilization and 10-bit color.', 'Best action camera with HyperSmooth 6.0', 325000, 360000, 325000, 'instock', 14, 26, 4.65, 'publish'),

-- 20. Logitech MX Master 3S
('Logitech MX Master 3S Mouse', 'logitech-mx-master-3s', 'LOG-MXM3S-GRY', '8000 DPI MagSpeed wheel and whisper-quiet clicks. Ergonomic shape for all-day comfort.', 'Industry-standard ergonomic productivity mouse', 98000, 110000, 98000, 'instock', 20, 28, 4.70, 'publish'),

-- 21. Meta Quest 3 VR
('Meta Quest 3 (128GB)', 'meta-quest-3-128', 'MET-Q3-128', 'Mixed reality is here. Breakout performance with high-resolution Infinite Display and 3D Audio.', 'The best standalone Mixed Reality VR headset', 650000, 720000, 650000, 'instock', 8, 31, 4.80, 'publish'),

-- 22. Razer BlackWidow V4
('Razer BlackWidow V4 Mechanical', 'razer-blackwidow-v4', 'RZR-BWV4-GRN', 'High-performance mechanical gaming keyboard with Razer Green Switches and Chroma RGB lighting.', 'Mechanical gaming keyboard with clicky switches', 165000, 185000, 165000, 'instock', 15, 24, 4.60, 'publish'),

-- 23. Tecno Phantom X2 Pro
('Tecno Phantom X2 Pro', 'tecno-phantom-x2-pro', 'TEC-PX2P-256', 'Retractable portrait lens flagship. 6.8" curved AMOLED and Dimensity 9000 processor.', 'World retractable lens flagship from Tecno', 285000, 320000, 285000, 'instock', 20, 12, 4.40, 'publish'),

-- 24. Infinix Hot 40 Pro
('Infinix Hot 40 Pro', 'infinix-hot-40-pro', 'INF-H40P-256', '108MP AI triple camera, Helio G99 processor, and 5000mAh battery with 45W charging.', 'Budget flagship with 108MP camera', 148000, 168000, 148000, 'instock', 50, 14, 4.30, 'publish'),

-- 25. Keychron K2 Keyboard
('Keychron K2 Wireless Keyboard', 'keychron-k2-wireless', 'KCH-K2-BRN', 'Compact mechanical keyboard with Bluetooth connectivity. Perfect for Mac and Windows users.', 'Versatile compact mechanical keyboard', 78000, 85000, 78000, 'instock', 18, 37, 4.75, 'publish'),

-- 26. Starlink Standard Kit
('Starlink Standard Kit (Gen 3)', 'starlink-gen3-kit', 'SLK-G3-STD', 'High-speed, low-latency internet service for even the most remote locations. DIY Easy Setup.', 'Satellite internet for high-speed connectivity', 440000, 480000, 440000, 'instock', 30, 88, 4.90, 'publish'),

-- 27. DJI Mini 4 Pro
('DJI Mini 4 Pro (RC 2)', 'dji-mini-4-pro-rc2', 'DJI-M4P-RC2', 'Under 249g. 4K/60fps HDR true vertical shooting. Omnidirectional obstacle sensing.', 'Professional drone performance in a mini body', 980000, 1050000, 980000, 'instock', 5, 12, 4.95, 'publish'),

-- 28. Kindle Paperwhite (2024)
('Kindle Paperwhite 16GB (12th Gen)', 'kindle-paperwhite-12gen', 'KND-PW12-16', '6.8" display with adjustable warm light. Waterproof and up to 10 weeks battery life.', 'The ultimate e-reader for book lovers', 185000, 210000, 185000, 'instock', 22, 56, 4.80, 'publish'),

-- 29. Dyson Airwrap Multi-Styler
('Dyson Airwrap Multi-Styler Complete', 'dyson-airwrap-complete', 'DYS-AW-LONG', 'Dry. Curl. Shape. Smooth and hide flyaways with no extreme heat. Re-engineered attachments.', 'Premium hair styling technology', 485000, 520000, 485000, 'instock', 4, 21, 4.70, 'publish'),

-- 30. Sony PlayStation VR2
('Sony PlayStation VR2 Headset', 'sony-ps-vr2', 'SNY-PSVR2', 'Next-gen VR gaming. Breathtaking 4K HDR visuals and groundbreaking new controllers.', 'Immersive VR experience for PS5', 550000, 620000, 550000, 'instock', 6, 18, 4.45, 'publish')
ON CONFLICT (slug) DO NOTHING;

-- ── Product Images (Real Hardware) ───────────────────────────

INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT id, 'https://images.unsplash.com/photo-1695048133142-1a20484429be?w=800', 'iPhone 15 Pro', 'Apple iPhone 15 Pro Titanium', 0 FROM nestora_products WHERE slug = 'apple-iphone-15-pro-max' UNION ALL
SELECT id, 'https://images.unsplash.com/photo-1707149221191-447547926955?w=800', 'Galaxy S24 Ultra', 'Samsung S24 Ultra Front', 0 FROM nestora_products WHERE slug = 'samsung-galaxy-s24-ultra' UNION ALL
SELECT id, 'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=800', 'MacBook Pro', 'MacBook Pro 14 M3', 0 FROM nestora_products WHERE slug = 'apple-macbook-pro-14-m3-pro' UNION ALL
SELECT id, 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=800', 'Sony XM5', 'Sony Noise Cancelling Headphones', 0 FROM nestora_products WHERE slug = 'sony-wh-1000xm5' UNION ALL
SELECT id, 'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=800', 'PS5 Slim', 'Sony PS5 Gaming Console', 0 FROM nestora_products WHERE slug = 'sony-playstation-5-slim' UNION ALL
SELECT id, 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=800', 'Google Pixel 8', 'Google Actua Display Pixel', 0 FROM nestora_products WHERE slug = 'google-pixel-8-pro'
ON CONFLICT DO NOTHING;

-- ── Sync Counts ──────────────────────────────────────────────

UPDATE nestora_categories c SET count = (SELECT COUNT(*) FROM nestora_product_categories pc WHERE pc.category_id = c.id);

-- ── Nestora Product Images (High-Quality Hardware References) ──

-- 1. Samsung Galaxy S24 Ultra
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1707149221191-447547926955?w=1000', 'Galaxy S24 Ultra Titanium', 'Samsung Galaxy S24 Ultra Front View', 0
FROM nestora_products p WHERE p.slug = 'samsung-galaxy-s24-ultra' ON CONFLICT DO NOTHING;

-- 2. iPhone 15 Pro Max
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1696446701796-da61225697cc?w=1000', 'iPhone 15 Pro Max Natural', 'Apple iPhone 15 Pro Max Titanium', 0
FROM nestora_products p WHERE p.slug = 'apple-iphone-15-pro-max' ON CONFLICT DO NOTHING;

-- 3. Samsung Galaxy A55 5G
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1610945264803-c22b62831e5c?w=1000', 'Galaxy A55 Phantom', 'Samsung Galaxy A55 5G Smartphone', 0
FROM nestora_products p WHERE p.slug = 'samsung-galaxy-a55-5g' ON CONFLICT DO NOTHING;

-- 4. Tecno Phantom X2 Pro
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=1000', 'Tecno Phantom X2 Pro', 'Tecno Phantom X2 Pro Flagship', 0
FROM nestora_products p WHERE p.slug = 'tecno-phantom-x2-pro' ON CONFLICT DO NOTHING;

-- 5. Apple iPad Pro 12.9
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=1000', 'iPad Pro 12.9 M2', 'Apple iPad Pro with Liquid Retina Display', 0
FROM nestora_products p WHERE p.slug = 'apple-ipad-pro-12-m2' ON CONFLICT DO NOTHING;

-- 6. MacBook Pro 14 M3 Pro
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=1000', 'MacBook Pro 14 M3', 'Apple MacBook Pro Space Gray', 0
FROM nestora_products p WHERE p.slug = 'apple-macbook-pro-14-m3-pro' ON CONFLICT DO NOTHING;

-- 7. Dell XPS 15
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=1000', 'Dell XPS 15 Platinum', 'Dell XPS 15 Premium Laptop', 0
FROM nestora_products p WHERE p.slug = 'dell-xps-15-2024' ON CONFLICT DO NOTHING;

-- 8. HP Pavilion 15
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=1000', 'HP Pavilion 15 Silver', 'HP Pavilion 15 Laptop', 0
FROM nestora_products p WHERE p.slug = 'hp-pavilion-15-ryzen5' ON CONFLICT DO NOTHING;

-- 9. Apple AirPods Pro 2
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=1000', 'AirPods Pro 2 Case', 'Apple AirPods Pro 2nd Gen Earbuds', 0
FROM nestora_products p WHERE p.slug = 'apple-airpods-pro-2nd-gen' ON CONFLICT DO NOTHING;

-- 10. Samsung Galaxy Buds2 Pro
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=1000', 'Galaxy Buds2 Pro Black', 'Samsung Galaxy Buds2 Pro Wireless Earbuds', 0
FROM nestora_products p WHERE p.slug = 'samsung-galaxy-buds2-pro' ON CONFLICT DO NOTHING;

-- 11. Sony WH-1000XM5
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=1000', 'Sony WH-1000XM5 Black', 'Sony Noise Cancelling Over-Ear Headphones', 0
FROM nestora_products p WHERE p.slug = 'sony-wh-1000xm5' ON CONFLICT DO NOTHING;

-- 12. JBL Charge 5
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=1000', 'JBL Charge 5 Blue', 'JBL Charge 5 Portable Bluetooth Speaker', 0
FROM nestora_products p WHERE p.slug = 'jbl-charge-5' ON CONFLICT DO NOTHING;

-- 13. Apple Watch Series 9
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1551816230-ef5deaed4a26?w=1000', 'Apple Watch Series 9', 'Apple Watch Series 9 Smartwatch', 0
FROM nestora_products p WHERE p.slug = 'apple-watch-series-9-gps-45mm' ON CONFLICT DO NOTHING;

-- 14. Samsung Galaxy Watch 6 Classic
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=1000', 'Galaxy Watch 6 Silver', 'Samsung Galaxy Watch 6 Classic Smartwatch', 0
FROM nestora_products p WHERE p.slug = 'samsung-galaxy-watch-6-classic-47mm' ON CONFLICT DO NOTHING;

-- 15. Anker 67W GaN Charger
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1626143508000-4b5a33b4f95d?w=1000', 'Anker GaN 67W', 'Anker 67W Fast Wall Charger', 0
FROM nestora_products p WHERE p.slug = 'anker-67w-gan-usb-c-charger' ON CONFLICT DO NOTHING;

-- 16. Baseus 20000mAh Power Bank
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c5?w=1000', 'Baseus Power Bank 65W', 'Baseus 20000mAh Portable Power Bank', 0
FROM nestora_products p WHERE p.slug = 'baseus-20000mah-65w-power-bank' ON CONFLICT DO NOTHING;

-- 17. Spigen Tough Armor
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=1000', 'Spigen Tough Armor Case', 'Spigen Protective Case for iPhone', 0
FROM nestora_products p WHERE p.slug = 'spigen-tough-armor-iphone-15-pro' ON CONFLICT DO NOTHING;

-- 18. Logitech MX Master 3S
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=1000', 'Logitech MX Master 3S', 'Logitech MX Master 3S Wireless Mouse', 0
FROM nestora_products p WHERE p.slug = 'logitech-mx-master-3s' ON CONFLICT DO NOTHING;

-- 19. Sony ZV-E10
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=1000', 'Sony ZV-E10 Body', 'Sony ZV-E10 Mirrorless Camera for Vloggers', 0
FROM nestora_products p WHERE p.slug = 'sony-zv-e10-mirrorless-body' ON CONFLICT DO NOTHING;

-- 20. GoPro Hero 12
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=1000', 'GoPro Hero 12 Action', 'GoPro HERO12 Black Action Camera', 0
FROM nestora_products p WHERE p.slug = 'gopro-hero12-black' ON CONFLICT DO NOTHING;

-- 21. PlayStation 5 Console
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=1000', 'Sony PS5 Console', 'Sony PlayStation 5 Gaming Console', 0
FROM nestora_products p WHERE p.slug = 'sony-playstation-5-disc' ON CONFLICT DO NOTHING;

-- 22. Infinix Hot 40 Pro
INSERT INTO nestora_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1610945264803-c22b62831e5c?w=1000', 'Infinix Hot 40 Pro', 'Infinix Hot 40 Pro Android Smartphone', 0
FROM nestora_products p WHERE p.slug = 'infinix-hot-40-pro' ON CONFLICT DO NOTHING;
-- ── Nestora Product ↔ Category Linking ──

-- Samsung Galaxy S24 Ultra → smartphones-tablets, android-phones
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'samsung-galaxy-s24-ultra' AND c.slug IN ('smartphones-tablets','android-phones')
ON CONFLICT DO NOTHING;

-- iPhone 15 Pro Max → smartphones-tablets, iphones-ipads
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'apple-iphone-15-pro-max' AND c.slug IN ('smartphones-tablets','iphones-ipads')
ON CONFLICT DO NOTHING;

-- Galaxy A55 → smartphones-tablets, android-phones
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'samsung-galaxy-a55-5g' AND c.slug IN ('smartphones-tablets','android-phones')
ON CONFLICT DO NOTHING;

-- Tecno Phantom X2 Pro → smartphones-tablets, android-phones
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'tecno-phantom-x2-pro' AND c.slug IN ('smartphones-tablets','android-phones')
ON CONFLICT DO NOTHING;

-- iPad Pro → smartphones-tablets, iphones-ipads
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'apple-ipad-pro-12-m2' AND c.slug IN ('smartphones-tablets','iphones-ipads')
ON CONFLICT DO NOTHING;

-- MacBook Pro → laptops-computers, laptops
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'apple-macbook-pro-14-m3-pro' AND c.slug IN ('laptops-computers','laptops')
ON CONFLICT DO NOTHING;

-- Dell XPS 15 → laptops-computers, laptops
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'dell-xps-15-2024' AND c.slug IN ('laptops-computers','laptops')
ON CONFLICT DO NOTHING;

-- HP Pavilion → laptops-computers, laptops
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'hp-pavilion-15-ryzen5' AND c.slug IN ('laptops-computers','laptops')
ON CONFLICT DO NOTHING;

-- AirPods Pro → audio-headphones, earbuds
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'apple-airpods-pro-2nd-gen' AND c.slug IN ('audio-headphones','earbuds')
ON CONFLICT DO NOTHING;

-- Galaxy Buds2 Pro → audio-headphones, earbuds
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'samsung-galaxy-buds2-pro' AND c.slug IN ('audio-headphones','earbuds')
ON CONFLICT DO NOTHING;

-- Sony WH-1000XM5 → audio-headphones, headphones
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'sony-wh-1000xm5' AND c.slug IN ('audio-headphones','headphones')
ON CONFLICT DO NOTHING;

-- JBL Charge 5 → audio-headphones, portable-speakers
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'jbl-charge-5' AND c.slug IN ('audio-headphones','portable-speakers')
ON CONFLICT DO NOTHING;

-- Apple Watch → smartwatches-wearables
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'apple-watch-series-9-gps-45mm' AND c.slug = 'smartwatches-wearables'
ON CONFLICT DO NOTHING;

-- Galaxy Watch 6 → smartwatches-wearables
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'samsung-galaxy-watch-6-classic-47mm' AND c.slug = 'smartwatches-wearables'
ON CONFLICT DO NOTHING;

-- Anker Charger → phone-accessories, chargers-cables
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'anker-67w-gan-usb-c-charger' AND c.slug IN ('phone-accessories','chargers-cables')
ON CONFLICT DO NOTHING;

-- Baseus Power Bank → phone-accessories, power-banks
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'baseus-20000mah-65w-power-bank' AND c.slug IN ('phone-accessories','power-banks')
ON CONFLICT DO NOTHING;

-- Spigen Case → phone-accessories, cases-covers
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'spigen-tough-armor-iphone-15-pro' AND c.slug IN ('phone-accessories','cases-covers')
ON CONFLICT DO NOTHING;

-- Logitech Mouse → computer-accessories
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'logitech-mx-master-3s' AND c.slug = 'computer-accessories'
ON CONFLICT DO NOTHING;

-- Sony ZV-E10 → cameras-photography
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'sony-zv-e10-mirrorless-body' AND c.slug = 'cameras-photography'
ON CONFLICT DO NOTHING;

-- GoPro Hero 12 → cameras-photography
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'gopro-hero12-black' AND c.slug = 'cameras-photography'
ON CONFLICT DO NOTHING;

-- PS5 → gaming
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'sony-playstation-5-disc' AND c.slug = 'gaming'
ON CONFLICT DO NOTHING;

-- Infinix Hot 40 Pro → smartphones-tablets, android-phones
INSERT INTO nestora_product_categories (product_id, category_id)
SELECT p.id, c.id FROM nestora_products p, nestora_categories c
WHERE p.slug = 'infinix-hot-40-pro' AND c.slug IN ('smartphones-tablets','android-phones')
ON CONFLICT DO NOTHING;

-- ============================================================
-- Nestora Seed Data — Part 3 (Product Attributes & Count Sync)
-- ============================================================

-- ── 1. Product Attributes (Variants) ─────────────────────────

-- Samsung Galaxy S24 Ultra
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['256GB', '512GB', '1TB'], 0 FROM nestora_products WHERE slug = 'samsung-galaxy-s24-ultra' ON CONFLICT DO NOTHING;
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Titanium Black', 'Titanium Gray', 'Titanium Violet', 'Titanium Yellow'], 1 FROM nestora_products WHERE slug = 'samsung-galaxy-s24-ultra' ON CONFLICT DO NOTHING;

-- iPhone 15 Pro Max
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['256GB', '512GB', '1TB'], 0 FROM nestora_products WHERE slug = 'apple-iphone-15-pro-max' ON CONFLICT DO NOTHING;
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Natural Titanium', 'Blue Titanium', 'White Titanium', 'Black Titanium'], 1 FROM nestora_products WHERE slug = 'apple-iphone-15-pro-max' ON CONFLICT DO NOTHING;

-- Samsung Galaxy A55 5G
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['128GB', '256GB'], 0 FROM nestora_products WHERE slug = 'samsung-galaxy-a55-5g' ON CONFLICT DO NOTHING;
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Awesome Iceblue', 'Awesome Navy', 'Awesome Lilac'], 1 FROM nestora_products WHERE slug = 'samsung-galaxy-a55-5g' ON CONFLICT DO NOTHING;

-- MacBook Pro 14" M3 Pro
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'RAM', ARRAY['16GB', '18GB'], 0 FROM nestora_products WHERE slug = 'apple-macbook-pro-14-m3-pro' ON CONFLICT DO NOTHING;
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['512GB SSD', '1TB SSD', '2TB SSD'], 1 FROM nestora_products WHERE slug = 'apple-macbook-pro-14-m3-pro' ON CONFLICT DO NOTHING;
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Space Black', 'Silver'], 2 FROM nestora_products WHERE slug = 'apple-macbook-pro-14-m3-pro' ON CONFLICT DO NOTHING;

-- Apple Watch Series 9
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Midnight', 'Starlight', 'Pink', 'Storm Blue', 'Green'], 0 FROM nestora_products WHERE slug = 'apple-watch-series-9-gps-45mm' ON CONFLICT DO NOTHING;
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Size', ARRAY['41mm', '45mm'], 1 FROM nestora_products WHERE slug = 'apple-watch-series-9-gps-45mm' ON CONFLICT DO NOTHING;

-- Galaxy Buds2 Pro
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Phantom Black', 'Cream', 'Graphite'], 0 FROM nestora_products WHERE slug = 'samsung-galaxy-buds2-pro' ON CONFLICT DO NOTHING;

-- JBL Charge 5
INSERT INTO nestora_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Black', 'Blue', 'Red', 'Gray'], 0 FROM nestora_products WHERE slug = 'jbl-charge-5' ON CONFLICT DO NOTHING;

-- ── 2. Category Product Count Synchronization ────────────────

-- This updates the 'count' column in categories by calculating 
-- how many products are linked in the many-to-many table.

UPDATE nestora_categories c
SET count = (
  SELECT COUNT(*) 
  FROM nestora_product_categories pc 
  WHERE pc.category_id = c.id
);