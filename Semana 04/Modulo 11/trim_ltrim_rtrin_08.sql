-- Funções para retirar espaços adicionais dentro de um texto
-- TRIM: retira espaços adicionais a esquerda e a direita do texto
-- LTRIM: retira espaços adicionais a esquerda do texto
-- RTRIM: retira espaços adicionais a direita do texto


-- Utilize a funcao acima no codigo '   ABC123   '

DECLARE @varCodigo VARCHAR(30)
SET @varCodigo = '    ABC123     '

SELECT
	TRIM(@varCodigo) AS 'Trim',
	LTRIM(@varCodigo) AS 'Ltrim',
	RTRIM(@varCodigo) AS 'Rtrim'

SELECT
	DATALENGTH(TRIM(@varCodigo)) AS 'Trim',
	DATALENGTH(LTRIM(@varCodigo)) AS 'Ltrim',
	DATALENGTH(RTRIM(@varCodigo)) AS 'Rtrim'