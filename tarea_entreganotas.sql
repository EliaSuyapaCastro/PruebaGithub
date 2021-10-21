
-----3
SELECT        dbo.Clientes.CodigoClientes,dbo.Clientes.Nombre, dbo.Rutas.Descripcion as RUTA
FROM            dbo.Clientes INNER JOIN
                         dbo.Rutas ON dbo.Clientes.CodigoRuta = dbo.Rutas.CodigoRuta

----2
SELECT        dbo.Productos.CodigoProducto, dbo.Productos.Descripcion, dbo.Productos.PrecioUnitario,
dbo.Categorias.Descripcion AS Categoria
FROM            dbo.Categorias INNER JOIN
                         dbo.Productos ON dbo.Categorias.CodigoCategoria = dbo.Productos.CodigoCategoria

----5
SELECT        dbo.Ventas.CodigoVentas, dbo.Ventas.ISV, dbo.VentasDetalle.Cantidad, dbo.Productos.PrecioUnitario
FROM            dbo.Productos INNER JOIN
                         dbo.VentasDetalle ON dbo.Productos.CodigoProducto = dbo.VentasDetalle.CodigoProducto CROSS JOIN
                         dbo.Ventas

----4
SELECT        CodigoVentas, Fecha,   YEAR(Fecha) AS ANIO , MONTH(Fecha) AS MES, DAY(Fecha) AS DIA
FROM            dbo.Ventas

----1
SELECT        CodigoEmpleado, CONCAT(Nombres,' ',Apellidos) as Nombre, Fecha_Contratacion, Correo
FROM            dbo.Empleados

-----------otros
SELECT        dbo.Productos.CodigoProducto, dbo.Productos.Descripcion as NombreProducto, dbo.Productos.PrecioUnitario, dbo.Categorias.Descripcion AS NombreCategoria
FROM            dbo.Productos INNER JOIN
                         dbo.Categorias ON dbo.Productos.CodigoCategoria = dbo.Categorias.CodigoCategoria

------------
SELECT        dbo.Clientes.CodigoClientes, dbo.Clientes.Nombre, dbo.Rutas.Descripcion
FROM            dbo.Rutas INNER JOIN
                         dbo.Clientes ON dbo.Rutas.CodigoRuta = dbo.Clientes.CodigoRuta

-------------
SELECT        CodigoVentas AS codigoTiempo, YEAR(Fecha) AS Anio, MONTH(Fecha) AS Mes, Day(Fecha) AS dia
FROM            dbo.Ventas


-------------
SELECT        dbo.Ventas.CodigoVentas, dbo.Ventas.ISV, dbo.ProductoInventario.existencia, dbo.Productos.PrecioUnitario
FROM            dbo.ProductoInventario INNER JOIN
                         dbo.Productos ON dbo.ProductoInventario.codigoProducto = dbo.Productos.CodigoProducto CROSS JOIN
                         dbo.Ventas

----dddd
SELECT        dbo.Ventas.CodigoVentas, dbo.Ventas.ISV, dbo.Productos.PrecioUnitario, dbo.VentasDetalle.Cantidad
FROM            dbo.Productos INNER JOIN
                         dbo.VentasDetalle ON dbo.Productos.CodigoProducto = dbo.VentasDetalle.CodigoProducto CROSS JOIN
                         dbo.Ventas



-----------------------
--------------------------------
------------------------------------tabla de ventash
SELECT        dbo.Clientes.CodigoClientes,
dbo.Empleados.CodigoEmpleado, 
dbo.Productos.CodigoProducto, 
dbo.Ventas.CodigoVentas,
dbo.Ventas.CodigoVentas as Tiempo,
dbo.Ventas.ISV, 
dbo.VentasDetalle.Cantidad,
dbo.VentasDetalle.Cantidad*dbo.VentasDetalle.Precio as Monto
FROM            dbo.Clientes INNER JOIN
                         dbo.Ventas ON dbo.Clientes.CodigoClientes = dbo.Ventas.CodigoCliente INNER JOIN
                         dbo.Empleados ON dbo.Ventas.CodigoEmpleado = dbo.Empleados.CodigoEmpleado INNER JOIN
                         dbo.VentasDetalle ON dbo.Ventas.CodigoVentas = dbo.VentasDetalle.CodigoVentas CROSS JOIN
                         dbo.Productos


---------------procedimiento almacenado
Create procedure [dbo].[limpiarinformacion]
as
Begin
if exists (select*from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='VentasH')
begin
drop table [dbo].[VentasH]

truncate table [dbo].[ClienteDM]
truncate table [dbo].[EmpleadoDM]
truncate table [dbo].[ProductoDM]
truncate table [dbo].[TiempoDM]
end
end

exec [dbo].[limpiarinformacion]