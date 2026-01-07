-- -Módulo 07 - [SQL Server] Criando agrupamentos no SQL -- #F078 03. Group By (Parte 2)
-- Vamos dizer agora que queremos saber a QTD de funcionários que temos em cada loja

SELECT
	StoreType AS 'nome_da_loja',
	SUM(EmployeeCount) AS 'qtd_funcionarios'
FROM
	DimStore
GROUP BY StoreType

-- Catalog - 120 funcionarios
-- Online - 340 funcionarios 
-- Reseller - 44 funcionarios 
-- Store - 10535 funcionarios 


-- Agora queremos saber a média do custo dos produtos em relação a sua marca

SELECT
	BrandName AS 'nome_da_marca',
	AVG(UnitCost) AS 'media_custo_produto'
FROM
	DimProduct
GROUP BY BrandName

-- Agora queremos saber de acordo com a classe do produto qual o produto mais caro e mais barato

SELECT * FROM DimProduct

SELECT
	ClassName AS 'nome_da_classe',
	MAX(UnitPrice) AS 'produto_mais_caro',
	MIN(UnitPrice) AS 'produto_mais_barato'
FROM
	DimProduct
GROUP BY ClassName