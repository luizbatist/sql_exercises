-- Comando Select... From: Retorna todas as linhas da tabela, independente das colunas selecionadas
SELECT
	*
FROM
	DimEmployee

SELECT
	FirstName, 
	EmailAddress
FROM
	DimEmployee

-- Comandos SELECT TOP(N) e TOP(N) PERCENT: Retornar o número (N) de linhas

-- 1. Crie um programa que retorna as 10 primeiras linhas da tabela de produtos

SELECT
TOP(10)
	*
FROM
	DimProduct

-- 2. Retorna as 10% primeiras linhas da tabela de Clientes

SELECT
TOP(10) PERCENT
	*
FROM
	DimCustomer

-- Comando SELECT DISTINCT: Retorna os valores distintos de uma tabela

-- 3. Retorne todas as linhas da tabela de Produto

SELECT
	*
FROM
	DimProduct

-- 4. Retorne os valores distintos da coluna ColorName da tabela DimProduct
SELECT
	DISTINCT ColorName
FROM
	DimProduct

-- Comando AS: Renomeando colunas

-- 4. Selecione as 3 colunas da tabela dimProduct: ProductName, BrandName e ColorName
SELECT
	ProductName AS 'Nome do Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct