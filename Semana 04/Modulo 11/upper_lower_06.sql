-- UPPER: Transforma um texto em maiúscula
-- LOWER: Transforma um texto em minúsculo

---Faça uma consulta a tabela dimCustomer e utilize a função UPPER e LOWER na coluna firstname para observar o resultado 


SELECT
	FirstName AS 'Nome',
	UPPER(FirstName) AS 'NOME',
	LOWER(FirstName) AS 'nome',
	LastName as 'Sobrenome',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer