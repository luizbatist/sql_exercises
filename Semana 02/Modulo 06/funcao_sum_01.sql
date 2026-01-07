-- -Módulo 06 - [SQL Server] Funções de Agregação -- #F065 02. Função SUM

SELECT
	TOP(100) *
FROM
	FactSales

SELECT
	SUM(SalesQuantity) AS 'total_sold',
	SUM(ReturnQuantity) as 'total_returned'
FROM
	FactSales

-- A quantidade de produtos vendida foi de 53.320.454