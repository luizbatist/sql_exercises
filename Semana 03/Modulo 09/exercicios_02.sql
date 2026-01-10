-- EXERCÍCIOS -Módulo 09 - [SQL Server] Group By + Joins - Aplicações - #F123 02. Group By mais Inner Join - Exercícios de Fixação


/* Questão 1

a. Faça um resumo da quantidade vendida (Sales Quantity) de acordo
com o nome do canal de vendas (ChannelName). Você deve ordenar
a tabela final de acordo com SalesQuantity, em ordem decrescente.
b. Faça um agrupamento mostrando a quantidade total vendida (Sales
Quantity) e quantidade total devolvida (Return Quantity) de acordo
com o nome das lojas (StoreName).
c. Faça um resumo do valor total vendido (Sales Amount) para cada
mês (CalendarMonthLabel) e ano (CalendarYear). */

SELECT TOP(100) * FROM FactSales
SELECT * FROM DimChannel


-- A.
SELECT
	c.ChannelName AS 'canal_de_vendas',
	SUM(s.SalesQuantity) AS 'total_vendido'
FROM
	FactSales s
LEFT JOIN DimChannel c
	ON s.channelKey = c.ChannelKey
GROUP BY ChannelName
ORDER BY SUM(s.SalesQuantity) DESC

-- B.

SELECT 
	SUM(s.SalesQuantity) AS 'total_vendido',
	SUM(s.ReturnQuantity) AS 'total_devolvido',
	st.StoreName AS 'nome_loja'
FROM 
	FactSales s
LEFT JOIN DimStore st
	ON s.StoreKey = st.StoreKey
GROUP BY st.StoreName

-- C.

SELECT
	SUM(s.SalesAmount) AS 'valor_total',
	d.CalendarMonthLabel AS 'mes',
	d.CalendarYear AS 'ano'
FROM
	FactSales s
LEFT JOIN DimDate d
	ON s.DateKey = d.Datekey
GROUP BY CalendarMonthLabel, CalendarYear, CalendarMonth
ORDER BY CalendarMonth 


/* Questão 2
Você precisa fazer uma análise de vendas por produtos. O objetivo final
é descobrir o valor total vendido (SalesAmount) por produto.


a. Descubra qual é a cor de produto que mais é vendida (de acordo
com SalesQuantity).

b. Quantas cores tiveram uma quantidade vendida acima de 3.000.000. */


SELECT 
	p.ProductName AS 'product_name',
	SUM(s.SalesAmount) AS 'total_price'
FROM 
	DimProduct p
LEFT JOIN FactSales s
	ON s.ProductKey = p.ProductKey
GROUP BY ProductName
ORDER BY SUM(s.SalesAmount) DESC

-- a. Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).
SELECT TOP(1)
	p.ColorName AS 'color_name',
	SUM(s.SalesQuantity) AS 'total_quantity'
FROM
	DimProduct p
LEFT JOIN FactSales s
	ON s.ProductKey = p.ProductKey
GROUP BY ColorName
ORDER BY SUM(s.SalesQuantity) DESC

-- b. Quantas cores tiveram uma quantidade vendida acima de 3.000.000. */
SELECT COUNT(*) AS colors_quantity
FROM(
	SELECT
		p.ColorName,
		SUM(s.SalesQuantity) AS 'total_quantity'
	FROM
		DimProduct p 
	INNER JOIN FactSales s
		ON s.ProductKey = p.ProductKey
	GROUP BY p.ColorName
	HAVING SUM(s.SalesQuantity) > 3000000
) t;


/* Questão 3

Crie um agrupamento de quantidade vendida (SalesQuantity) por
categoria do produto (ProductCategoryName).
Obs: Você precisará fazer mais de 1 INNER JOIN, dado que a relação
entre FactSales e DimProductCategory não é direta. */

SELECT
	SUM(s.SalesQuantity) AS 'sales_quantity',
	c.ProductCategoryName AS 'category_name'
FROM
	FactSales s
INNER JOIN DimProduct p
	ON s.ProductKey = p.ProductKey
INNER JOIN DimProductSubcategory sub
	ON p.ProductSubcategoryKey = sub.ProductSubcategoryKey
INNER JOIN DimProductCategory c
	ON sub.ProductCategoryKey = c.ProductCategoryKey
GROUP BY c.ProductCategoryName
ORDER BY SUM(s.SalesQuantity) DESC

/* Questão 4
a. Você deve fazer uma consulta à tabela FactOnlineSales e descobrir
qual é o nome completo do cliente que mais realizou compras online
(de acordo com a coluna SalesQuantity).

b. Feito isso, faça um agrupamento de produtos e descubra quais
foram os top 10 produtos mais comprados pelo cliente da letra a,
considerando o nome do produto. */ 

-- a. Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

SELECT TOP(5)
	SUM(s.SalesQuantity) AS 'sales_quantity',
	c.FirstName,
	c.LastName,
	c.CustomerKey
FROM
	FactOnlineSales s
INNER JOIN DimCustomer c
	ON s.CustomerKey = c.CustomerKey
WHERE CustomerType = 'Person'
GROUP BY c.FirstName, c.LastName, c.CustomerKey
ORDER BY SUM(s.SalesQuantity) DESC 

-- b. Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a, considerando o nome do produto. 

SELECT TOP(10)
	p.ProductName AS 'product_name',
	SUM(s.SalesQuantity) AS 'sales_quantity'
FROM
	FactOnlineSales s
INNER JOIN DimProduct p 
	ON s.ProductKey = p.ProductKey
WHERE CustomerKey = 7665
GROUP BY p.ProductName
ORDER BY SUM(s.SalesQuantity) DESC

/* Questão 5
Faça um resumo mostrando o total de produtos comprados (Sales
Quantity) de acordo com o sexo dos clientes. */

SELECT
	SUM(s.SalesQuantity) AS 'total_vendido',
	cus.Gender AS 'sexo'
FROM
	FactOnlineSales s 
INNER JOIN DimCustomer cus
	ON s.CustomerKey = cus.CustomerKey
WHERE cus.Gender IS NOT NULL
GROUP BY cus.Gender


/* Questão 6

Faça uma tabela resumo mostrando a taxa de câmbio média de acordo
com cada CurrencyDescription. A tabela final deve conter apenas taxas
entre 10 e 100. */


SELECT
	c.CurrencyDescription AS 'money_description',
	AVG(tax.AverageRate) AS 'average_rate'
FROM
	FactExchangeRate tax
INNER JOIN DimCurrency c
	ON tax.CurrencyKey = c.CurrencyKey
GROUP BY CurrencyDescription
HAVING AVG(tax.AverageRate) BETWEEN 10 AND 100
ORDER BY AVG(tax.AverageRate) DESC
	

/* Questão 7
Descubra o valor total na tabela FactStrategyPlan destinado aos
cenários: Actual e Budget. */


SELECT
	sc.ScenarioName AS 'scenario_name',
	SUM(pl.Amount) AS 'total_price'
FROM
	FactStrategyPlan pl
INNER JOIN DimScenario sc
	ON pl.ScenarioKey = sc.ScenarioKey
GROUP BY ScenarioName
HAVING ScenarioName IN ('Actual', 'Budget')

/* Questão 8
Faça uma tabela resumo mostrando o resultado do planejamento
estratégico (FactStrategyPlan ) por ano. */


SELECT
	SUM(pl.Amount) AS 'total_sales',
	dt.CalendarYearLabel
FROM
	FactStrategyPlan pl
INNER JOIN DimDate dt
	ON pl.Datekey = dt.Datekey
GROUP BY CalendarYearLabel

/* Questão 9

Faça um agrupamento de quantidade de produtos por
ProductSubcategoryName. Leve em consideração em sua análise apenas
a marca Contoso e a cor Silver. */


SELECT
	COUNT(p.ProductName) AS 'product_name',
	sub.ProductSubcategoryName
FROM 
	DimProduct p
INNER JOIN DimProductSubcategory sub
	ON p.ProductSubcategoryKey = sub.ProductSubcategoryKey
GROUP BY ProductSubcategoryName

/* Questão 10
Faça um agrupamento duplo de quantidade de produtos por
BrandName e ProductSubcategoryName. A tabela final deverá ser
ordenada de acordo com a coluna BrandName. */


SELECT
	COUNT(p.ProductName) AS 'total_products',
	p.BrandName AS 'brand_name',
	sub.ProductSubcategoryName AS 'product_subcategory_name'
FROM
	DimProduct p
INNER JOIN DimProductSubcategory sub
	ON p.ProductSubcategoryKey = sub.ProductSubcategoryKey
GROUP BY BrandName,ProductSubcategoryName
ORDER BY brand_name 