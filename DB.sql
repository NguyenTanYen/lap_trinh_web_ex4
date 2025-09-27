CREATE DATABASE ShoeStoreSimple;
USE ShoeStoreSimple;

-- 1) Roles
CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- 2) Users (có mật khẩu để login)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255), -- lưu hash
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- 3) Categories (danh mục sản phẩm)
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 4) Products (sản phẩm giày)
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 5) Orders (đơn hàng)
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 6) Order Items (chi tiết đơn hàng)
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 7) Reviews (đánh giá sản phẩm)
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT,
    comment TEXT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 8) (tuỳ chọn) Login Sessions - quản lý token đăng nhập
CREATE TABLE login_sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    token VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Roles
INSERT INTO roles(role_name) VALUES
                                 ('Admin'),
                                 ('Customer'),
                                 ('Staff');

-- Users (10 người)
INSERT INTO users(full_name, email, password, role_id) VALUES
                                                           ('Nguyen Van Admin', 'admin@shoestore.com', 'admin123', 1),
                                                           ('Tran Minh Khoa', 'khoa.tran@example.com', 'pass123', 2),
                                                           ('Le Thi Mai', 'mai.le@example.com', 'pass123', 2),
                                                           ('Pham Van Long', 'long.pham@example.com', 'pass123', 2),
                                                           ('Hoang Thi Lan', 'lan.hoang@example.com', 'pass123', 2),
                                                           ('Do Quang Huy', 'huy.do@example.com', 'pass123', 2),
                                                           ('Nguyen Thi Thanh', 'thanh.nguyen@example.com', 'pass123', 2),
                                                           ('Bui Van Tuan', 'tuan.bui@example.com', 'pass123', 2),
                                                           ('Vo Thi Ngoc', 'ngoc.vo@example.com', 'pass123', 2),
                                                           ('Dang Van Nam', 'nam.dang@example.com', 'pass123', 3);

-- Categories (5 loại giày)
INSERT INTO categories(category_name) VALUES
                                          ('Sneaker'),
                                          ('Giày da công sở'),
                                          ('Giày thể thao'),
                                          ('Giày nữ cao gót'),
                                          ('Sandal & Dép');

-- Products (10 sản phẩm)
INSERT INTO products(product_name, price, stock, category_id) VALUES
                                                                  ('Nike Air Force 1', 2300000, 25, 1),
                                                                  ('Adidas Stan Smith', 2800000, 18, 1),
                                                                  ('Giày Da Brogue', 2200000, 12, 2),
                                                                  ('Giày Da Loafer', 2100000, 9, 2),
                                                                  ('New Balance 574', 1900000, 20, 3),
                                                                  ('Mizuno Running Pro', 2600000, 14, 3),
                                                                  ('Christian Dior Cao Gót', 7200000, 4, 4),
                                                                  ('Charles & Keith Cao Gót', 1500000, 10, 4),
                                                                  ('Sandal Bata', 850000, 22, 5),
                                                                  ('Dép Adidas Slide', 950000, 35, 5);

-- Orders (10 đơn hàng)
INSERT INTO orders(user_id, total_amount, status) VALUES
                                                      (2, 2300000, 'paid'),
                                                      (3, 2800000, 'pending'),
                                                      (4, 4300000, 'paid'),
                                                      (5, 7200000, 'shipped'),
                                                      (6, 1900000, 'completed'),
                                                      (7, 2100000, 'cancelled'),
                                                      (8, 1700000, 'paid'),
                                                      (9, 950000, 'completed'),
                                                      (10, 850000, 'pending'),
                                                      (3, 5100000, 'paid');

-- Order items
INSERT INTO order_items(order_id, product_id, quantity, price) VALUES
                                                                   (1, 1, 1, 2300000),
                                                                   (2, 2, 1, 2800000),
                                                                   (3, 3, 1, 2200000),
                                                                   (3, 4, 1, 2100000),
                                                                   (4, 7, 1, 7200000),
                                                                   (5, 5, 1, 1900000),
                                                                   (6, 6, 1, 2600000),
                                                                   (7, 8, 1, 1500000),
                                                                   (8, 9, 2, 850000),
                                                                   (9, 10, 1, 950000),
                                                                   (10, 1, 1, 2300000),
                                                                   (10, 2, 1, 2800000);

-- Reviews (10 đánh giá)
INSERT INTO reviews(product_id, user_id, rating, comment) VALUES
                                                              (1, 2, 5, 'Sneaker kinh điển, phối đồ dễ.'),
                                                              (2, 3, 4, 'Thiết kế đẹp, hơi dễ dơ.'),
                                                              (3, 4, 5, 'Giày da sang trọng, hợp công sở.'),
                                                              (4, 5, 3, 'Thoải mái nhưng da hơi cứng.'),
                                                              (5, 6, 4, 'Chạy tốt, giá ổn.'),
                                                              (6, 7, 5, 'Giày thể thao nhẹ, bám tốt.'),
                                                              (7, 8, 5, 'Sang trọng, quý phái.'),
                                                              (8, 9, 4, 'Đẹp, đi êm.'),
                                                              (9, 10, 3, 'Sandal thoáng nhưng bám chưa tốt.'),
                                                              (10, 3, 4, 'Dép đi nhẹ, giá hợp lý.');

-- Login sessions (5 phiên đăng nhập)
INSERT INTO login_sessions(user_id, token) VALUES
                                               (1, 'session_token_admin'),
                                               (2, 'session_token_user2'),
                                               (3, 'session_token_user3'),
                                               (4, 'session_token_user4'),
                                               (5, 'session_token_user5');

