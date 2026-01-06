-- Where mais Is Null e Is Not Null - Filtrando valores nulos
SELECT * FROM DimCustomer
WHERE CompanyName IS NOT NULL -- EMPRESA

SELECT * FROM DimCustomer
WHERE CompanyName IS NULL -- PESSOA FÍSICA