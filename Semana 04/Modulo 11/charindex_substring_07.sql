-- CHARINDEX: Descobre a posição de um determinado caractere dentro de um texto
-- SUBSTRING: Extrai alguns caracteres de dentro de um texto

SELECT 'Raquel Moreno' AS 'Nome'

-- Descubra a posição em que começa o sobrenome da Raquel utilizando a função CHARINDEX
SELECT CHARINDEX('Moreno', 'Raquel Moreno') AS 'Posicao caractere'

-- Extraia o sobrenome da 'Raquel'
SELECT SUBSTRING('Raquel Moreno', 8, 6) AS 'Sobrenome'


-- COMBINE as funções CHARINDEX e SUBSTRING para extrair de forma automática qualquer sobrenome
DECLARE @varNome VARCHAR(100)
SET @varNome = 'Lucas Batista'


SELECT SUBSTRING(@varNome, CHARINDEX(' ', @varNome) + 1, 100) AS 'Sobrenome'


