-- Script để thêm các cột profile vào bảng users hiện tại
-- Chạy script này sau khi đã tạo database ShoeStoreSimple

USE ShoeStoreSimple;

-- Thêm cột phone và image_path vào bảng users
ALTER TABLE users 
ADD COLUMN phone VARCHAR(20) AFTER password,
ADD COLUMN image_path VARCHAR(255) AFTER phone;

-- Cập nhật dữ liệu mẫu cho các user hiện tại
UPDATE users SET phone = '0123456789' WHERE user_id = 1;
UPDATE users SET phone = '0123456780' WHERE user_id = 2;
UPDATE users SET phone = '0123456781' WHERE user_id = 3;
UPDATE users SET phone = '0123456782' WHERE user_id = 4;
UPDATE users SET phone = '0123456783' WHERE user_id = 5;
UPDATE users SET phone = '0123456784' WHERE user_id = 6;
UPDATE users SET phone = '0123456785' WHERE user_id = 7;
UPDATE users SET phone = '0123456786' WHERE user_id = 8;
UPDATE users SET phone = '0123456787' WHERE user_id = 9;
UPDATE users SET phone = '0123456788' WHERE user_id = 10;

-- Kiểm tra kết quả
SELECT user_id, full_name, email, phone, image_path FROM users LIMIT 5;
