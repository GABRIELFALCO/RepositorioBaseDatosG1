CREATE DATABASE Empresa2;
use Empresa2;

CREATE TABLE Clientes(
IdCliente INT NOT NULL auto_increment,
NombreCliente NVARCHAR(50) NOT NULL,
Rfc NVARCHAR(50) NOT NULL,
Direccion NVARCHAR(60) NOT NULL
);

CREATE TABLE Pedidos (
PedidoId INT NOT NULL auto_increment,
Fecha DATE,
IdCliente INT,
CONSTRAINT PK_Pedido PRIMARY KEY (PedidoId),
CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (IdCliente)
REFERENCES Clientes(IdCliente)
);

CREATE TABLE DetallePedido (
PedidoId INT,
ProductoId INT,
PrecioVenta DECIMAL(10,2),
CantidadVendida INT,
CONSTRAINT PK_DetallePedido PRIMARY KEY (PedidoId, ProductoId),
CONSTRAINT FK_DetallePedido_Pedido
FOREIGN KEY (PedidoId)
REFERENCES Pedidos(PedidoId),
CONSTRAINT FK_DetallePedido_Producto
FOREIGN KEY (ProductoId)
REFERENCES Productos(ProductoId)
);

CREATE TABLE Categoria (
    CategoriaId INT auto_increment,
    NombreCategoria VARCHAR(100),
    CONSTRAINT PK_Categoria PRIMARY KEY (CategoriaId)
);

CREATE TABLE Productos (
    ProductoId INT auto_increment,
    NombreProducto VARCHAR(100),
    Existencia INT,
    PrecioUnitario DECIMAL(10,2),
    CategoriaId INT,
    CONSTRAINT PK_Producto PRIMARY KEY (ProductoId),
    CONSTRAINT FK_Producto_Categoria
        FOREIGN KEY (CategoriaId)
        REFERENCES Categoria(CategoriaId)
);