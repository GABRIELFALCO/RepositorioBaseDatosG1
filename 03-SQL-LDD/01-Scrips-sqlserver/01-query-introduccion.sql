--Lenguaje SQL-LDD
--Crear la base de datos empresa
CREATE DATABASE empresa;
Go

--utilizar la base de datos creada
USE empresa;
Go

--crear tabla empleados
CREATE TABLE Empleados(
IdEmpleado int NOT NULL,
Nombre VARCHAR(100) NOT NULL,
Puesto VARCHAR(50) NOT NULL,
FechaIngreso DATE,
Salario MONEY NOT NULL,
CONSTRAINT Pk_empleados
PRIMARY KEY (IdEmpleado),
);
Go

CREATE TABLE Productos(
ProductoId int PRIMARY KEY,
NombreProducto NVARCHAR(50)	NOT NULL,
Existencia INT NOT NULL,
PrecioUnitario MONEY NOT NULL
);
Go

CREATE TABLE Productos2(
ProductoId INT NOT NULL IDENTITY(1,1),
NombreProducto NVARCHAR(50) NOT NULL,
Existencia INT NOT NULL,
Precio MONEY NOT NULL,
CONSTRAINT pk_productos2 
PRIMARY KEY (ProductoId),
CONSTRAINT unique_nombreproducto
UNIQUE(NombreProducto),
CONSTRAINT chk_existencia
CHECK (Existencia>0 AND Existencia<=1000),
CONSTRAINT chk_precio
CHECK (Precio >0.0)

);
Go

--insertar un producto en Productos
INSERT INTO Productos (ProductoId,NombreProducto,
Existencia,PrecioUnitario)
VALUES(1,'Burritos de Frijoles',65,20.99);
Go

INSERT INTO Productos (ProductoId,NombreProducto,
Existencia,PrecioUnitario)
VALUES(2,'Burritos de Frijoles',65,20.99);
Go

SELECT * FROM Productos;
Go

--insertar en la tabla productos con identity
INSERT INTO Productos2 (NombreProducto,
Existencia,Precio)
VALUES('Burritos de Chorizo',100,21.0);
Go

INSERT INTO Productos2 (NombreProducto,
Existencia,Precio)
VALUES('Burritos de frijol',999,60);
Go

INSERT INTO Productos2 (NombreProducto,
Existencia,Precio)
VALUES('Burritos de Chorizo de otro 2',100,451.0);
Go

SELECT * FROM Productos2;