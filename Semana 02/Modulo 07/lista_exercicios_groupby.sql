-- EXERCÍCIOS 
/* Questão 1

a. Faça um resumo da quantidade vendida (SalesQuantity) de acordo
com o canal de vendas (channelkey).
b. Faça um agrupamento mostrando a quantidade total vendida
(SalesQuantity) e quantidade total devolvida (Return Quantity) de
acordo com o ID das lojas (StoreKey).
c. Faça um resumo do valor total vendido (SalesAmount) para cada
canal de venda, mas apenas para o ano de 2007. */

-- Questão A

SELECT 	
	channelKey AS 'canal de venda',
	SUM(SalesQuantity) AS 'qtd vendida'
FROM 
	FactSales
	GROUP BY channelKey

-- Questão B

SELECT 
	StoreKey AS 'id_loja',
	SUM(SalesQuantity) AS 'qtd_vendida',
	SUM(ReturnQuantity) AS 'qtd_devolvida'
FROM
	FactSales
GROUP BY StoreKey;

-- Questão C. Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007. */

SELECT
	SUM(SalesAmount) AS 'total_vendido',
	channelKey AS 'canal_venda'
FROM
	FactSales
WHERE DateKey BETWEEN '20070101' AND '20071231'
GROUP BY channelKey



/* Questão 2

Você precisa fazer uma análise de vendas por produtos. O objetivo final
é descobrir o valor total vendido (SalesAmount) por produto
(ProductKey).
a. A tabela final deverá estar ordenada de acordo com a quantidade
vendida e, além disso, mostrar apenas os produtos que tiveram um
resultado final de vendas maior do que $5.000.000.
b. Faça uma adaptação no exercício anterior e mostre os Top 10
produtos com mais vendas. Desconsidere o filtro de $5.000.000
aplicado. */

SELECT TOP(100) * FROM FACTSALES
-- Questão A
SELECT
	ProductKey AS 'Id Produto',
	SUM(SalesAmount) AS 'Faturamento Total'
FROM
	FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) > 5000000
ORDER BY SUM(SalesAmount) DESC

-- Questão B

SELECT
	TOP(10)
	ProductKey AS 'Id Produto',
	SUM(SalesAmount) AS 'faturamento total'
FROM
	FactSales
GROUP BY ProductKey
ORDER BY SUM(SalesAmount) DESC


/* Questão 3

a. Você deve fazer uma consulta à tabela FactOnlineSales e descobrir
qual é o ID (CustomerKey) do cliente que mais realizou compras
online (de acordo com a coluna SalesQuantity).
b. Feito isso, faça um agrupamento de total vendido (SalesQuantity)
por ID do produto e descubra quais foram os top 3 produtos mais
comprados pelo cliente da letra a).*/

SELECT  TOP(100) * FROM FactOnlineSales


-- Questão A
SELECT
	TOP(1)
	CustomerKey AS 'Id Cliente',
	SUM(SalesQuantity) AS 'Quantidade de Compras'
FROM
	FactOnlineSales
GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC

-- Questão B
SELECT
	ProductKey AS 'Id Produto',
	SUM(SalesQuantity) AS 'Total Vendido'
FROM
	FactOnlineSales
WHERE CustomerKey =  19037
GROUP BY ProductKey
ORDER BY SUM(SalesQuantity) DESC


/* Questão 4

a. Faça um agrupamento e descubra a quantidade total de produtos
por marca.
b. Determine a média do preço unitário (UnitPrice) para cada
ClassName.
c. Faça um agrupamento de cores e descubra o peso total que cada cor
de produto possui. */

SELECT * FROM DimProduct


-- Questão A
SELECT
	BrandName AS 'Nome da Marca',
	COUNT(ProductKey) AS 'ID Produto'
FROM
	DimProduct
GROUP BY BrandName

-- Questão B
SELECT
	AVG(UnitPrice) AS 'Media por Unidade de Preco',
	ClassName AS 'Nome Classe'
FROM
	DimProduct
GROUP BY ClassName

-- Questão C
SELECT
	ColorName AS 'Nome da Cor Produto',
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
GROUP BY ColorName

/* Questão 5

Você deverá descobrir o peso total para cada tipo de produto
(StockTypeName). A tabela final deve considerar apenas a marca
‘Contoso’ e ter os seus valores classificados em ordem decrescente. */


SELECT * FROM DimProduct

SELECT
	StockTypeName AS 'Tipo de Produto',
	SUM(Weight) AS 'Peso produto'
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY SUM(Weight) DESC


/* Questão 6

Você seria capaz de confirmar se todas as marcas dos produtos possuem
à disposição todas as 16 opções de cores? */

SELECT * FROM DimProduct

SELECT 
	 COUNT(DISTINCT ColorName) AS 'Nome da Cor',
	BrandName AS 'Nome da Marca'
FROM
	DimProduct
GROUP BY BrandName

/* Questão 7

Faça um agrupamento para saber o total de clientes de acordo com o
Sexo e também a média salarial de acordo com o Sexo. Corrija qualquer
resultado “inesperado” com os seus conhecimentos em SQL. */

SELECT * FROM DimCustomer

SELECT
	Gender AS 'Genero',
	AVG(YearlyIncome) AS 'Media Salarial por Ano',
	COUNT(Gender) AS 'Qtd Clientes'
FROM
	DimCustomer
WHERE gender IS NOT NULL
GROUP BY Gender

/* Questão 8

Faça um agrupamento para descobrir a quantidade total de clientes e a
média salarial de acordo com o seu nível escolar. Utilize a coluna
Education da tabela DimCustomer para fazer esse agrupamento. */

SELECT * FROM DimCustomer

SELECT 
	COUNT(CustomerKey) AS 'Qtd Cliente',
	AVG(YearlyIncome) AS 'Media por Ano',
	Education AS 'Educacao'
FROM	
	DimCustomer
GROUP BY Education

/* Questão 9

Faça uma tabela resumo mostrando a quantidade total de funcionários
de acordo com o Departamento (DepartmentName). Importante: Você
deverá considerar apenas os funcionários ativos. */

SELECT * FROM DimEmployee

SELECT 
	COUNT(EmployeeKey) AS 'qtd_funcionario',
	DepartmentName AS 'nome_departamento'
FROM
	DimEmployee
WHERE STATUS = 'Current'
GROUP BY DepartmentName

/* Questão 10

Faça uma tabela resumo mostrando o total de VacationHours para cada
cargo (Title). Você deve considerar apenas as mulheres, dos
departamentos de Production, Marketing, Engineering e Finance, para os
funcionários contratados entre os anos de 1999 e 2000. */

SELECT * FROM DimEmployee

SELECT
	SUM(VacationHours) AS 'horas_vocacionais',
	Title AS 'titulo'
FROM
	DimEmployee
WHERE Gender = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') AND HireDate BETWEEN '1999-01-01' AND  '2000-12-31'
GROUP BY Title