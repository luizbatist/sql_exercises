--- Exercícios de fixação: AND, OR e NOT

-- 1. Selecione todas as linhas da tabela dimEmployee de funcionários do sexo feminino e do departamento de finanças.   

SELECT * FROM DimEmployee
WHERE Gender = 'F' AND DepartmentName = 'Finance'

-- 2. Selecione todas as linhas da tabela dimProduct de produtos da marca Contoso e da cor vermelha e que tenham unitprice maior ou igual  a $100

SELECT 
	Brandname, 
	ColorName, 
	UnitPrice 
FROM 
	DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Red' AND UnitPrice >= 1000

-- 3. Selecione todas as linhas da tabela dimProduct com produtos da marca Litware ou da marca Fabrikam ou da cor preta.

SELECT * FROM DimProduct
WHERE BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'
 

-- 4. Selecione todas as linhas da tabela dimSalesTerritory onde o continente é a Europa mas o país não é igual a Itália.

SELECT * FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'Europe' AND NOT SalesTerritoryCountry = 'Italy'
 
