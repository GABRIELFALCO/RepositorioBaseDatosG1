--CONSULTAS AVANZADAS 

--HALLAR TODOS LOS PREPRESSENTANTES QUE O BIEN:
--A) TRABAJAN EN DAIMIEL, NAVARRA, O CASTELLON; O BIEN 
--B) NO TINEN JEFE Y ESTAN CONTRATADOS DESDE JUNIO DE 1988;O
--C) SUPERAN SU CUOTA PERO TIENEN VENTAS DE 600 MILL O MENOS 

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

 --listar todos los pedidos mostrando el numero de pedido
 --su importe y el nombre y limite de credito del clinete

 SELECT p.Num_Pedido as [Numero de pedido],
		Importe as [Importe total],
		Nombre as [Nombre de pedido],

 FROM Pedidos AS P
 INNER JOIN Clientes
 on c.num_Cli

SELECT *
FROM Clientes;