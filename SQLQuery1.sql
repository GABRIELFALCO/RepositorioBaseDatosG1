-- sql-ldd
--Crea ua bese de datos
CREATE DATABASE bdpruebag1;
--cambiar de bd
USE bdpruebag1;

CREATE TABLE Categoria(
id_Categoria int not null identity(1,1),
nombres nvarchar(20)NOT NULL
constraint pk_Categoria
primary key (id_Categoria) 
);

CREATE TABLE Producto (
id_Producto int,
ProductoNombre varchar(20) NOT NULL,
descripcion varchar (100) NULL,
exstencia varchar(10),
precio money NOT NULL,
id_Categoria int NOT NULL,
constraint pk_producto
primary key(id_Categoria),
constraint fk_Producto_Categoria
foreign key(id_Categoria)
references Categoria(id_Categoria)
);

--SQL -LMD
--INSERTAR EN LA CATEGORIA 
INSERT INTO Categoria(nombres)
VALUES('VINOS Y LOCORES');

INSERT INTO Categoria(nombres)
values('carnes frias'),('linea vlanca'),('Lacteos');

UPDATE Categoria 
set nombres ='Carnes Re-Frias'
where id_Categoria =2;

select * from Categoria;
select nombres from Categoria
