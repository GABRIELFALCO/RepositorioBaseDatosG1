-- Lenguaje SQL-LMD
--Consultas simples 

USE NORTHWND;
GO 

--seleccionar todos los clietes 
SELECT * 
FROM Customers;

--seleccionar todos las clientes pero solamente mostrando, la clave 
--nombre del cliente, la ciudad y el pais (Proyeccion)

SELECT CustomerID AS NumeroCliente, CompanyName AS 'Nombre Clientes', 
City Ciudad, Country AS [Ciudad Chida]
FROM Customers;

--Campos Calculados 

--Selccionar las ordenes de compra mostrando los productos, la cantidad
--vendida, precio de venta, el descuento y el total

SELECT ProductID AS [Nombre producto], UnitPrice AS [Precio],
	   Quantity AS [Cantidad], Discount AS [Descuento],
	   (UnitPrice * Quantity) AS [Importe Sin Descuento],
	   (UnitPrice * Quantity * (1 - Discount)) AS [Importe]
FROM [Order Details]

--Seleccionar ordenes de compra, mostrando el cliente al que se le 
--vendio, el empleado que la realizo, la fecha de la orden, el transportista,
-- y la fecha de la orden, dividirla, en año, mes, dia, trimestre

SELECT OrderID AS [Numero de orden], 
OrderDate AS [Fecha de orden], CustomerID AS [Cliente], 
EmployeeID AS [Empleado], ShipVia AS [Transportista],
YEAR(OrderDate) AS [Año de la compra],
MONTH(OrderDate) AS [Mes de la compra],
Day(OrderDate) AS [Dia de la compra]
FROM Orders

SELECT OrderID AS [Numero de orden], 
OrderDate AS [Fecha de orden], CustomerID AS [Cliente], 
EmployeeID AS [Empleado], ShipVia AS [Transportista],
DATEPART(YEAR, OrderDate) AS [Año de la compra],
DATEPART(mm,OrderDate) AS [Mes de la compra],
DATEPART(d,OrderDate) AS [Dia de la compra],
DATEPART(qq,OrderDate) AS [Trimestre],
DATEPART(WEEK, OrderDate) AS [Semana],
DATEPART(WEEKDAY,OrderDate) AS [Dia Semana],
DATENAME(WEEKDAY, OrderDate) AS [Nombre Dia]

--order by  -> Ordenar los datos de forma ascendente y decendente 
--Seleccionar los empleados ordenados por su pais 

SELECT (TitleOfCourtesy + ' '+ FirstName+ ' '+ LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY Country ASC;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY Country DESC;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY 2 DESC;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) DESC;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY [Nombre Completo] DESC;


SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY Country, City;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY Country DESC, City;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY Country DESC, City DESC;


SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY Country ASC, City DESC;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY 2 ASC, 3  DESC;

SELECT CONCAT (TitleOfCourtesy , ' ', FirstName, ' ', LastName) AS [Nombre Completo],
Country AS [Pais] ,City AS [Ciudad]
FROM Employees
ORDER BY 1 ASC, Country DESC, 3 DESC;

