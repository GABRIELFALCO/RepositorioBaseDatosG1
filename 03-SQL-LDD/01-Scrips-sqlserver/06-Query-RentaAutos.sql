--CREAR LA BASE DE DATOS RENTA DE AUTOS 
CREATE DATABASE RentaAutos
USE RentaAutos;

--CREAR LA TABLA CLIENTES 
CREATE TABLE Clintes(
	IdCliente INT IDENTITY(1,1) NOT NULL,
    APaterno NVARCHAR(50) NOT NULL,
    AMaterno NVARCHAR(50) NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    Telefono NVARCHAR(15) NOT NULL,
    Curp NVARCHAR(18) NOT NULL,
    Calle NVARCHAR(20) NOT NULL,
    Numero NVARCHAR(10) NOT NULL,
    Ciudad NVARCHAR(20) NOT NULL,
    
    CONSTRAINT pk_clientes 
        PRIMARY KEY (IdCliente),
        
    CONSTRAINT unique_curp 
        UNIQUE (curp)
);
Go

--CREAR LA TABLA SUCURSAL
CREATE TABLE Sucursal(
	IdSucursal INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(25) NOT NULL,
    Direccion NVARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_sucursal 
        PRIMARY KEY (IdSucursal),
        
    CONSTRAINT unique_nombre_sucursal 
        UNIQUE (Nombre)
);
Go

--CREAR LA TABLA Vehiculos 
CREATE TABLE Vehiculos(
	IdVehiculo INT IDENTITY(1,1) NOT NULL,
    Placa NVARCHAR(8) NOT NULL,
    Modelo NVARCHAR(25) NOT NULL,
    Anio INT NOT NULL,
    Marca NVARCHAR(20) NOT NULL,
    IdSucursal INT NOT NULL,
    
    CONSTRAINT pk_vehiculos PRIMARY KEY (IdVehiculo),
        
    CONSTRAINT fk_vehiculo_sucursal FOREIGN KEY (IdSucursal) 
        REFERENCES Sucursal(IdSucursal),
        
    CONSTRAINT unique_placa 
        UNIQUE (Placa),
        
    CONSTRAINT ck_anio 
        CHECK (anio BETWEEN 2000 AND YEAR(GETDATE()) + 1)
);
Go
--CREAR TABLA RENTA 
CREATE TABLE Renta(
	IdRenta INT IDENTITY(1,1) NOT NULL,
    IdCliente INT NOT NULL,
	IdVehiculo INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    
    CONSTRAINT pk_renta 
        PRIMARY KEY (IdRenta),
        
    CONSTRAINT fk_renta_cliente FOREIGN KEY (IdCliente) 
        REFERENCES Clintes(IdCliente),
        
    CONSTRAINT fk_renta_vehiculo FOREIGN KEY (IdVehiculo) 
        REFERENCES Vehiculos(IdVehiculo),
        
    CONSTRAINT ck_fechas_validas 
        CHECK (fechaFin > fechaInicio)
);
Go