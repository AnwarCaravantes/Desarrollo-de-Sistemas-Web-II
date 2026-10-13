CREATE DATABASE TiendaSara;
GO

USE TiendaSara;
GO

-- CREAR TABLAS

CREATE TABLE Categorias (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(200) NOT NULL
);
GO


CREATE TABLE Marcas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(200) NOT NULL,
);
GO


CREATE TABLE Productos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(200) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Cantidad INT NOT NULL,
    IdCategoria INT NOT NULL,
    IdMarca INT NOT NULL,
    CONSTRAINT FK_Productos_Categorias FOREIGN KEY (IdCategoria) REFERENCES Categorias(Id),
    CONSTRAINT FK_Productos_Marcas FOREIGN KEY (IdMarca) REFERENCES Marcas(Id)
);
GO


CREATE TABLE Carrito (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FolioVenta VARCHAR(50) NOT NULL,
    TotalCompra DECIMAL(10,2) NOT NULL,
    Estatus VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL
);
GO


CREATE TABLE CarritoDetalle (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdCarrito INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_CarritoDetalle_Carrito FOREIGN KEY (IdCarrito) REFERENCES Carrito(Id),
    CONSTRAINT FK_CarritoDetalle_Productos FOREIGN KEY (IdProducto) REFERENCES Productos(Id)
);
GO

-- CONFIRMO QUE SE CREARON

SELECT * FROM Categorias;
GO

SELECT * FROM Marcas;
GO

SELECT * FROM Productos;
GO

SELECT * FROM Carrito;
GO

SELECT * FROM CarritoDetalle;
GO


-- REALIZAR INSERCIONES

INSERT INTO Categorias (Descripcion) VALUES ('Línea Blanca');
INSERT INTO Categorias (Descripcion) VALUES ('Cómputo');
INSERT INTO Categorias (Descripcion) VALUES ('Telefonía');
INSERT INTO Categorias (Descripcion) VALUES ('Pantallas y Video');
INSERT INTO Categorias (Descripcion) VALUES ('Audio y Sonido');
INSERT INTO Categorias (Descripcion) VALUES ('Videojuegos');
INSERT INTO Categorias (Descripcion) VALUES ('Electrodomésticos');
INSERT INTO Categorias (Descripcion) VALUES ('Fotografía');
INSERT INTO Categorias (Descripcion) VALUES ('Deportes');
INSERT INTO Categorias (Descripcion) VALUES ('Calzado');
GO

INSERT INTO Marcas (Descripcion) VALUES ('Samsung');
INSERT INTO Marcas (Descripcion) VALUES ('Whirlpool');
INSERT INTO Marcas (Descripcion) VALUES ('LG');
INSERT INTO Marcas (Descripcion) VALUES ('Apple');
INSERT INTO Marcas (Descripcion) VALUES ('Xiaomi');
INSERT INTO Marcas (Descripcion) VALUES ('Sony');
INSERT INTO Marcas (Descripcion) VALUES ('HP');
INSERT INTO Marcas (Descripcion) VALUES ('Nintendo');
INSERT INTO Marcas (Descripcion) VALUES ('Motorola');
INSERT INTO Marcas (Descripcion) VALUES ('Oster');
GO

INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Pantalla LED Smart TV 55" 4K', 8999.00, 15, 4, 1);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Refrigerador Mabe 14 Pies Automático', 11499.00, 8, 1, 2);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Laptop HP 15.6" Core i5 8GB RAM', 13299.00, 7, 2, 7);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Smartphone Apple iPhone 15 128GB', 19499.00, 12, 3, 4);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Consola Nintendo Switch OLED', 6999.00, 11, 6, 8);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Lavadora Whirlpool 20 kg Automática', 9899.00, 6, 1, 2);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Bocina Amplificada Bluetooth Sony', 3499.00, 14, 5, 6);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Smartphone Xiaomi Redmi Note 13', 4899.00, 20, 3, 5);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Smartphone Motorola Edge 40', 8999.00, 13, 3, 9);
INSERT INTO Productos (Descripcion, Precio, Cantidad, IdCategoria, IdMarca) VALUES ('Licuadora Oster de 10 velocidades', 999.00, 25, 7, 10);
GO

INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1001', 8999.00, 'Completado', '2026-10-01');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1002', 11499.00, 'Completado', '2026-10-01');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1003', 13299.00, 'Proceso', '2026-10-02');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1004', 19499.00, 'Completado', '2026-10-02');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1005', 6999.00, 'Pendiente', '2026-10-03');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1006', 9899.00, 'Completado', '2026-10-03');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1007', 3499.00, 'Completado', '2026-10-04');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1008', 4899.00, 'Proceso', '2026-10-04');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1009', 8999.00, 'Completado', '2026-10-05');
INSERT INTO Carrito (FolioVenta, TotalCompra, Estatus, Fecha) VALUES ('FV-1010', 999.00, 'Cancelado', '2026-10-05');
GO

INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (1, 1, 1, 8999.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (2, 2, 1, 11499.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (3, 3, 1, 13299.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (4, 4, 1, 19499.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (5, 5, 1, 6999.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (6, 6, 1, 9899.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (7, 7, 1, 3499.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (8, 8, 1, 4899.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (9, 9, 1, 8999.00);
INSERT INTO CarritoDetalle (IdCarrito, IdProducto, Cantidad, Subtotal) VALUES (10, 10, 1, 999.00);
GO

-- CONFIRMO QUE SE INSERTARON

SELECT * FROM Categorias;
GO

SELECT * FROM Marcas;
GO

SELECT * FROM Productos;
GO

SELECT * FROM Carrito;
GO

SELECT * FROM CarritoDetalle;
GO

-- CONSULTAS CON INNER JOIN

-- 1. Consultar los productos con sus marcas y sus categorías
SELECT 
    p.Id AS IdProducto,
    p.Descripcion AS Producto,
    p.Precio,
    p.Cantidad,
    c.Descripcion AS Categoria,
    m.Descripcion AS Marca
FROM Productos p
INNER JOIN Categorias c ON p.IdCategoria = c.Id
INNER JOIN Marcas m ON p.IdMarca = m.Id;
GO

-- 2. Consultar los carritos con sus carritos detalle y sus productos
SELECT 
    ca.Id AS IdCarrito,
    ca.FolioVenta,
    ca.Estatus,
    ca.Fecha,
    cd.Cantidad AS CantidadComprada,
    cd.Subtotal,
    p.Descripcion AS Producto
FROM Carrito ca
INNER JOIN CarritoDetalle cd ON ca.Id = cd.IdCarrito
INNER JOIN Productos p ON cd.IdProducto = p.Id;
GO

-- 3. Consultar los carritos con sus carritos detalle, productos, marcas y categorías
SELECT 
    ca.Id AS IdCarrito,
    ca.FolioVenta,
    ca.Estatus,
    ca.Fecha,
    p.Descripcion AS Producto,
    c.Descripcion AS Categoria,
    m.Descripcion AS Marca,
    cd.Cantidad,
    cd.Subtotal
FROM Carrito ca
INNER JOIN CarritoDetalle cd ON ca.Id = cd.IdCarrito
INNER JOIN Productos p ON cd.IdProducto = p.Id
INNER JOIN Categorias c ON p.IdCategoria = c.Id
INNER JOIN Marcas m ON p.IdMarca = m.Id;
GO