--Seleccionar todos los productos que su precio 
--se mayos a 40.3 (Mostrar el numero del producto, nombre del producto 
--y precio unitario

SELECT ProductID AS [Numero de Producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice > 40.3;

SELECT ProductID AS [Numero de Producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice >= 40.3;

SELECT ProductID AS [Numero de Producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers'

--Seleccionar todas las ordenes que sean de brazil rio de janerio ,mostrando 
--solo el numero de orden, la fecha de orden, pais de evento, ciudad y tranposrtista
SELECT OrderID AS [Numero de orden],
OrderDate AS [Fecha de orden],
ShipCountry AS [pais],
ShipCity AS [Pais de envio],
ShipVia AS [tRANSPORTISTA]
FROM Orders
WHERE ShipCity ='Rio de janeiro';

--INNER JOIN 
SELECT OrderID AS [Numero de orden],
OrderDate AS [Fecha de orden],
ShipCountry AS [pais],
ShipCity AS [Pais de envio],
ShipVia AS [tRANSPORTISTA]
FROM Orders
WHERE ShipCity ='Rio de janeiro';

SELECT 
o.OrderID AS [Numero de orden],
o.OrderDate AS [Fecha de orden],
o.ShipCountry AS [pais],
o.ShipCity AS [Pais de envio],
s.ShipperID AS [Numero de transportisat],
s.CompanyName AS [Transportista]

FROM Orders AS o 
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE ShipCity = 'Rio de janeiro';

--seleccionar todas las ordenes mostrando lo mismo que 
--la consulta anterior pero todas aquellas que no tengan 
--region de envio
SELECT 
o.OrderID AS [Numero de orden],
o.OrderDate AS [Fecha de orden],
o.ShipCountry AS [pais],
o.ShipCity AS [Pais de envio],
s.ShipperID AS [Numero de transportisat],
s.CompanyName AS [Transportista]

FROM Orders AS o 
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE ShipRegion  is not NULL;

--seleccionar todas la ordenes enviadas a brazil alemania y 
--que tengan region, ordenar de forma desendente por el shipcontry 

SELECT OrderID AS [Numero de orden],
ShipRegion as [Region]


FROM Orders
WHERE ShipRegion IS NOT NULL

SELECT 
o.OrderID AS [Numero de orden],
o.OrderDate AS [Fecha de orden],
o.ShipCountry AS [pais],
o.ShipCity AS [Pais de envio],
s.ShipperID AS [Numero de transportisat],
s.CompanyName AS [Transportista]

FROM Orders AS o 
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE (ShipCountry ='Mexico' or
ShipCountry ='Germany' or
ShipCountry ='Brazil') and
ShipRegion is not null
order by ShipRegion DESC;






USE BDEJEMPLO2;
Go

--Seleccionar cuantos puestos diferentes tienen los representantes
SELECT DISTINCT Puesto
FROM Representantes
ORDER BY Puesto;

--Seleccionar todos los aises de mis clientes 
use NORTHWND

SELECT DISTINCT Country,City
FROM Customers;

SELECT Country,City, CompanyName
FROM Customers
WHERE city='Buenos Aires'
ORDER BY 1;

SELECT DISTINCT CategoryID, SupplierID
FROM Products
ORDER BY 2;





--CUANTOS PUESTOS DIFERENTES TIENEN LOS REPRESENTANTES 
--FUNCIONES DE AGREGAGO 
--LAS FUNCIONES DE AGREGADO SOLO REGESAN UN SOLO REGISTRO Y NON SE PUEDE UTILIZAR UN CAMOOO QUE NO SEA FUNCION DE AGREGADO SI NO UTILIZO UN GRUP BY

SELECT COUNT (DISTINCT Puesto) AS [Numero de Puestos]
FROM representantes;

--SELECCIONAR EL PRECIO MINIMO DE LOS PROFUCTOS 
SELECT MIN(precio) AS [PRECIO MINIMO]
FROM Productos;

--LISTAR LAS OFICINA CUYAS VENTAS ESTAN POR DEBAJO DEL 80% 
--DE SUS OBJETIVOS 

SELECT CIUDAD, VENTAS, OBJETIVO,(.8 * objetivo) AS [80% DEL Objetivo]
FROM OFICINAS
WHERE Ventas < ( 0.8 * objetivo);

--seleccionar los primeros 5 registro de los pedidos

SELECT Num_Pedido,Fecha_Pedido, Producto, Cantidad,Importe
FROM PEDIDOS;

--5 pedidos mas altos
SELECT TOP 5 Num_Pedido,Fecha_Pedido, Producto, Cantidad,Importe
FROM Pedidos
ORDER BY 5 DESC;
--TEST DE RANGO (BETWEEN)
--HALLAR LOS PEDIDOS DEL ULTIMPO TRIMESTRE DE 1989 

SELECT NUM_PEDIDO, FECHA_PEDIDO, FAB, PRODUCTO, IMPORTE
FROM PEDIDOS
WHERE FECHA_PEDIDO BETWEEN '1989-10-01' AND '1989-12-31'
ORDER BY FECHA_PEDIDO DESC;

SELECT NUM_PEDIDO, FECHA_PEDIDO, FAB, PRODUCTO, IMPORTE
FROM PEDIDOS
WHERE FECHA_PEDIDO  >= '1989-10-01' AND FECHA_PEDIDO <= '1989-12-31'
ORDER BY FECHA_PEDIDO DESC;



SELECT NUM_PEDIDO, FECHA_PEDIDO, FAB, PRODUCTO, IMPORTE
FROM PEDIDOS
WHERE DATEPART (QUARTER, FECHA_PEDIDO ) = 4
ORDER BY FECHA_PEDIDO DESC;


-- HALLAR LOS PEDIDOS QUE TIENEN UN IMPORTE ENTRE 30 MIL Y 39999.99



--LISTAR LOS REPRESENTANTES CUYAS VENTAN SE NO ESNCUENTRAN 
--ENTRE EL 80 Y 120 POR CIENTO DE SU CUOTA

SELECT  NUM_EMPL, NOMBRE,CUOTA,VENTAS
FROM REPRESENTANTES
WHERE VENTAS NOT BETWEEN (0.8 * CUOTA) AND (1.20 * COUTA);


--TEST DE PERTENECIA A CONJUNTOS (IN)
--HALLAR LOS PREDIDO SDE CUATRI RERPRESENTANTES EN CONCRETO 

SELECT NUM_PEDIDO, FECHA_PEDIDO, IMPORTE, REP
FROM PEDIDOS
WHERE REP IN (107.109,101,103); 

SELECT NUM_PEDIDO, FECHA_PEDIDO, IMPORTE, REP
FROM PEDIDOS
WHERE REP = 107 OR
	  REP = 109 OR
	  REP = 101 OR
	  REP = 103;

SELECT NUM_PEDIDO, FECHA_PEDIDO, IMPORTE, REP
FROM PEDIDOS
WHERE REP NOT IN (107.109,101,103); 

SELECT NUM_PEDIDO, FECHA_PEDIDO, IMPORTE, REP
FROM PEDIDOS
WHERE NOT ( REP = 107 OR
	  REP = 109 OR
	  REP = 101 OR
	  REP = 103);

--TEST DE ENCAJE DE PATRONES (LOKE)
SELECT *

FROM CLIENTES
WHERE EMPRESA LIKE 'A%';

SELECT *
FROM CLIENTES
WHERE EMPRESA LIKE '%L';


SELECT *
FROM CLIENTES
WHERE EMPRESA LIKE '%ER%';

SELECT *
FROM Clientes
WHERE empresa LIKE '[A-D]%';



SELECT *
FROM Clientes
WHERE empresa LIKE '[ADF]%';

SELECT *
FROM Clientes
WHERE empresa LIKE '_ilas';

SELECT *
FROM Clientes
WHERE empresa LIKE '______';


SELECT *
FROM Clientes
WHERE empresa LIKE '[^ADF]%';

--HALLAR TODOS LOS PREPRESSENTANTES QUE O BIEN:
--A) TRABAJAN EN DAIMIEL, NAVARRA, O CASTELLON; O BIEN 
--B) NO TINEN JEFE Y ESTAN CONTRATADOS DESDE JUNIO DE 1988;O
--C) SUPERAN SU CUOTA PERO TIENEN VENTAS DE 600 MILL O MENOS 
 
 SELECT *
 FROM representantes
 WHERE   Oficina_Rep in (11,12,22)
 or (jefe is null and Fecha_Contrato = '1988-07-01')
 or (ventas > cuota and ventas <=600000);


 SELECT *
 FROM REPRESENTANTES
 WHERE   Oficina_Rep in (11,12,22)
 or (jefe is null and Fecha_Contrato = '1988-06-01')
 or (ventas > cuota and ventas <=600000);

 SELECT R.NUM_EMPLEADO AS [NUMERO EMPLEADO],
		R.NOMBRE AS [NOMBRE EMPLEADO],
		R.FECHA_CONTRADO AS [FECHA DE CONTRATO],
		R.CUOTA AS [COUTA DE VENTAS],
		R.VENTAS AS [VENTAS TOTALES],
		O.CIUDAD AS [CIUDAD DE LA OFICINA],
		R.JEFE AS [NUMERO DE JEFE]
 FROM REPRESENTANTES AS R
 INNER JOIN Oficinas AS O
 ON O.Oficina = R.OFICINA_REP

 WHERE  ( O.CIUDAD in ('DAIMIEL','NAVARRA', 'CASTELLON'))
 or (jefe is null and R.Fecha_Contrato = '1988-06-01')
 or (R.ventas > cuota and R.ventas <=600000);

 USE BDEJEMPLO2
--listar las oficinas con un objetivo superior a 600000,
--mostrar, el nombre de la ciudad, el nombre del representante 
--y su puesto 

SELECT o.Ciudad AS [Oficina],
	   r.Nombre AS [Representante],
	   r.Puesto AS [Puesto],
	   o.Objetivo AS [Objetivo de Ventas]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;

--listar todos los pedidos, mmostrando el numero de pedido, el importe, el nombre 
--y limite de credito del cliete

SELECT pe.Num_Pedido AS [Numero Pedido],
	   pe.Importe AS [Importe],
	   c.Empresa AS [Clinete],
	   c.Limite_Credito AS [Liminte de Credito]

FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli;


SELECT*
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli;

--listar cada representate mostrando su nombre la ciudad y la region en que trabajan

SELECT R.Nombre,
       O.Ciudad,
	   O.Region

FROM Representantes AS R
INNER JOIN Oficinas AS o
ON o.Oficina = R.Oficina_Rep;

--LISTAR LA OFICINAS (CIUDAD), NOMBRES Y PUESTOS DE SUS JEFES

SELECT O.Ciudad,
	   R.Nombre,
	   R.Puesto
FROM Representantes AS R
INNER JOIN Oficinas AS o
ON R.Num_Empl = O.Jef;


--LISTAR LOS PEDIDOS, MOSTRANDO EL NUMERO DE PEDIDO, EL IMPORTE Y
--LA CANTIDAD DE CADA PRODUCTO

SELECT pe.Num_Pedido AS [Numero de Pedido],
	   pe.Importe AS [Importe],
	   pr.Descripcion AS [Descripcion],
	   pr.Stock AS [Cantidad]
FROM Pedidos AS pe
INNER JOIN Productos AS pr
ON pr.Id_fab = pe.Fab AND pr.Id_producto = pe.Producto;

--listar los nombres de los empleados y nombres de jefes
SELECT empl.Nombre AS [Emplado],jefs.Nombre [Jefe]	   
FROM Representantes AS jefs
INNER JOIN Representantes AS empl
ON jefs.Num_Empl = empl.Jefe;

SELECT *FROM Representantes;

--listar los pedidos con un importe superior a 25000, icluyendo el numero del pedido 
--el importe del nombre represenante que tomo nota del pedido y el nombre del cliente

SELECT pe.Num_Pedido AS [Numero de Pedido],
	   pe.Importe AS [Importe],
	   R.Nombre AS [Nombre]

FROM Pedidos AS pe
INNER JOIN Representantes AS r
ON R.Num_Empl = pe.Rep
INNER JOIN Clientes AS c
ON c.Num_Cli = pe.Cliente
WHERE pe.Importe >25000;

--LISTAR LOS PEDIDOS SUPERIORES A 25000
--MOSTRANDO EL NUMERO DE PEDIDO, EL NOMBRE DEL CLIENTE QUE
--LO ENCARGO Y EL NOMBRE DEL REPRESENTANTE ASIGNADO AL CLIENTE,
--Y EL IMPORTE
--ultimos

SELECT p.Num_Pedido AS [Numero del pedido],
	   cl.Empresa AS [Nombre del cliente],
	   p.Importe AS [Importe],
	   r.Nombre
FROM Clientes AS cl
INNER JOIN Pedidos AS p
ON cl.Num_Cli = p.Cliente
INNER JOIN Representantes AS R
ON r.Num_Empl = cl.Rep_Cli
WHERE p.Importe > 25000;
use BDEJEMPLO2
