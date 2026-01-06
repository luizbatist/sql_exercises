-- Where mais Like - Filtro especial para textos
SELECT * FROM DimProduct
WHERE ProductName LIKE '%MP3 Player%'

SELECT DISTINCT ProductDescription FROM DimProduct
WHERE ProductDescription LIKE 'Type%'

SELECT DISTINCT ProductDescription FROM DimProduct
WHERE ProductDescription LIKE '%Type'