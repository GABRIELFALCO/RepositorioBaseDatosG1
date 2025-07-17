```SQL
--CREAR LA BASE DE DATOS PRESTAMOSLIBROS
CREATE DATABASE PrestamoLibros
USE PrestamoLibros;

--CREAR LA TABLA LECTOR
CREATE TABLE Lector(
IdLector INT IDENTITY(1,1) NOT NULL,
    Apellido1 NVARCHAR(30) NOT NULL,
    Apellido2 NVARCHAR(30) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    NumLector INT NOT NULL,
    
    CONSTRAINT PK_Lector PRIMARY KEY (IdLector),
        
    CONSTRAINT UQ_NumLector 
        UNIQUE (NumLector),
);
Go
--CRAR LA TABLA LIBROS 
CREATE TABLE Libros (
    IdLibro INT IDENTITY(1,1) NOT NULL,
    NumISBN NVARCHAR(30) NOT NULL,
    Titulo NVARCHAR(30) NOT NULL,
    Autor NVARCHAR(30) NOT NULL,
    CantLibros INT NOT NULL,
    
    CONSTRAINT PK_Libros 
        PRIMARY KEY (IdLibro),
        
    CONSTRAINT UQ_ISBN 
        UNIQUE (NumISBN),
        
    CONSTRAINT CK_Cantidad_Positiva 
        CHECK (CantLibros >= 0),
		);
		Go

		--CREAR LA TABLA PRESTAMOS 
		CREATE TABLE Prestamos (
    IdPrestamo INT IDENTITY(1,1) NOT NULL,
    IdLibro INT NOT NULL,
    IdLector INT NOT NULL,
    FechaPrestamo DATE NOT NULL DEFAULT GETDATE(),
    FechaDevolucion DATE NULL,
    
    CONSTRAINT PK_Prestamos 
        PRIMARY KEY (IdPrestamo),
        
    CONSTRAINT FK_Prestamos_Libros 
        FOREIGN KEY (IdLibro) 
        REFERENCES Libros(IdLibro)
        ON DELETE CASCADE,
        
    CONSTRAINT FK_Prestamos_Lector 
        FOREIGN KEY (IdLector) 
        REFERENCES Lector(IdLector)
		);
		Go
        ```