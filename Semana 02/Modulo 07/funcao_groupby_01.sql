-- -Módulo 07 - [SQL Server] Criando agrupamentos no SQL -- #F077 02. Group By (Parte 1)
-- COUNT(*) sem GROUP BY retorna o total de linhas da tabela. Com GROUP BY BrandName, passamos a contar quantos produtos existem por marca, tornando o resultado detalhado.

SELECT
	BrandName AS 'nome_da_marca',
	COUNT(*) AS 'total_produtos'
FROM
	DimProduct
	GROUP BY BrandName