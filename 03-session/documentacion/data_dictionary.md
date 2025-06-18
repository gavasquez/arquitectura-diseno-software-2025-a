# Diccionario de Datos - Sistema de Carrito de Compras

## Tabla: Categorias

**Descripción:** Almacena las categorías de productos disponibles en el sistema.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único de la categoría |
| nombre | VARCHAR(100) | NOT NULL | Nombre de la categoría |
| descripcion | TEXT | NULL | Descripción detallada de la categoría |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación del registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: Productos

**Descripción:** Contiene la información de todos los productos disponibles para la venta.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único del producto |
| categoria_id | INT | FK, NOT NULL | Referencia a la categoría del producto |
| nombre | VARCHAR(200) | NOT NULL | Nombre del producto |
| descripcion | TEXT | NULL | Descripción detallada del producto |
| precio | DECIMAL(10,2) | NOT NULL | Precio de venta del producto |
| stock | INT | NOT NULL, DEFAULT 0 | Cantidad disponible en inventario |
| imagen_url | VARCHAR(255) | NULL | URL de la imagen del producto |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación del registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: Clientes

**Descripción:** Almacena la información de los clientes registrados en el sistema.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único del cliente |
| nombre | VARCHAR(100) | NOT NULL | Nombre del cliente |
| apellido | VARCHAR(100) | NOT NULL | Apellido del cliente |
| email | VARCHAR(100) | NOT NULL, UNIQUE | Correo electrónico del cliente |
| password | VARCHAR(255) | NOT NULL | Contraseña encriptada |
| direccion | TEXT | NULL | Dirección de entrega |
| telefono | VARCHAR(20) | NULL | Número de teléfono |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de registro |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: Facturas

**Descripción:** Registra las facturas generadas por las compras de los clientes.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único de la factura |
| cliente_id | INT | FK, NOT NULL | Referencia al cliente |
| fecha_factura | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de emisión de la factura |
| total | DECIMAL(10,2) | NOT NULL | Monto total de la factura |
| estado | ENUM | DEFAULT 'pendiente' | Estado de la factura (pendiente/pagada/cancelada) |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de última actualización |

## Tabla: DetalleFacturas

**Descripción:** Almacena el detalle de los productos incluidos en cada factura.

| Nombre Columna | Tipo de Dato | Restricciones | Descripción |
|----------------|--------------|---------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Identificador único del detalle |
| factura_id | INT | FK, NOT NULL | Referencia a la factura |
| producto_id | INT | FK, NOT NULL | Referencia al producto |
| cantidad | INT | NOT NULL | Cantidad de productos |
| precio_unitario | DECIMAL(10,2) | NOT NULL | Precio unitario al momento de la compra |
| subtotal | DECIMAL(10,2) | NOT NULL | Subtotal del detalle (cantidad * precio_unitario) |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Fecha de creación |

## Relaciones entre Tablas

1. **Categorias - Productos**: Relación uno a muchos
   - Una categoría puede tener múltiples productos
   - Un producto pertenece a una sola categoría

2. **Clientes - Facturas**: Relación uno a muchos
   - Un cliente puede tener múltiples facturas
   - Una factura pertenece a un solo cliente

3. **Facturas - DetalleFacturas**: Relación uno a muchos
   - Una factura puede tener múltiples detalles
   - Un detalle pertenece a una sola factura

4. **Productos - DetalleFacturas**: Relación uno a muchos
   - Un producto puede aparecer en múltiples detalles de factura
   - Un detalle de factura referencia a un solo producto 