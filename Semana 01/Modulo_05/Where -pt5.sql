-- Selecione todas as linhas da tabela dimProduct onde a cor do produto pode ser igual a preto ou vermelho, mas a marca deve ser obrigatoriamente igual a fabrikam

SELECT * FROM DimProduct
WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam' 