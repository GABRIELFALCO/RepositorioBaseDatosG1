CREATE DATABASE Empresa2_1

USE Empresa2_1;
GO

CREATE TABLE Supplers (
SuplerId int not null identity(1,1),
CompanyName nvarchar(20) not null,
Addres nvarchar(50) not null,
Fax nvarchar(20) not null,
City nvarchar(20) not null,
Region nvarchar(20) not null,
HomePage nvarchar(20) not null,
CONSTRAINT Pk_Supplers 
PRIMARY KEY(SuplerID),
);

GO

CREATE TABLE Products (
ProductsId int not null identity(1,1),
ProductName nvarchar(20) not null,
UnitPrice money not null,
UnitsinStack int not null,
QuantityPerUnit int not null,
SuplerId int not null,
CategoryId int not null
CONSTRAINT Pk_Products
PRIMARY KEY(ProductsId),
CONSTRAINT Chk_UnitPrice
CHECK(UnitPrice > 0.0),
CONSTRAINT Unique_ProducName
UNIQUE(ProductName),
CONSTRAINT Fk_SuplerId
FOREIGN KEY(SuplerId)
REFERENCES Supplers(SuplerId),
CONSTRAINT Fk_CategoryId
FOREIGN KEY(CategoryId)
REFERENCES Categories
);

CREATE TABLE Categories (
	CategoryId int not null identity(1,1),
	categoryName nvarchar(20) not null,
	Description nvarchar (20) not null,
	CONSTRAINT pk_CategoryId 
	PRIMARY KEY(CategoryId),
	CONSTRAINT chk_categoryName 
	UNIQUE(categoryName)
);

CREATE TABLE ContacSupples(
ContactId int not null identity(1,1),
SuplerId int not null,
FullName nvarchar(20) not null,
CONSTRAINT pk_ContactId
PRIMARY KEY(ContactId),
CONSTRAINT fk_SuplerId_suplers
FOREIGN KEY(SuplerId)
REFERENCES Supplers
);

CREATE TABLE Employes(
EmployeId int not null identity(1,1),
Repor_to int not null,
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
BirthDay date not null,
city nvarchar(50) not null, 
CONSTRAINT pk_EmployeId
PRIMARY KEY(EmployeId),
CONSTRAINT fk_Repor_to
FOREIGN KEY(Repor_to)
REFERENCES Employes
);

CREATE TABLE Customers(
CustomerId int not null identity(1,1),
CompanyName nvarchar(20) not null,
City nvarchar(20) not null,
Region nvarchar(20) not null,
Phone int not null,
CONSTRAINT fk_Customers 
PRIMARY KEY(CustomerId),
);

CREATE TABLE ContactCustomers(
ContactId int not null identity(1,1),
CustomerId int not null,
FULLNAME nvarchar(20),
CONSTRAINT pk_ContactCustomers
PRIMARY KEY(ContactId),
CONSTRAINT fk_CustomerId_Customers
FOREIGN KEY(CustomerId)
REFERENCES Customers
);

CREATE TABLE Shippers(
ShippersId int not null identity(1,1),
CompanyName nvarchar(20) not null,
CONSTRAINT fk_Shippers
PRIMARY KEY(ShippersId)
);

CREATE TABLE PhonesShiper(
PhoneShipperId int not null identity(1,1),
ShippersId int not null, 
Phone int not null,
CONSTRAINT pk_PhoneShipperId
PRIMARY KEY(PhoneShipperId),
CONSTRAINT fk_ShippersId_Shippers
FOREIGN KEY(ShippersId)
REFERENCES Shippers
);

CREATE TABLE Orders(
OrderId int not null identity(1,1),
Code int not null,
ShipRegion int not null,
OrderDate date not null,
RequeredDate date not null,
EmployeId int not null,
CustomerId int not null,
CONSTRAINT pk_Orders 
PRIMARY KEY(OrderId),
CONSTRAINT fk_EmployeId_Orders
FOREIGN KEY(EmployeId)
REFERENCES Employes,
CONSTRAINT fk_customers_orders
FOREIGN KEY(CustomerId)
REFERENCES Customers,
CONSTRAINT fk_Shippers_Orders
FOREIGN KEY(ShipRegion)
REFERENCES Shippers
);

CREATE TABLE Details(
ProductId int not null,
OrderId int not null,
UnitPrice money not null,
Quantity int not null,
discount money not null,
CONSTRAINT fk_productId_details
FOREIGN KEY(ProductId)
REFERENCES Products,
CONSTRAINT fk_OrderID_details
FOREIGN KEY(OrderId)
REFERENCES Orders,
CONSTRAINT chk_UnitPriceDetails
CHECK(UnitPrice > 0.0 AND UnitPrice<2000),
CONSTRAINT chk_DiscountDe
CHECK(discount>0.0),
CONSTRAINT chk_QuantityDe
CHECK(Quantity>0)
);