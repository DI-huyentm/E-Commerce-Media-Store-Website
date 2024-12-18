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
    FOREIGN KEY (delivery_info_id) REFERENCES DeliveryInfo(id) ON DELETE CASCADE,
    FOREIGN KEY (payment_transaction_id) REFERENCES PaymentTransaction(id) ON DELETE CASCADE
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

-- Tạo bảng MediaImages
CREATE TABLE MediaImages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    media_id INT,
    image_url VARCHAR(500) NOT NULL,
    FOREIGN KEY (media_id) REFERENCES Media(id) ON DELETE CASCADE
);

-- Tạo bảng Book
CREATE TABLE Book (
    id INT PRIMARY KEY,
    author VARCHAR(255),
    publisher VARCHAR(255),
    cover_type VARCHAR(50),
    publication_date DATE,
    pages INT,
    language VARCHAR(50),
    FOREIGN KEY (id) REFERENCES Media(id) ON DELETE CASCADE
);

-- Tạo bảng CD
CREATE TABLE CD (
    id INT PRIMARY KEY,
    record_label VARCHAR(255),
    track_list TEXT,
    genres VARCHAR(100),
    artists VARCHAR(255),
    release_date DATE,
    FOREIGN KEY (id) REFERENCES Media(id) ON DELETE CASCADE
);

-- Tạo bảng DVD
CREATE TABLE DVD (
    id INT PRIMARY KEY,
    disc_format VARCHAR(50),
    director VARCHAR(255),
    runtime INT,
    studio VARCHAR(255),
    language VARCHAR(50),
    subtitles VARCHAR(100),
    genre VARCHAR(100),
    release_date DATE,
    FOREIGN KEY (id) REFERENCES Media(id) ON DELETE CASCADE
);

-- Tạo bảng Order_Media
CREATE TABLE Order_Media (
    order_id INT,
    media_id INT,
    quantity INT NOT NULL,
    is_rush_delivery BOOLEAN,
    PRIMARY KEY (order_id, media_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(id) ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES Media(id) ON DELETE CASCADE
);

-- Tạo bảng RushOrder
CREATE TABLE RushOrder (
    id INT PRIMARY KEY,
    delivery_instruction TEXT,
    delivery_time DATETIME,
    FOREIGN KEY (id) REFERENCES `Order`(id) ON DELETE CASCADE
);
