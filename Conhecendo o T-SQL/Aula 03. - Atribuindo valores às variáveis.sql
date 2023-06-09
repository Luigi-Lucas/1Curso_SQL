
-- Desafio 1: Usando SELECT para atribuir valores

DECLARE @NUMNOTAS INT

SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS]
WHERE [DATA] = '2017-01-01'

PRINT @NUMNOTAS

--=============================================================================================================--

-- Desafio 2: Simplificando a exibição da idade

DECLARE @CPF VARCHAR(15);
DECLARE @DATA_NASCIMENTO DATE;
DECLARE @IDADE INT;

SET @CPF = '1471156710';
SELECT @DATA_NASCIMENTO = [DATA DE NASCIMENTO] FROM [TABELA DE CLIENTES] WHERE CPF = @CPF;
PRINT DATEDIFF(YEAR, @DATA_NASCIMENTO, GETDATE());

--=============================================================================================================--
