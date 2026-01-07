-- -Módulo 06 - [SQL Server] Funções de Agregação -- #F068 05. Funções MIN e MAX
-- Vamos dizer que meu chefe queira saber o produto mais caro e o mais barato da empresa

SELECT
	MAX(UnitPrice) AS 'maximum_unit_price',
	MIN(UnitPrice) AS 'minimum_unit_price'
FROM
	DimProduct

-- O produto mais caro custa 3199,99 e o mais barato é 0,95