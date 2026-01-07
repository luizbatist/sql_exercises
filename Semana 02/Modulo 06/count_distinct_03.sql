-- -Módulo 06 - [SQL Server] Funções de Agregação -- #F067 04. Função COUNT mais DISTINCT

-- Vamos dizer que meu chefe queira saber quantas cores eu tenho na minha tabela de produtos, por isso vamos combinar a função COUNT com DISTINCT

SELECT
	COUNT(DISTINCT ColorName) AS 'color_name'
FROM
	DimProduct

-- Descobrimos que tenhos 16 cores distintas na tabela de cores, porém se não usassemos o DISTINCT iria countar todas as cores que iriam se repetir.