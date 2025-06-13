# Resumen de Arquitectura y Diseño de Software

## Entidades Principales
- **Productos**
- **Categorías**
- **Clientes**
- **Facturas**
- **Detalles de Facturas**

---

## Capas del Proyecto (MVC)

### Modelos
- Productos `{cass}`
- Categorías `{cass}`
- Clientes `{cass}`
- Facturas `{cass}`
- Detalles de Facturas `{cass}`

### Vistas
- Productos `{html + js + css}`
- Categorías `{html + js + css}`
- Clientes `{html + js + css}`
- Facturas `{html + js + css}`
- Detalles de Facturas `{html + js + css}`

### Controladores
- Productos `{logic}`
- Categorías `{logic}`
- Clientes `{logic}`
- Facturas `{logic}`
- Detalles de Facturas `{logic}`

---

## Estructura General del Proyecto

### Backend
- Entity
- IRepository
- IService
- IDTO
- DAO
- Service
- Controller

### Frontend
- src/
  - component/
  - view/
  - library/

---

## API y Organización

- **Backend:**
  - Entity
  - IRepository
  - IService
  - IDTO
  - DAO
  - Service
  - Controller

- **Frontend:**
  - src/
    - component/
    - view/
    - library/

