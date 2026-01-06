-- #F049 13. Where mais In - Alternativa ao OR com múltiplas condições
SELECT ColorName FROM DimProduct
WHERE ColorName IN ('Silver', 'Blue', 'White', 'Red', 'Black')

SELECT * FROM DimEmployee
WHERE DepartmentName IN ('Production', 'Marketing', 'Engineering')
