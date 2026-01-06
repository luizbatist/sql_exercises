-- Filtrando dados com WHERE, aonde a marca é igual o fabricante
SELECT * FROM DimProduct
WHERE BrandName = 'Fabrikam'

SELECT * FROM DimProduct
WHERE ColorName = 'Black'

-- USANDO OPERADORES LÓGICOS AND, OR, NOT

SELECT * FROM DimProduct
WHERE BrandName = 'Fabrikam' AND ColorName = 'Black'

SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' OR ColorName = 'White'

SELECT * FROM DimEmployee
WHERE NOT DepartmentName = 'Marketing'