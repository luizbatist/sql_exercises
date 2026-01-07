-- Módulo 07 - [SQL Server] Criando agrupamentos no SQL -- #F080 05. Group By mais Where
-- Queremos saber a quantidade total de produtos em relação a cor

SELECT * FROM DimProduct

SELECT
	ColorName AS 'cor_do_produto',
	COUNT(*) AS 'total_de_produtos'
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName

-- Aqui filtramos a cor do produto em relação ao total de produtos, porém somente da marca 'CONTOSO'