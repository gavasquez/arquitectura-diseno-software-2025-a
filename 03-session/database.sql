-- Creación de la base de datos
CREATE DATABASE ecommerce_cart; -- ingles
USE ecommerce_cart;

-- Tabla de Categorías 
CREATE TABLE Categorias ( -- nombre de la entidad PascalCase y plural
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

update Categorias set deteled_at = now() where id = 50;
delete from ecommerce_cart.Categorias where id = 50;

-- Tabla de Productos
CREATE TABLE Productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria_id INT NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    imagen_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

-- Personas
CREATE TABLE Personas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Usarios
CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (persona_id) REFERENCES Personas(id)
);

-- Empleados
CREATE TABLE Empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    puesto VARCHAR(100),
    usuario_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Provedores
CREATE TABLE Proveedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabla de Clientes
CREATE TABLE Clientes (
   id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Roles
CREATE TABLE Roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de Facturas
CREATE TABLE Facturas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    fecha_factura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    estado ENUM('pendiente', 'pagada', 'cancelada') DEFAULT 'pendiente',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

-- Tabla de DetalleFacturas
CREATE TABLE DetallesFacturas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    factura_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (factura_id) REFERENCES Facturas(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

delete from ecommerce_cart.DetallesFacturas where id = 50;

-- Datos de ejemplo para Categorías
INSERT INTO Categorias (nombre, descripcion) VALUES
('Electrónicos', 'Productos electrónicos y gadgets'),
('Ropa', 'Ropa para todas las edades'),
('Hogar', 'Artículos para el hogar');

-- Datos de ejemplo para Productos
INSERT INTO Productos (categoria_id, nombre, descripcion, precio, stock, imagen_url) VALUES
(1, 'Smartphone XYZ', 'Último modelo de smartphone', 599.99, 50, 'smartphone.jpg'),
(1, 'Laptop ABC', 'Laptop de alta gama', 1299.99, 30, 'laptop.jpg'),
(2, 'Camisa Casual', 'Camisa casual para hombre', 29.99, 100, 'camisa.jpg'),
(3, 'Lámpara LED', 'Lámpara LED moderna', 49.99, 75, 'lampara.jpg');

-- Datos de ejemplo para Clientes
INSERT INTO Clientes (nombre, apellido, email, password, direccion, telefono) VALUES
('Juan', 'Pérez', 'juan@email.com', 'hashed_password_1', 'Calle Principal 123', '123-456-7890'),
('María', 'González', 'maria@email.com', 'hashed_password_2', 'Avenida Central 456', '098-765-4321');

-- Datos de ejemplo para Facturas
INSERT INTO Facturas (cliente_id, total, estado) VALUES
(1, 629.98, 'pagada'),
(2, 1299.99, 'pendiente');

-- Datos de ejemplo para DetalleFacturas
INSERT INTO DetalleFacturas (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 599.99, 599.99),
(1, 3, 1, 29.99, 29.99),
(2, 2, 1, 1299.99, 1299.99); 