/* Questão 1

Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7

a) Crie uma nova variável para armazenar o resultado da soma entre
valor1 e valor2. Chame essa variável de soma.
b) Crie uma nova variável para armazenar o resultado da subtração
entre valor3 e valor 4. Chame essa variável de subtracao.
c) Crie uma nova variável para armazenar o resultado da multiplicação
entre o valor 1 e o valor4. Chame essa variável de multiplicacao.
d) Crie uma nova variável para armazenar o resultado da divisão do
valor3 pelo valor4. Chame essa variável de divisao. Obs: O resultado
deverá estar em decimal, e não em inteiro.
Arredonde o resultado da letra d) para 2 casas decimais. */

DECLARE @varValor1 float
SET @varValor1 = 10

DECLARE @varValor2 float
SET @varValor2 = 5

DECLARE @varValor3 float
SET @varValor3 = 34

DECLARE @varValor4 float
SET @varValor4 = 7

-- a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame essa variável de soma.

DECLARE @soma INT
SET @soma = @varValor1 + @varValor2

-- b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4. Chame essa variável de subtracao.

DECLARE @subtracao INT
SET @subtracao = @varValor3 + @varValor4

-- c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o valor4. Chame essa variável de multiplicacao.
DECLARE @multiplicacao FLOAT
SET @multiplicacao = @varValor1 + @varValor4

-- d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.

DECLARE @divisao FLOAT
SET @divisao = @varValor3 / @varValor4

SELECT @soma, @subtracao, @multiplicacao, ROUND(@divisao,2)



/* Questão 2

Para cada declaração das variáveis abaixo, atenção em relação ao tipo
de dado que deverá ser especificado.
a. Declare uma variável chamada ‘produto’ e atribua o valor de
‘Celular’.
b. Declare uma variável chamada ‘quantidade’ e atribua o valor de 12.
c. Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
d. Declare uma variável chamada ‘faturamento’ e atribua o resultado da
multiplicação entre ‘quantidade’ e ‘preco’.
e. Visualize o resultado dessas 4 variáveis em uma única consulta, por
meio do SELECT. */


DECLARE @produto VARCHAR(50)
DECLARE @quantidade INT
DECLARE @preco FLOAT
DECLARE @faturamento FLOAT

SET @produto = 'celular'
SET @quantidade = 12
SET @preco = 9.99
SET @faturamento = @quantidade * @preco

SELECT 
	@produto AS 'Produto',
	@quantidade AS 'Quantidade',
	@preco AS 'Preço',
	@faturamento AS 'Faturamento'


/* Questão 3

Você é responsável por gerenciar um banco de dados onde são
recebidos dados externos de usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui
Você precisará criar um código em SQL capaz de juntar as informações
fornecidas por este usuário. Para simular estes dados, crie 3 variáveis,
chamadas: nome, data_nascimento e num_pets. Você deverá armazenar
os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.
O resultado final a ser alcançado é mostrado no print abaixo:

Dica: você precisará utilizar as funções CAST e FORMAT para chegar no
resultado. */



DECLARE @varNome VARCHAR(30)
DECLARE @varDataNascimento DATETIME
DECLARE @varNumPets INT

SET @varNome = 'André'
SET @varDataNascimento = '10/02/1998'
SET @varNumPets = 2


SELECT 'Meu nome é ' + CAST(@varNome AS VARCHAR(30)) + ', nasci em ' + FORMAT(@varDataNascimento, 'dd/MMMM/yyyy') + ', e tenho ' + CAST(@varNumPets AS VARCHAR(30)) + ' pets.'


/* Questão 4

Você acabou de ser promovido e o seu papel será realizar um controle de
qualidade sobre as lojas da empresa.
A primeira informação que é passada a você é que o ano de 2008 foi bem
complicado para a empresa, pois foi quando duas das principais lojas
fecharam. O seu primeiro desafio é descobrir o nome dessas lojas que
fecharam no ano de 2008, para que você possa entender o motivo e
mapear planos de ação para evitar que outras lojas importantes tomem o
mesmo caminho.
O seu resultado deverá estar estruturado em uma frase, com a seguinte
estrutura:
‘As lojas fechadas no ano de 2008 foram: ’ + nome_das_lojas

Obs: utilize o comando PRINT (e não o SELECT!) para mostrar o resultado. */ 


SELECT
	StoreName,
	CloseDate
FROM
	DimStore
WHERE Status = 'Off'

SELECT
	StoreName,
	CloseDate
FROM
	DimStore
WHERE FORMAT(CloseDate, 'yyyy') = 2008

-- solução

DECLARE @varListaLojas VARCHAR(50)
SET @varListaLojas = ''

SELECT
	@varListaLojas = @varListaLojas + StoreName + ', '
FROM
	DimStore
WHERE FORMAT(CloseDate, 'yyyy') = 2008

PRINT 'As lojas fechadas no ano de 2008 foram: ' + @varListaLojas


/* Questão 5
Você precisa criar uma consulta para mostrar a lista de produtos da tabela
DimProduct para uma subcategoria específica: ‘Lamps’.
Utilize o conceito de variáveis para chegar neste resultado. */


SELECT
	*
FROM
	DimProduct

DECLARE @varIdSubCategoria INT
DECLARE @varNomeSubcategoria VARCHAR(30)

SET @varNomeSubcategoria = 'Lamps'
SET @varIdSubCategoria = (
	SELECT	
		ProductSubcategoryKey
	FROM
		DimProductSubcategory
	WHERE ProductSubcategoryName = @varNomeSubcategoria
)

SELECT 
	*
FROM
	DimProduct
WHERE ProductSubcategoryKey = @varIdSubCategoria



