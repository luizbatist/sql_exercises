-- -Módulo 06 - [SQL Server] Funções de Agregação -- #F069 06. Função AVG

-- Agora o chefe quer saber a média da renda anual dos clientes, por isso usamos a função AVG

SELECT
	AVG(YearlyIncome) AS 'average_annual_income'
FROM
	DimCustomer

-- A renda anual dos clientes é de $260174,89
