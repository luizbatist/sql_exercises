-- -Módulo 07 - [SQL Server] Criando agrupamentos no SQL -- #F081 06. Group By mais Having
-- Agrupamento do total de produtos por marca

SELECT * FROM DimProduct

SELECT
	BrandName AS 'Nome da Marca', -- Aqui selecionamos a coluna de BrandName e renomeamos
	COUNT(BrandName) AS 'Total por Marca' -- Aqui estamos contando quantos produtos cada marca tem
FROM
	DimProduct
GROUP BY BrandName -- Criamos um grupo para cada marca 
HAVING COUNT(BrandName) >= 200 -- Depois de agrupar por marca filtre as marcas que tem 200 ou mais produtos