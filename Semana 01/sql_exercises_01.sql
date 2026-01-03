/* =========================================================
EXERCÍCIOS SQL — CONTOSO
Autor: Henrique
Objetivo: Praticar SQL com foco em análise de dados,
          explorando consultas básicas de validação,
          seleção, renomeação, ordenação e investigação.
========================================================= */

/* ---------------------------------------------------------
1) CONTROLE DE PRODUTOS E CLIENTES

Você é responsável por controlar os dados de clientes e de
produtos da sua empresa.

O que você precisará fazer é confirmar se:

a) Existem 2.517 produtos cadastrados na base de dados.
   Caso esse número não seja confirmado, será necessário
   reportar ao gestor para verificar se existe alguma
   defasagem no controle dos produtos.

b) Até o mês passado, a empresa possuía um total de
   19.500 clientes cadastrados na base de controle.
   Verifique se esse número aumentou ou reduziu.
--------------------------------------------------------- */

/* Query 1a
Verificar se existem exatamente 2.517 produtos cadastrados
na tabela DimProduct.
*/
SELECT 
	*
FROM
	DimProduct
-- Resultado: existem 2.517 produtos cadastrados na base.


/* Query 1b
Verificar a quantidade atual de clientes cadastrados na
tabela DimCustomer e comparar com o total de 19.500
clientes informado até o mês passado.
*/
SELECT
	*
FROM
	DimCustomer
-- Resultado: o número de clientes reduziu para 18.869.


/* ---------------------------------------------------------
2) MARKETING — DESCONTO NO ANIVERSÁRIO

Você trabalha no setor de marketing da empresa Contoso e
teve a ideia de oferecer descontos especiais para os
clientes no dia de seus aniversários.

Para isso, será necessário listar todos os clientes,
suas respectivas datas de nascimento e um contato.

a) Selecione as colunas:
   - CustomerKey
   - FirstName
   - EmailAddress
   - BirthDate
   da tabela DimCustomer.

b) Renomeie as colunas selecionadas utilizando alias
   (comando AS).
--------------------------------------------------------- */

/* Query 2a
Selecionar as colunas CustomerKey, FirstName, EmailAddress
e BirthDate da tabela DimCustomer.
*/
SELECT
	CustomerKey,
	FirstName,
	EmailAddress,
	BirthDate
FROM
	DimCustomer;


/* Query 2b
Renomear as colunas selecionadas utilizando alias (AS),
deixando os nomes mais claros e amigáveis.
*/
SELECT
	CustomerKey AS 'Chave do Cliente',
	FirstName AS 'Primeiro Nome',
	EmailAddress AS 'Email',
	BirthDate AS 'Data de Aniversário'
FROM
	DimCustomer;


/* ---------------------------------------------------------
3) ANIVERSÁRIO DE 10 ANOS — PREMIAÇÃO PARA CLIENTES

A empresa Contoso está comemorando 10 anos desde a sua
inauguração e decidiu realizar uma ação de premiação para
os clientes mais antigos.

Você foi alocado para executar essa ação e deverá realizar
as seguintes tarefas:

a) A Contoso decidiu presentear os primeiros 100 clientes
   da sua história com um vale-compras de R$ 10.000.
   Retorne os primeiros 100 clientes da tabela DimCustomer,
   selecionando todas as colunas.

b) A Contoso decidiu presentear os primeiros 20% dos
   clientes da sua história com um vale-compras de R$ 2.000.
   Utilize um comando SQL para retornar 10% das linhas da
   tabela DimCustomer, selecionando todas as colunas.

c) Adapte o código do item (a) para retornar apenas as
   100 primeiras linhas, mas selecionando somente as
   colunas FirstName, EmailAddress e BirthDate.

d) Renomeie as colunas selecionadas no item (c) para
   nomes em português.
--------------------------------------------------------- */

/* Query 3a
Retornar os primeiros 100 clientes da tabela DimCustomer,
selecionando todas as colunas.
*/
SELECT
	TOP (100)
	*
FROM
	DimCustomer;


/* Query 3b
Retornar 10% das linhas da tabela DimCustomer, selecionando
todas as colunas.
*/
SELECT
	TOP (20) PERCENT
	*
FROM
	DimCustomer;


/* Query 3c
Retornar as 100 primeiras linhas da tabela DimCustomer,
selecionando apenas as colunas FirstName, EmailAddress
e BirthDate.
*/
SELECT
	TOP (100)
	FirstName,
	EmailAddress,
	BirthDate
FROM
	DimCustomer;


/* Query 3d
Renomear as colunas do item anterior para nomes em
português.
*/
SELECT
	TOP (100)
	FirstName AS 'Primeiro Nome',
	EmailAddress AS 'Email',
	BirthDate AS 'Data de Aniversário'
FROM
	DimCustomer;


/* ---------------------------------------------------------
4) COMPRAS — CONTATO COM FORNECEDORES

A empresa Contoso precisa entrar em contato com os
fornecedores de produtos para realizar a reposição de
estoque.

Você faz parte da área de compras e precisa descobrir
quem são esses fornecedores.

Utilize um comando SQL para retornar apenas os nomes dos
fornecedores registrados na tabela DimProduct e renomeie
a coluna resultante.
--------------------------------------------------------- */

/* Query 4
Retornar os nomes dos fornecedores distintos presentes na
tabela DimProduct.
*/
SELECT
	DISTINCT Manufacturer AS Fornecedores
FROM
	DimProduct;


/* ---------------------------------------------------------
5) INVESTIGAÇÃO — PRODUTO NUNCA VENDIDO

O seu trabalho de investigação não para.

Você precisa descobrir se existe algum produto registrado
na base de produtos que ainda não tenha sido vendido.

Observação:
- Caso exista algum produto que nunca tenha sido vendido,
  não é necessário identificar qual.
- Basta verificar se existe ou não essa situação.
--------------------------------------------------------- */

/* Query 5
Verificar se existem produtos cadastrados que aparecem na
base de vendas.
*/
SELECT
	DISTINCT ProductKey
FROM
	FactSales;
