-- -Módulo 06 - [SQL Server] Funções de Agregação -- #F066 03. Função COUNT
SELECT * FROM DimProduct

SELECT
	COUNT(ProductName)  AS 'total_products'
FROM
	DimProduct

-- A diferença de SUM para COUNT é que a função SUM irá somar os valores de uma coluna, já o COUNT irá contar quantos valores tem uma COLUNA