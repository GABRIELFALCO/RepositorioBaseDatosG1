```sql
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
--Crear dos tablas con raxon de cardinalidad de 1 a N con particiacion total, esto quiere decir que la FK es NOT NULL

CREATE TABLE categoria(
categoriaId INT NOT NULL IDENTITY (1,1),
nombreCategoria NVARCHAR(50) NOT NULL,
CONSTRAINT pk_categoria
PRIMARY KEY (categoriaId),
CONSTRAINT unique_nombrecategoria
UNIQUE (nombreCategoria)
);
Go

CREATE TABLE productos3(
productoId INT NOT NULL IDENTITY(1,1),
nombreProducto NVARCHAR(20) NOT NULL,
existencia INT NOT NULL,
precioUnitario MONEY NOT NULL,
categoriaId int not null,
CONSTRAINT pk_productos3
PRIMARY KEY(productoId),

CONSTRAINT chk_existencia3
check(existencia >0 and existencia <=1000),
CONSTRAINT chk_precioUnitario
check (precioUnitario>0.0),

CONSTRAINT unique_nombreProducto3
UNIQUE (nombreProducto),
--creacion de la fk

CONSTRAINT fk_productos3_categoria
FOREIGN KEY (categoriaId)
REFERENCES categoria(categoriaId)
);
Go

CREATE TABLE categoria2(
id INT NOT NULL IDENTITY (1,1),
nombreCategoria NVARCHAR(50) NOT NULL,
CONSTRAINT pk_categoria2
PRIMARY KEY (id),
CONSTRAINT unique_nombrecategoria2
UNIQUE (nombreCategoria)
);
Go

CREATE TABLE productos4(
productoId INT NOT NULL IDENTITY(1,1),
nombreProducto NVARCHAR(20) NOT NULL,
existencia INT NOT NULL,
precioUnitario MONEY NOT NULL,
categoriaId int not null,
CONSTRAINT pk_productos4
PRIMARY KEY(productoId),
CONSTRAINT chk_existencia4
check(existencia >0 and existencia <=1000),
CONSTRAINT chk_precioUnitario4
check (precioUnitario>0.0),
CONSTRAINT unique_nombreProducto4
UNIQUE (nombreProducto),
--creacion de la fk
CONSTRAINT fk_productos4_categoria
FOREIGN KEY (categoriaId)
REFERENCES categoria2(id)
);
Go


CREATE TABLE tabla1(
tabla1id INT NOT NULL IDENTITY,
tabla1id2 INT NOT NULL,
nombre nvarchar (40),

CONSTRAINT pk_tabla1
PRIMARY KEY (tabla1id,tabla1id2)
);


CREATE TABLE tabla2(
idtabla2 int NOT NULL IDENTITY,
nombre nvarchar(50),
tabla1id int,
tabla1id2 int,

CONSTRAINT pk_tabla2
PRIMARY KEY (idtabla2),

CONSTRAINT fk_tabla2_tabla2
FOREIGN KEY (tabla1id,tabla1id2)
REFERENCES tabla1(
);
Go



--crear tablas con cardinalida 1 a1 

CREATE TABLE employe(
ID INT NOT NULL IDENTITY,
ap1 NVARCHAR(20) NOT NULL,
ap2 NVARCHAR(20) not null,
sexo CHAR (1) NOT NULL,
salario MONEY NOT NULL
CONSTRAINT pk_employe
PRIMARY KEY (ID)

);

CREATE TABLE deparmet(
id int NOT NULL IDENTITY,
nombre NVARCHAR (30) NOT NULL,
ubicacion NVARCHAR (30) NOT NULL,
employeid int NOT NULL,

CONSTRAINT pk_deparmet,
PRIMARY KEY (id),
CONSTRAINT fk

);

```