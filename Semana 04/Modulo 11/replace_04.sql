-- REPLACE: substituium determinado texto por outro texto
-- No texto 'O Excel é o melhor', substitua 'Excel' por 'SQL'

SELECT REPLACE('O Excel é o melhor', 'Excel', 'SQL')



-- Crie uma consulta a partir de DimCustomer onde você retorna o nome completo dos clientes, a coluna de sexo (Abrev) e uma outra de sexo substituindo M por masculino e F por feminino 

SELECT
	Firstname AS 'nome',
	Lastname AS 'sobrenome',
	Gender AS 'sexo',
	REPLACE(REPLACE(Gender , 'M', 'Masculino'), 'F', 'Feminino') AS 'Sexo'
FROM
	DimCustomer
