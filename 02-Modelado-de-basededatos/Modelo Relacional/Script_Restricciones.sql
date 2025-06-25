-- CREAR BASE DE DATOS 
CREATE DATABASE restriccionesbdg1;
USE restriccionesbdg1;
CREATE TABLE Categoria(
idCategoria int,
nombre nvarchar(30));

INSERT INTO Categoria
VALUES(1,'Carnes frias');
drop table Categoria;


CREATE TABLE categoria (
categoriaid int NOT NULL,
nombre nvarchar (30),
constraint pk_categoria
primary key(categoriaid));

INSERT INTO categoria
VALUES(1,'Carnes frias');

INSERT INTO categoria
VALUES(2,'vinos yt licores');

INSERT INTO categoria
VALUES(3,'Ropa');

INSERT INTO categoria
VALUES(4,'Ropa');

SELECT * FROM categoria;

DROP TABLE categoria;


CREATE TABLE categoria (
categoriaid int NOT NULL,
nombre nvarchar (30) NOT NULL,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
unique(nombre)
);
DROP table categoria;

CREATE TABLE categoria (
categoriaid int NOT NULL,
nombre nvarchar (30) NOT NULL,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
UNIQUE(nombre)
);

CREATE table producto(
productoid int NOT NULL,
nombreprod NVARCHAR(20) NOT NULL,
precio MONEY NOT NULL,
existencia NUMERIC (10,2) NOT NULL,
categoria INT,
CONSTRAINT pk_producto
PRIMARY KEY (productoid),
CONSTRAINT unique_nombreprod
UNIQUE (nombreprod),
CONSTRAINT chk_precio
CHECK (precio>0 and precio<=4000),
CONSTRAINT chk_existecia
CHECK (existencia>=0),
CONSTRAINT fk_producto_categoria
FOREIGN KEY (categoria)
REFERENCES categoria (categoriaid)
);





DROP TABLE producto;

INSERT INTO categoria
VALUES(1,'Carnes frias');

INSERT INTO categoria
VALUES(2,'vinos yt licores');

INSERT INTO categoria
VALUES(8,'ROPACHINA');

INSERT INTO producto
VALUES(1,'Tonayan',4000,4,2);

INSERT INTO producto
VALUES(2,'Tonayan2',1250.6,40,2);

INSERT INTO producto
VALUES(3,'Bucañas',200,8,2);

INSERT INTO producto
VALUES(4,'Calzon Chino',6.3,890,8);

INSERT INTO producto
VALUES(8,'Ropa china',6.3,890,8);


SELECT * FROM producto AS p
INNER JOIN categoria AS c
ON c.categoriaid = p.categoria;