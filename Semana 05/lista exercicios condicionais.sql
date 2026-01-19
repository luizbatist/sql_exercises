/* MÓDULO 11: EXERCÍCIOS 
1. O setor de vendas decidiu aplicar um desconto aos produtos de acordo com a sua classe. O 
percentual aplicado deverá ser de: 
Economy -> 5% 
Regular -> 7% 
Deluxe -> 9% 
a) Faça uma consulta à tabela DimProduct que retorne as seguintes colunas: ProductKey, 
ProductName, e outras duas colunas que deverão retornar o % de Desconto e UnitPrice com 
desconto.   
b) Faça uma adaptação no código para que os % de desconto de 5%, 7% e 9% sejam facilmente 
modificados (dica: utilize variáveis).  */

SELECT * FROM DimProduct


-- a) Faça uma consulta à tabela DimProduct que retorne as seguintes colunas: ProductKey, ProductName, e outras duas colunas que deverão retornar o % de Desconto e UnitPrice com desconto
SELECT
	ProductKey,
	ProductName,
	CASE 
		WHEN ClassName = 'Economy' THEN (1 - 0.05) * UnitPrice
		WHEN ClassName = 'Regular' THEN (1 - 0.07) * UnitPrice
		WHEN ClassName = 'Deluxe' THEN (1 - 0.09) * UnitPrice
		ELSE 0
	END AS 'Valor Desconto'
FROM DimProduct


-- b) Faça uma adaptação no código para que os % de desconto de 5%, 7% e 9% sejam facilmente modificados (dica: utilize variáveis).

DECLARE @varEconomy FLOAT, @varRegular FLOAT, @varDeluxe FLOAT
SET @varEconomy = 0.05
SET @varRegular = 0.07
SET @varDeluxe = 0.09

SELECT
	ProductKey,
	ProductName,
	CASE 
		WHEN ClassName = 'Economy' THEN (1 - @varEconomy) * UnitPrice
		WHEN ClassName = 'Regular' THEN (1 - @varRegular) * UnitPrice
		WHEN ClassName = 'Deluxe' THEN (1 - @varDeluxe) * UnitPrice
		ELSE 0
	END AS 'Valor Desconto'
FROM DimProduct

/* 2. Você ficou responsável pelo controle de produtos da empresa e deverá fazer uma análise da 
quantidade de produtos por Marca. 
A divisão das marcas em categorias deverá ser a seguinte: 
CATEGORIA A: Mais de 500 produtos  
CATEGORIA B: Entre 100 e 500 produtos  
CATEGORIA C: Menos de 100 produtos  
Faça uma consulta à tabela DimProduct e retorne uma tabela com um agrupamento de Total de 
Produtos por Marca, além da coluna de Categoria, conforme a regra acima. 
*/

DECLARE @varCategoriaA VARCHAR(300), @varCategoriaB VARCHAR(300), @varCategoriaC VARCHAR(300)
SET @varCategoriaA = 'CATEGORIA A: Mais de 500 produtos'
SET @varCategoriaB = 'CATEGORIA B: Entre 100 e 500 produtos' 
SET @varCategoriaC = 'CATEGORIA C: Menos de 100 produtos'

SELECT
	BrandName,
	COUNT(ProductName) AS 'qtd_produtos',
	CASE
		WHEN COUNT(ProductName) > 500 THEN @varCategoriaA
		WHEN COUNT(ProductName) BETWEEN 100 AND 500 THEN @varCategoriaB
		ELSE @varCategoriaC
	END AS 'Categoria'
FROM
	DimProduct
GROUP BY BrandName


/* 3. Será necessário criar uma categorização de cada loja da empresa considerando a quantidade de 
funcionários de cada uma. A lógica a ser seguida será a lógica abaixo: 
EmployeeCount >= 50; 'Acima de 50 funcionários' 
EmployeeCount >= 40; 'Entre 40 e 50 funcionários' 
EmployeeCount >= 30; 'Entre 30 e 40 funcionários' 
EmployeeCount >= 20; 'Entre 20 e 30 funcionários' 
EmployeeCount >= 40; 'Entre 10 e 20 funcionários' 
Caso contrário: 'Abaixo de 10 funcionários' 
Faça uma consulta à tabela DimStore que retorne as seguintes informações: StoreName, 
EmployeeCount e a coluna de categoria, seguindo a regra acima. 
 */

SELECT 
	StoreName,
	EmployeeCount,
	CASE
		WHEN EmployeeCount  >= 50 THEN 'Categoria A - Acima de 50 Funcionarios'
		WHEN EmployeeCount BETWEEN 40 AND 50 THEN 'Categoria B - Entre 40 e 50 Funcionarios'
		WHEN EmployeeCount BETWEEN 20 AND 30 THEN 'Categoria C - Entre 20 e 30 Funcionarios'
		WHEN EmployeeCount BETWEEN 10 AND 20 THEN 'Categoria D - Entre 10 e 20 Funcionarios'
		ELSE 'Categoria E - Abaixo de 10 Funcionarios'
	END
