-- Utilize as funções DAY, MONTH e YEAR para descobrir o dia, mes e ano da data 18/05/2020

DECLARE @varData DATETIME
SET @varData = '18/05/2020'

SELECT 
	DAY(@varData) AS 'dia',
	MONTH(@varData) AS 'mes',
	YEAR(@varData) AS 'ano'

-- Utilize a funcao DATEFROMPARTS para obter a data a partir das informações dia, mes e ano

DECLARE @varDia INT, @varMes INT, @varAno INT
SET @varDia = 15
SET @varMes = 6
SET @varAno = 2027

SELECT
	DATEFROMPARTS(@varAno, @varMes, @varDia) AS 'Data'