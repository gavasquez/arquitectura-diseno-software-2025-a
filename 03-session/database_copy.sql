-- ============================================================
-- DATABASE: ecommerce_cart
-- ============================================================
CREATE DATABASE ecommerce_cart;
USE ecommerce_cart;

-- ------------------------------------------------------------
-- 1. Tabla Categorias
-- ------------------------------------------------------------
CREATE TABLE Categories (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    description     TEXT,
    status          ENUM('active', 'inactive') DEFAULT 'active',
    delete_at       TIMESTAMP NULL,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_Categories_name (name)
);

-- ------------------------------------------------------------
-- 1. Tabla Roles (Manejarons Proveedores, Clientes, Empleados)
-- ------------------------------------------------------------
CREATE TABLE Roles (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(50) NOT NULL UNIQUE,
    description     TEXT,
    status          ENUM('active', 'inactive') DEFAULT 'active',
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- 2. Tabla Personas
-- ------------------------------------------------------------
CREATE TABLE Peoples (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    first_name       VARCHAR(100) NOT NULL,
    last_name        VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    phone           VARCHAR(20),
    address         TEXT,
    status          ENUM('active', 'inactive') DEFAULT 'active',
    delete_at       TIMESTAMP NULL,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------
-- 2. Tabla Usuarios
-- ------------------------------------------------------------
CREATE TABLE Users (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    person_id        INT NOT NULL,
    username        VARCHAR(50) NOT NULL UNIQUE,
    password        VARCHAR(255) NOT NULL,
    status          ENUM('active', 'inactive', 'blocked') DEFAULT 'active',
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (person_id) REFERENCES People(id)
);

-- ------------------------------------------------------------
-- 2. Tabla User Roles (Para manejar los usuarios por role)
-- ------------------------------------------------------------
CREATE TABLE UserRoles (
    user_id          INT,
    role_id          INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES Roles(id)
);

-- ------------------------------------------------------------
-- 3. Tabla Prodcutos
-- ------------------------------------------------------------
CREATE TABLE Products (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    category_id      INT NOT NULL,
    name            VARCHAR(200) NOT NULL,
    description     TEXT,
    price           DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock           INT UNSIGNED NOT NULL DEFAULT 0,
    image_url        VARCHAR(255),
    status          ENUM('active', 'inactive', 'discontinued') DEFAULT 'active',
    delete_at       TIMESTAMP NULL,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(id),
    KEY ix_Products_name (name),
    KEY ix_Products_category_id (category_id)
);

-- ------------------------------------------------------------
-- 4. Tabla Facturas
-- ------------------------------------------------------------
CREATE TABLE Invoices (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NOT NULL,
    invoice_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total           DECIMAL(10,2) NOT NULL,
    status          ENUM('pending', 'paid', 'cancelled') DEFAULT 'pending',
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- ------------------------------------------------------------
-- 4. Tabla Detalle Facturas
-- ------------------------------------------------------------
CREATE TABLE InvoiceDetails (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id       INT NOT NULL,
    product_id       INT NOT NULL,
    quantity        INT NOT NULL,
    unit_price       DECIMAL(10,2) NOT NULL,
    subtotal        DECIMAL(10,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (invoice_id) REFERENCES Invoices(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    KEY ix_InvoiceDetails_invoice_id (invoice_id),
    KEY ix_InvoiceDetails_product_id (product_id)
);
