
-- Desafio 1: n�mero de notas para diversos dias

DECLARE @DATAINICIAL DATE, @DATAFINAL DATE, @NUMERONOTAS INT

SET @DATAINICIAL = '20170101'
SET @DATAFINAL = '20170110'

WHILE (@DATAINICIAL <= @DATAFINAL) 
BEGIN
SELECT @NUMERONOTAS = COUNT(*) FROM [NOTAS FISCAIS] WHERE DATA = @DATAINICIAL
PRINT CONVERT(VARCHAR(20), @DATAINICIAL) + ' N�mero de Notas: ' + CONVERT(VARCHAR(10), @NUMERONOTAS)
SELECT @DATAINICIAL = DATEADD(DAY, 1, @DATAINICIAL)
END;

--=============================================================================================================--

-- Desafio 2: escreva a sequ�ncia de FIBONACCI
DECLARE @NUMERO_ANTERIOR2 INT;
DECLARE @NUMERO_ANTERIOR1 INT;
DECLARE @NUMERO_ATUAL INT;
DECLARE @SEQUENCIA INT;
DECLARE @LIMITE_MAXIMO INT;
DECLARE @CONTADOR_SEQUENCIA INT;

SET @SEQUENCIA = 44;
SET @CONTADOR_SEQUENCIA = 3;

SET @NUMERO_ANTERIOR2 = 0;
SET @NUMERO_ANTERIOR1 = 1;
PRINT 'POSI��O 1 --> 0';
PRINT 'POSI��O 2 --> 1';
WHILE @CONTADOR_SEQUENCIA <= @SEQUENCIA
BEGIN
   SET @NUMERO_ATUAL = @NUMERO_ANTERIOR2 + @NUMERO_ANTERIOR1;
   PRINT 'POSI��O ' + TRIM(STR(@CONTADOR_SEQUENCIA,10,0)) + ' --> ' + TRIM(STR(@NUMERO_ATUAL, 10,0));
   SET  @NUMERO_ANTERIOR2 = @NUMERO_ANTERIOR1;
   SET @NUMERO_ANTERIOR1 = @NUMERO_ATUAL;
   SET @CONTADOR_SEQUENCIA = @CONTADOR_SEQUENCIA + 1;
END;

--=============================================================================================================--

-- Desafio 3: n�mero de notas salvas em uma tabela
CREATE TABLE TABELAS_NOTAS (DATA DATE, [NUMERO DE NOTAS] INT)

DECLARE @DATAINICIAL DATE, @DATAFINAL DATE, @NUMERONOTAS INT

SET @DATAINICIAL = '20170101'
SET @DATAFINAL = '20170110'

WHILE (@DATAINICIAL <= @DATAFINAL) 
BEGIN
SELECT @NUMERONOTAS = COUNT(*) FROM [NOTAS FISCAIS] WHERE DATA = @DATAINICIAL
INSERT INTO TABELAS_NOTAS VALUES (@DATAINICIAL, @NUMERONOTAS)
SELECT @DATAINICIAL = DATEADD(DAY, 1, @DATAINICIAL)
END;

SELECT * FROM TABELAS_NOTAS

--=============================================================================================================--
