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
('User');

-- Users (10 người, mật khẩu để text thôi, thực tế hash)
INSERT INTO users(full_name, email, password, role_id) VALUES
('Nguyen Van A', 'admin@example.com', '123456', 1),
('Tran Thi B', 'tranb@example.com', '123456', 2),
('Le Van C', 'lec@example.com', '123456', 2),
('Pham Thi D', 'phamd@example.com', '123456', 2),
('Hoang Van E', 'hoange@example.com', '123456', 2),
('Nguyen Thi F', 'nguyenf@example.com', '123456', 2),
('Tran Van G', 'trang@example.com', '123456', 2),
('Le Thi H', 'leh@example.com', '123456', 2),
('Pham Van I', 'phami@example.com', '123456', 2),
('Hoang Thi J', 'hoangj@example.com', '123456', 2);

-- Categories (5 loại giày)
INSERT INTO categories(category_name) VALUES
('Sneaker'),
('Giày da'),
('Giày thể thao'),
('Giày cao gót'),
('Dép sandal');

-- Products (10 sản phẩm, mỗi loại 2 sản phẩm)
INSERT INTO products(product_name, price, stock, category_id) VALUES
('Nike Air Max', 2500000, 20, 1),
('Adidas Ultraboost', 3200000, 15, 1),
('Giày Da Oxford', 1800000, 10, 2),
('Giày Da Derby', 2000000, 8, 2),
('Asics Running', 1500000, 25, 3),
('Puma Training', 1700000, 18, 3),
('Gucci Cao Gót', 5000000, 5, 4),
('Zara Cao Gót', 1200000, 12, 4),
('Birkenstock Sandal', 900000, 30, 5),
('Crocs Sandal', 700000, 40, 5);

-- Orders (10 đơn hàng từ các user khác nhau)
INSERT INTO orders(user_id, total_amount, status) VALUES
(2, 2500000, 'paid'),
(3, 3200000, 'pending'),
(4, 3800000, 'paid'),
(5, 5000000, 'shipped'),
(6, 2700000, 'completed'),
(7, 4500000, 'cancelled'),
(8, 1800000, 'paid'),
(9, 2900000, 'completed'),
(10, 700000, 'pending'),
(2, 5900000, 'paid');

-- Order items (chi tiết từng đơn, gắn sản phẩm)
INSERT INTO order_items(order_id, product_id, quantity, price) VALUES
(1, 1, 1, 2500000),
(2, 2, 1, 3200000),
(3, 3, 2, 1900000),
(4, 7, 1, 5000000),
(5, 5, 1, 1500000),
(5, 6, 1, 1200000),
(6, 4, 2, 2000000),
(7, 8, 3, 1200000),
(8, 9, 2, 900000),
(9, 10, 1, 700000),
(10, 1, 1, 2500000),
(10, 2, 1, 3200000);

-- Reviews (10 đánh giá của các user cho sản phẩm)
INSERT INTO reviews(product_id, user_id, rating, comment) VALUES
(1, 2, 5, 'Đi rất êm và đẹp!'),
(2, 3, 4, 'Giày chạy bộ tốt, hơi đắt.'),
(3, 4, 5, 'Phong cách lịch lãm.'),
(4, 5, 3, 'Chất da ổn nhưng hơi cứng.'),
(5, 6, 4, 'Chạy nhẹ và bền.'),
(6, 7, 5, 'Thoáng khí, tập gym thoải mái.'),
(7, 8, 5, 'Đẹp sang chảnh.'),
(8, 9, 4, 'Được so với giá.'),
(9, 10, 3, 'Mang thoải mái nhưng hơi trơn.'),
(10, 2, 4, 'Dễ đi, tiện lợi.');

-- Login sessions (giả lập 5 phiên đăng nhập)
INSERT INTO login_sessions(user_id, token) VALUES
(1, 'token_admin_123'),
(2, 'token_user2_abc'),
(3, 'token_user3_xyz'),
(4, 'token_user4_def'),
(5, 'token_user5_ghi');

