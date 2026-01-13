-- LEN e DATALENGTH retorna a quantidade de caracteres de uma palavra
-- Descubra a quantidade de caracteres da palavra 'SQL Hashtag'

SELECT
	LEN('SQL Hashtag   ') AS 'Len',
	DATALENGTH('SQL Hashtag   ') AS 'Datalength'

-- Datalength conta até os espaços o LEN ignora e conta somente os números