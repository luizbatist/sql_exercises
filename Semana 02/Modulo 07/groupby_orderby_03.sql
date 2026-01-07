-- -Módulo 07 - [SQL Server] Criando agrupamentos no SQL -- #F079 04. Group By mais Order By
SELECT * FROM DimStore

SELECT
	StoreType AS 'tipo_loja',
	SUM(EmployeeCount) AS 'soma_funcionario'
FROM
	DimStore
GROUP BY StoreType
ORDER BY SUM(EmployeeCount) DESC

-- Aqui usamos o GROUP BY com o ORDER BY e conseguimos ordenar de gorma organizada a soma dos funcionarios e relação ao tipo da loja