FROM
	DimStore
ORDER BY EmployeeCount DESC


/* 4. O setor de logística deverá realizar um transporte de carga dos produtos que estão no depósito 
de Seattle para o depósito de Sunnyside.  
Não se tem muitas informações sobre os produtos que estão no depósito, apenas se sabe que 
existem 100 exemplares de cada Subcategoria. Ou seja, 100 laptops, 100 câmeras digitais, 100 
ventiladores, e assim vai. 

O gerente de logística definiu que os produtos serão transportados por duas rotas distintas. Além 
disso, a divisão dos produtos em cada uma das rotas será feita de acordo com as subcategorias (ou 
seja, todos os produtos de uma mesma subcategoria serão transportados pela mesma rota): 

Rota 1: As subcategorias que tiverem uma soma total menor que 1000 kg deverão ser 
transportados pela Rota 1. 

Rota 2: As subcategorias que tiverem uma soma total maior ou igual a 1000 kg deverão ser 
transportados pela Rota 2. 

Você deverá realizar uma consulta à tabela DimProduct e fazer essa divisão das subcategorias por 
cada rota. Algumas dicas: - Dica 1: A sua consulta deverá ter um total de 3 colunas: Nome da Subcategoria, Peso Total e Rota. - Dica 2: Como não se sabe quais produtos existem no depósito, apenas que existem 100 

exemplares de cada subcategoria, você deverá descobrir o peso médio de cada subcategoria e 
multiplicar essa média por 100, de forma que você descubra aproximadamente qual é o peso total 
dos produtos por subcategoria. - Dica 3: Sua resposta final deverá ter um JOIN e um GROUP BY. */

SELECT * FROM DimProductSubcategory
SELECT ProductSubcategoryKey, Weight FROM DimProduct WHERE ProductSubcategoryKey = 17

SELECT
	dps.ProductSubcategoryName,
	SUM(dp.Weight) AS 'Total Weight',
	CASE
		WHEN SUM(dp.Weight) < 1000 THEN 'Rota 1'
		ELSE 'Rota 2'
	END,
	CASE 
		WHEN SUM(ISNULL(dp.Weight,0)) = 0 THEN 'Peso Desconhecido'
		ELSE 'Peso Informado'
	END AS Status_Peso
FROM
	DimProductSubcategory dps
RIGHT JOIN DimProduct dp
	ON dps.ProductSubcategoryKey = dp.ProductSubcategoryKey
GROUP BY dps.ProductSubcategoryName
ORDER BY SUM(dp.Weight) DESC


/* 5. O setor de marketing está com algumas ideias de ações para alavancar as vendas em 2021. Uma 
delas consiste em realizar sorteios entre os clientes da empresa.  
Este sorteio será dividido em categorias: 
‘Sorteio Mãe do Ano’: Nessa categoria vão participar todas as mulheres com filhos. 
‘Sorteio Pai do Ano’: Nessa categoria vão participar todos os pais com filhos. 
‘Caminhão de Prêmios’: Nessa categoria vão participar todas os demais clientes (homens e 
mulheres sem filhos). 
Seu papel será realizar uma consulta à tabela DimCustomer e retornar 3 colunas: - FirstName AS ‘Nome’ - Gender AS ‘Sexo’ - TotalChildren AS ‘Qtd. Filhos’ - EmailAdress AS ‘E-mail’ - Ação de Marketing: nessa coluna você deverá dividir os clientes de acordo com as categorias 
‘Sorteio Mãe do Ano’, ‘Sorteio Pai do Ano’ e ‘Caminhão de Prêmios’.  */

SELECT * FROM DimCustomer

SELECT
	FirstName AS 'Nome',
	Gender AS 'Sexo',
	TotalChildren AS 'Qtd Filhos',
	EmailAddress AS 'E-mail',
	CASE
		WHEN GENDER = 'F' AND TotalChildren >= 1 THEN 'Sorteio Mãe do Ano'
		WHEN GENDER = 'M' AND TotalChildren >= 1 THEN 'Sorteio Pai do Ano'
		ELSE 'Caminhão de Prêmios'
	END 'Ação de Marketing'
FROM
	DimCustomer

/* 6. Descubra qual é a loja que possui o maior tempo de atividade (em dias). Você deverá fazer essa 
consulta na tabela DimStore, e considerar a coluna OpenDate como referência para esse cálculo. 
Atenção: lembre-se que existem lojas que foram fechadas. */



SELECT
	StoreName,
	OpenDate,
	CASE
		WHEN CloseDate IS NULL THEN DATEDIFF(DAY, OpenDate, GETDATE())
		ELSE DATEDIFF(DAY, OpenDate, CloseDate)
	END AS 'Dias de Atividade'
FROM
	DimStore
ORDER BY 'Dias de Atividade' DESC






















