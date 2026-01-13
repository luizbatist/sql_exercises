-- A função CONCAT permite juntar dois ou mais textos em um só.

-- Faça uma consultaa tabela dimcostumer onde seja possível visualizar o nome completo de cada cliente

SELECT
	Firstname AS 'Nome',
	Lastname AS 'Sobrenome',
	CONCAT(Firstname, ' ', Lastname) AS 'nome completo',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer

