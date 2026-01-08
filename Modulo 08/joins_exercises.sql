-- Lista de exercícios - JOIN
/* Questão 1

Utilize o INNER JOIN para trazer os nomes das subcategorias dos
produtos, da tabela DimProductSubcategory para a tabela DimProduct. */

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory

SELECT
	ProductKey,
	ProductName,
	dimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


/*Questão 2

Identifique uma coluna em comum entre as tabelas
DimProductSubcategory e DimProductCategory. Utilize essa coluna
para complementar informações na tabela DimProductSubcategory a
partir da DimProductCategory. Utilize o LEFT JOIN.*/


SELECT 
	p.ProductSubcategoryKey,
	p.ProductSubcategoryName,
	p.ProductSubcategoryDescription,
	p.ProductCategoryKey,
	c.ProductCategoryName
FROM
	DimProductSubcategory p
LEFT JOIN DimProductCategory c
	ON p.ProductCategoryKey = c.ProductCategoryKey

/* Questão 3

Para cada loja da tabela DimStore, descubra qual o Continente e o Nome
do País associados (de acordo com DimGeography). Seu SELECT final
deve conter apenas as seguintes colunas: StoreKey, StoreName,
EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT
JOIN neste exercício. */


SELECT
	d.StoreKey, 
	d.StoreName,
	d.EmployeeCount, 
	g.ContinentName,
	g.RegionCountryName
FROM
	DimStore d
LEFT JOIN DimGeography g
	ON d.GeographyKey = g.GeographyKey

/* Questão 4

Complementa a tabela DimProduct com a informação de
ProductCategoryDescription. Utilize o LEFT JOIN e retorne em seu
SELECT apenas as 5 colunas que considerar mais relevantes. */

SELECT
	p.ProductKey,
	p.ProductName,
	s.ProductSubcategoryName,
	c.ProductCategoryName,
	c.ProductCategoryDescription
FROM
	DimProduct p
LEFT JOIN DimProductSubcategory s
	ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
LEFT JOIN DimProductCategory c
	ON s.ProductCategoryKey = c.ProductCategoryKey

/* Questão 5

A tabela FactStrategyPlan resume o planejamento estratégico da
empresa. Cada linha representa um montante destinado a uma
determinada AccountKey.
a. Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para
reconhecer a tabela.

b. Faça um INNER JOIN para criar uma tabela contendo o
AccountName para cada AccountKey da tabela FactStrategyPlan. O
seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• AccountName
• Amount */


SELECT 
	TOP(100)
	f.StrategyPlanKey,
	f.Datekey,
	a.AccountName,
	f.Amount
FROM
	FactStrategyPlan f
INNER JOIN DimAccount a
	ON f.AccountKey = a.AccountKey

	/* Questão 6

Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna
AccountKey que identifica o tipo de conta, há também uma outra coluna
chamada ScenarioKey. Essa coluna possui a numeração que identifica o
tipo de cenário: Real, Orçado e Previsão.
Faça um INNER JOIN para criar uma tabela contendo o ScenarioName
para cada ScenarioKey da tabela FactStrategyPlan. O seu SELECT final
deve conter as colunas:
• StrategyPlanKey
• DateKey
• ScenarioName
• Amount */


SELECT
	f.StrategyPlanKey,
	f.DateKey,
	s.ScenarioName,
	f.Amount
FROM
	FactStrategyPlan f
INNER JOIN DimScenario s
	ON f.ScenarioKey = s.ScenarioKey

	/* Questão 7

Algumas subcategorias não possuem nenhum exemplar de produto.
Identifique que subcategorias são essas. */

SELECT 
	p.ProductName,
	s.ProductSubcategoryName
FROM
	DimProduct p
RIGHT JOIN DimProductSubcategory s
	ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
WHERE p.ProductName IS NULL

/* Questão 8
A tabela abaixo mostra
a combinação entre Marca
e Canal de Venda,
para as marcas Contoso
, Fabrikam
e Litware
. Crie um código SQL para
chegar no mesmo resultado */

SELECT 
	DISTINCT p.BrandName,
	c.ChannelName
FROM
	DimProduct  p CROSS JOIN DimChannel c
WHERE BrandName IN ('Fabrikam', 'Contoso', 'Litware')

/* Questão 9

Neste exercício, você deverá relacionar as tabelas FactOnlineSales com
DimPromotion. Identifique a coluna que as duas tabelas têm em comum
e utilize-a para criar esse relacionamento.
Retorne uma tabela contendo as seguintes colunas:
• OnlineSalesKey
• DateKey
• PromotionName
• SalesAmount

A sua consulta deve considerar apenas as linhas de vendas referentes a
produtos com desconto (PromotionName <> ‘No Discount’). Além
disso, você deverá ordenar essa tabela de acordo com a coluna
DateKey, em ordem crescente. */

SELECT TOP(1000) 
	OnlineSalesKey,
	DateKey,
	PromotionName,
	SalesAmount
FROM
	FactOnlineSales
INNER JOIN DimPromotion
ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
WHERE PromotionName <> 'No Discount'
ORDER BY DateKey ASC 

/* Questão 10

A tabela abaixo é resultado de um Join entre a tabela FactSales e as
tabelas: DimChannel, DimStore e DimProduct.
Recrie esta consulta e classifique em ordem crescente de acordo com
SalesAmount. */

SELECT TOP(100)
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
FROM
	FactSales
INNER JOIN DimChannel 
	ON FactSales.channelKey = DimChannel.ChannelKey
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey