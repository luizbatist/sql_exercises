-- GETDATE: Retorna a data/hora atual do sistema
--SYSDATETIME: Retorna a data/hora atual do sistema (mais preciso que a GETDATE)
--DATENAME E DATEPART: Retornam informações(dia, mes, ano, semana etc) de uma data


SELECT GETDATE()
SELECT SYSDATETIME()

--DATENAME EM FORMATO DE TEXTO
DECLARE @varData DATETIME
SET @varData = GETDATE()

SELECT
	DATENAME(DAY, @varData),
	DATENAME(MONTH, @varData),
	DATENAME(YEAR, @varData),
	DATENAME(DAYOFYEAR, @varData)

--DATEPART EM FORMATO DE NUMERO 
SELECT
	DATEPART(DAY, @varData),
	DATEPART(MONTH, @varData),
	DATEPART(YEAR, @varData),
	DATEPART(DAYOFYEAR, @varData)