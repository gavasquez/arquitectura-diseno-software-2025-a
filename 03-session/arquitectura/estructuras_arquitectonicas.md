# Estructuras Arquitectónicas - Sistema de Carrito de Compras

## 1. Arquitectura Monolítica - MVC

```
ecommerce-mvc/
├── app/
│   ├── controllers/
│   │   ├── ProductoController.php
│   │   ├── CarritoController.php
│   │   ├── ClienteController.php
│   │   └── PedidoController.php
│   ├── models/
│   │   ├── Producto.php
│   │   ├── Carrito.php
│   │   ├── Cliente.php
│   │   └── Pedido.php
│   └── views/
│       ├── productos/
│       ├── carrito/
│       ├── clientes/
│       └── pedidos/
├── config/
│   ├── database.php
│   └── app.php
├── public/
│   ├── css/
│   ├── js/
│   └── images/
└── vendor/
```

### Descripción de Capas MVC
- **Controllers**: Manejan las peticiones HTTP y la lógica de presentación
- **Models**: Contienen la lógica de negocio y acceso a datos
- **Views**: Templates para la presentación
- **Config**: Configuraciones de la aplicación
- **Public**: Archivos estáticos y punto de entrada

## 2. Arquitectura Orientada a Servicios - N-Capas

```
ecommerce-ncapas/
├── backend/
│   ├── src/
│   │   ├── Domain/
│   │   │   ├── Entities/
│   │   │   ├── Interfaces/
│   │   │   └── Services/
│   │   ├── Application/
│   │   │   ├── DTOs/
│   │   │   └── Services/
│   │   ├── Infrastructure/
│   │   │   ├── Persistence/
│   │   │   └── External/
│   │   └── Presentation/
│   │       ├── Controllers/
│   │       └── Middleware/
│   ├── tests/
│   └── config/
└── frontend/
    ├── src/
    │   ├── components/
    │   ├── pages/
    │   ├── services/
    │   └── utils/
    ├── public/
    └── tests/
```

### Descripción de Capas N-Capas
- **Domain**: Entidades y reglas de negocio
- **Application**: Casos de uso y servicios
- **Infrastructure**: Implementaciones técnicas
- **Presentation**: Controladores y middleware

## 3. Arquitectura en Capas (Negocio y Controlador Separados)

```
ecommerce-layered/
├── backend/
│   ├── business/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── interfaces/
│   │   ├── application/
│   │   │   └── services/
│   │   └── infrastructure/
│   │       └── repositories/
│   ├── controller/
│   │   ├── api/
│   │   │   └── v1/
│   │   └── middleware/
│   └── shared/
│       ├── utils/
│       └── config/
└── frontend/
    ├── src/
    │   ├── features/
    │   ├── shared/
    │   └── app/
    └── public/
```

### Descripción de Capas Separadas
- **Business**: Lógica de negocio y dominio
- **Controller**: Manejo de peticiones HTTP
- **Shared**: Utilidades y configuraciones comunes

## 4. Arquitectura de Microservicios

```
ecommerce-microservices/
├── api-gateway/
│   ├── src/
│   └── config/
├── servicio-productos/
│   ├── src/
│   │   ├── domain/
│   │   ├── application/
│   │   └── infrastructure/
│   └── tests/
├── servicio-carrito/
│   ├── src/
│   │   ├── domain/
│   │   ├── application/
│   │   └── infrastructure/
│   └── tests/
├── servicio-pedidos/
│   ├── src/
│   │   ├── domain/
│   │   ├── application/
│   │   └── infrastructure/
│   └── tests/
└── servicio-clientes/
    ├── src/
    │   ├── domain/
    │   ├── application/
    │   └── infrastructure/
    └── tests/
```

### Descripción de Microservicios
- **API Gateway**: Punto de entrada único
- **Servicios**: Componentes independientes
- **Tests**: Pruebas por servicio

## 5. Arquitectura de Microservicios con DDD

```
ecommerce-ddd/
├── api-gateway/
│   ├── src/
│   │   ├── routes/
│   │   └── middleware/
│   └── config/
├── servicio-productos/
│   ├── src/
│   │   ├── Domain/
│   │   │   ├── Producto/
│   │   │   │   ├── Entity/
│   │   │   │   ├── ValueObjects/
│   │   │   │   └── Repository/
│   │   │   └── Categoria/
│   │   ├── Application/
│   │   │   ├── Commands/
│   │   │   └── Queries/
│   │   └── Infrastructure/
│   │       ├── Persistence/
│   │       └── External/
│   └── tests/
├── servicio-carrito/
│   ├── src/
│   │   ├── Domain/
│   │   │   ├── Carrito/
│   │   │   └── Item/
│   │   ├── Application/
│   │   └── Infrastructure/
│   └── tests/
├── servicio-pedidos/
│   ├── src/
│   │   ├── Domain/
│   │   │   ├── Pedido/
│   │   │   └── Factura/
│   │   ├── Application/
│   │   └── Infrastructure/
│   └── tests/
└── servicio-clientes/
    ├── src/
    │   ├── Domain/
    │   │   ├── Cliente/
    │   │   └── Direccion/
    │   ├── Application/
    │   └── Infrastructure/
    └── tests/
```

### Descripción de Microservicios con DDD
- **Domain**: Agregados, entidades y objetos de valor
- **Application**: Comandos y consultas
- **Infrastructure**: Implementaciones técnicas
- **Tests**: Pruebas por dominio 