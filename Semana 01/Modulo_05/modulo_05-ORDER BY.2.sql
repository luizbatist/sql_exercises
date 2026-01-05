---- Exemplo 3: Selecione as 10 primeiras linhas da tabela dimProduct e ordene de acordo com as coluna de UnitCost (DESC) e Weight (ASC)

SELECT 
	TOP(10) ProductName,
	UnitCost,
	Weight
FROM 
	DimProduct
ORDER BY UnitCost DESC, Weight DESC

-- Ordendando os 10 primeiros produtos da tabela DimProducts, filtrando as colunas unitcost (custo por unidade) e weight (peso). Ordendando por ordem decrescente.