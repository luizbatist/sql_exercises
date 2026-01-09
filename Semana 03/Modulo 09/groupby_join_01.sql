-- GROUP BY + JOIN
-- 1. A) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear).
-- 2. B) Considere apenas o mês (CalendarMonthLabel) de 'January'.
-- 3. C) Na tabela resultante, mostre apenas os anos com um total de vendas maior ou igual a de 1200000

SELECT TOP(100) * FROM FactSales
SELECT * FROM DimDate

SELECT
	d.CalendarYear AS 'Data',
	SUM(s.SalesQuantity) AS 'Total Vendido'
FROM
	FactSales s
INNER JOIN DimDate d
	ON s.DateKey = d.Datekey
WHERE CalendarMonthLabel = 'January'
GROUP BY CalendarYear
HAVING SUM(s.SalesQuantity) > 1200000