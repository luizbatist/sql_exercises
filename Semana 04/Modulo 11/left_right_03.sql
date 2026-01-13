-- LEFT ----> Extrai uma determinada quantidade de caracteres de um texto, da esquerda pra direita	
-- RIGHT ----> Extrai uma determinada quantidade de caracteres de um texto, da direita pra esquerda


-- Faça uma consulta a tabela dimProduct e divida a coluna de Stylename em 2 partes

SELECT LEFT('Product0101001', 7) 
SELECT RIGHT('Product0101001', 7) 

SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'preco',
	LEFT('Product0101001', 7) AS 'cod 1',
	RIGHT('Product0101001', 7) AS 'cod 2'
FROM
	DimProduct