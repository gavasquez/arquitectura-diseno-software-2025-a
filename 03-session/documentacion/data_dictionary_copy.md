# Diccionario de Datos - Sistema de Carrito de Compras (ecommerce_cart)

## Tabla: Categories

**Descripción:** Almacena las categorías de productos disponibles en el sistema.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único de la categoría |
| name | VARCHAR(100) | NOT NULL, UNIQUE | Nombre de la categoría |
| description | TEXT | NULL | Descripción de la categoría |
| status | ENUM | DEFAULT 'active' | Estado de la categoría |
| delete_at | TIMESTAMP | NULL | Fecha de eliminación lógica |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación del registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: Products

**Descripción:** Contiene los productos disponibles para la venta.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único del producto |
| category_id | INT | FK, NOT NULL | Referencia a la categoría del producto |
| name | VARCHAR(200) | NOT NULL | Nombre del producto |
| description | TEXT | NULL | Descripción del producto |
| price | DECIMAL(10,2) | NOT NULL | Precio del producto |
| stock | INT UNSIGNED | NOT NULL, DEFAULT 0 | Cantidad disponible en inventario |
| image_url | VARCHAR(255) | NULL | URL de la imagen del producto |
| status | ENUM | DEFAULT 'active' | Estado del producto |
| delete_at | TIMESTAMP | NULL | Fecha de eliminación lógica |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación del registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: Roles

**Descripción:** Define los distintos roles que pueden tener los usuarios del sistema.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único del rol |
| name | VARCHAR(50) | NOT NULL, UNIQUE | Nombre del rol (cliente, proveedor, etc.) |
| description | TEXT | NULL | Descripción del rol |
| status | ENUM | DEFAULT 'active' | Estado del rol |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación del registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: Peoples

**Descripción:** Almacena la información personal de los usuarios del sistema.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único de la persona |
| first_name | VARCHAR(100) | NOT NULL | Nombre de la persona |
| last_name | VARCHAR(100) | NOT NULL | Apellido de la persona |
| email | VARCHAR(100) | NOT NULL, UNIQUE | Correo electrónico de la persona |
| phone | VARCHAR(20) | NULL | Número de teléfono |
| address | TEXT | NULL | Dirección de residencia |
| status | ENUM | DEFAULT 'active' | Estado de la persona |
| delete_at | TIMESTAMP | NULL | Fecha de eliminación lógica |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación del registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: Users

**Descripción:** Maneja las credenciales y la relación con la persona.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único del usuario |
| person_id | INT | FK, NOT NULL | Referencia a la persona asociada |
| username | VARCHAR(50) | NOT NULL, UNIQUE | Nombre de usuario |
| password | VARCHAR(255) | NOT NULL | Contraseña cifrada del usuario |
| status | ENUM | DEFAULT 'active' | Estado del usuario |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación del registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: UserRoles

**Descripción:** Relaciona usuarios con uno o varios roles del sistema.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| user_id | INT | PK, FK | Referencia al usuario |
| role_id | INT | PK, FK | Referencia al rol asignado |

## Tabla: Invoices

**Descripción:** Registra las facturas emitidas a los usuarios del sistema.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único de la factura |
| user_id | INT | FK, NOT NULL | Usuario que genera la factura |
| invoice_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de emisión de la factura |
| total | DECIMAL(10,2) | NOT NULL | Total de la factura |
| status | ENUM | DEFAULT 'pending' | Estado de la factura (pendiente, pagada, cancelada) |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación del registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: InvoiceDetails

**Descripción:** Detalle de los productos incluidos en cada factura.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único del detalle de factura |
| invoice_id | INT | FK, NOT NULL | Referencia a la factura |
| product_id | INT | FK, NOT NULL | Referencia al producto incluido |
| quantity | INT | NOT NULL | Cantidad de productos comprados |
| unit_price | DECIMAL(10,2) | NOT NULL | Precio unitario en el momento de la compra |
| subtotal | DECIMAL(10,2) | GENERATED | Subtotal (quantity * unit_price) |

## Relaciones entre Tablas

1. Categories - Products: Una categoría puede tener múltiples productos.
2. Peoples - Users: Una persona puede tener un solo usuario asociado.
3. Users - Invoices: Un usuario puede generar múltiples facturas.
4. Users - Roles (UserRoles): Un usuario puede tener uno o varios roles.
5. Roles - Users (UserRoles): Un rol puede estar asignado a múltiples usuarios.
6. Invoices - InvoiceDetails: Una factura puede contener múltiples líneas de detalle.
7. Products - InvoiceDetails: Un producto puede figurar en múltiples líneas de detalle.
