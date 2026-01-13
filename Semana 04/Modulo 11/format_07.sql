-- FORMAT: Formata um valor de acordo com uma formatação 


-- 1. Formatação de número

-- 5123

-- Geral 
SELECT FORMAT(5123, 'G')


-- Número 
SELECT FORMAT(5123, 'N')


-- Moeda
SELECT FORMAT(5123, 'C')


-- 2. Formatação de Data
--23/04/2020

--dd/MM/yyy
SELECT FORMAT(CAST('23/04/2020' AS DATETIME), 'dd/MMMM/yyyy', 'en-us')


-- Dia
SELECT FORMAT(CAST('23/04/2020' AS DATETIME), 'dddd')


-- Mes
SELECT FORMAT(CAST('23/04/2020' AS DATETIME), 'MMMM')


-- Ano
SELECT FORMAT(CAST('23/04/2020' AS DATETIME), 'yyyy')



-- 3. formatação personalizada
-- 1234567 ---> 12-34-567

SELECT FORMAT(1234567, '##-##-###')