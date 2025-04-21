-- Create and select the database
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- SQL Schema for E-commerce Database

-- BRAND TABLE
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE product_category (
    category_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);


CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    base_price DECIMAL(10,2),
    brand_id INT,
    category_id INT,
    description TEXT,
    created_at TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);



CREATE TABLE product_image (
    image_id INT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    is_primary BOOLEAN,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE color (
    color_id INT PRIMARY KEY,
    name VARCHAR(100),
    hex_value VARCHAR(7)
);


CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY,
    size_category_id INT,
    label VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);


CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

CREATE TABLE product_item (
    item_id INT PRIMARY KEY,
    variation_id INT,
    price DECIMAL(10,2),
    SKU VARCHAR(100),
    available BOOLEAN,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY,
    product_id INT,
    attribute_type_id INT,
    attribute_category_id INT,
    value VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);