-- Quantos produtos tem o preço unitário maior que 1000?
SELECT 
	ProductName AS 'Produto',
	UnitPrice AS 'Preço'
FROM 
	DimProduct
WHERE UnitPrice >= 1000