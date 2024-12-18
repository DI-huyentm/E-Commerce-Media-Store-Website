-- Tạo bảng DeliveryInfo
CREATE TABLE DeliveryInfo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    city VARCHAR(100),
    address VARCHAR(255)
);

-- Tạo bảng PaymentTransaction
CREATE TABLE PaymentTransaction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    timestamp DATETIME NOT NULL,
    content TEXT,
    state VARCHAR(50),
    subtotal DECIMAL(10,2),
    delivery_fee DECIMAL(10,2),
    VAT DECIMAL(10,2),
    total DECIMAL(10,2) NOT NULL
);

-- Tạo bảng Order
CREATE TABLE `Order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    delivery_info_id INT,
    payment_transaction_id INT,
    FOREIGN KEY (delivery_info_id) REFERENCES DeliveryInfo(id),
    FOREIGN KEY (payment_transaction_id) REFERENCES PaymentTransaction(id)
);

-- Tạo bảng Media
CREATE TABLE Media (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    category VARCHAR(100),
    value DECIMAL(10,2),
    price DECIMAL(10,2),
    quantity_in_stock INT,
    is_rush_delivery_enabled BOOLEAN
);

-- Bảng Book (kế thừa từ Media)
CREATE TABLE Book (
    id INT PRIMARY KEY, -- Khóa chính trùng với Media
    author VARCHAR(255),
    publisher VARCHAR(255),
    cover_type VARCHAR(50),
    publication_date DATE,
    pages INT,
    language VARCHAR(50),
    category VARCHAR(100),
    FOREIGN KEY (id) REFERENCES Media(id)
);

-- Bảng CD (kế thừa từ Media)
CREATE TABLE CD (
    id INT PRIMARY KEY, -- Khóa chính trùng với Media
    record_label VARCHAR(255),
    track_list TEXT,
    genres VARCHAR(100),
    artists VARCHAR(255),
    release_date DATE,
    FOREIGN KEY (id) REFERENCES Media(id)
);

-- Bảng DVD (kế thừa từ Media)
CREATE TABLE DVD (
    id INT PRIMARY KEY, -- Khóa chính trùng với Media
    disc_format VARCHAR(50),
    director VARCHAR(255),
    runtime INT,
    studio VARCHAR(255),
    language VARCHAR(50),
    subtitles VARCHAR(100),
    genre VARCHAR(100),
    release_date DATE,
    FOREIGN KEY (id) REFERENCES Media(id)
);

-- Tạo bảng trung gian giữa Order và Media (n-1)
CREATE TABLE Order_Media (
    order_id INT,
    media_id INT,
    quantity INT,
    is_rush_delivery BOOLEAN,
    PRIMARY KEY (order_id, media_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(id),
    FOREIGN KEY (media_id) REFERENCES Media(id)
);

-- Tạo bảng RushOrder (is-a từ Order)
CREATE TABLE RushOrder (
    id INT PRIMARY KEY, -- Khóa chính trùng với Order
    delivery_instruction TEXT,
    delivery_time DATETIME,
    FOREIGN KEY (id) REFERENCES `Order`(id)
);
