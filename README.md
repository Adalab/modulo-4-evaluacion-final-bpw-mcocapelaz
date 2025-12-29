Ejercicio de evaluación del módulo 4- Bootcamp de programación web de Adalab

# API REST - Gestión de Biblioteca

API REST desarrollada con Node.js, Express y MySQL para la gestión de una biblioteca personal. Permite realizar operaciones CRUD sobre libros y gestión de usuarias con autenticación JWT.

## Tecnologías utilizadas

- **Node.js** - Entorno de ejecución de JavaScript
- **Express.js** - Framework web para Node.js
- **MySQL2** - Cliente MySQL con soporte de Promises
- **bcrypt** - Encriptación de contraseñas
- **jsonwebtoken (JWT)** - Autenticación basada en tokens
- **dotenv** - Gestión de variables de entorno
- **CORS** - Middleware para habilitar CORS 

## Requisitos previos

- Node.js (v14 o superior)
- MySQL (v8 o superior)
- npm

## Estructura del proyecto

├── config/
│ └── database.js # Configuración de conexión a MySQL
├── routes/
│ └── users.js # Rutas de autenticación
├── src/
│ └── index.js # Archivo principal del servidor
├── .env # Variables de entorno
├── package.json
└── README.md

text

## Seguridad

text
undefined

## Seguridad

- Las contraseñas se encriptan con bcrypt antes de almacenarse
- Autenticación mediante tokens JWT
- Variables sensibles protegidas en archivo `.env`

## Próximas mejoras

- [ ] Implementar endpoint de inicio de sesión (login)
- [ ] Middleware de verificación de token para proteger rutas
- [ ] Documentación completa con Swagger
- [ ] Tests unitarios e integración
- [ ] Servidor de estáticos

  
## Autora

Mónica Coca - Evaluación Final Módulo 4 - Adalab

## Licencia

ISC
