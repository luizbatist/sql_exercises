-- TRANSLATE e STUFF: Outras funções de substituição

-- TRANSLATE: Substitui cada caractere na ordem encontrada no texto

SELECT TRANSLATE('10.248/444.123k23/1', './k', '---')


-- STUFF: Substitui qualquer texto com uma quantidade de caracteres limitados, por um outro texto

SELECT STUFF('VBA impressionador',	1, 3, 'Excel')