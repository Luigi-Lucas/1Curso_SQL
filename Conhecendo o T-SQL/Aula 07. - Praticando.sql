
-- Desafio 1: listando todos os produtos

DECLARE @CODIGO VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_PRODUTOS INT;
DECLARE @I INT;
SELECT @NUMERO_PRODUTOS = COUNT(*) FROM [TABELA DE PRODUTOS];
SET @I = 1;
WHILE @I <= @NUMERO_PRODUTOS
BEGIN
        SELECT @CODIGO = X.[CODIGO DO PRODUTO], @NOME = X.[NOME DO PRODUTO]
        FROM ( SELECT Row_Number() Over (Order By [CODIGO DO PRODUTO]) as RowNum, * FROM [TABELA DE PRODUTOS]) X
        WHERE X.RowNum = @I;
        PRINT @CODIGO + ' - ' + @NOME;
        SET @I = @I + 1;
END;

--=============================================================================================================--

-- Desafio 2: calculando as vendas dos produtos

DECLARE @CODIGO VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_PRODUTOS INT;
DECLARE @I INT;
DECLARE @TOTAL FLOAT;
DECLARE @MES INT, @ANO INT;

SET @MES = 1
SET @ANO = 2015;
SET @I = 1;

SELECT @NUMERO_PRODUTOS = COUNT(*) FROM [TABELA DE PRODUTOS];

WHILE @I < @NUMERO_PRODUTOS
BEGIN 
	SELECT @CODIGO = X.[CODIGO DO PRODUTO], @NOME = X.[NOME DO PRODUTO]
	FROM ( SELECT Row_Number() Over (Order By [CODIGO DO PRODUTO]) as RowNum, * from [TABELA DE PRODUTOS]) X
	WHERE X.RowNum = @I;

	SELECT @TOTAL = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PREÇO]) 
	FROM [NOTAS FISCAIS]
	INNER JOIN [ITENS NOTAS FISCAIS] 
	ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
	WHERE [ITENS NOTAS FISCAIS].[CODIGO DO PRODUTO] = @CODIGO
	AND YEAR([NOTAS FISCAIS].DATA) = @ANO AND MONTH([NOTAS FISCAIS].DATA) = @MES;

	PRINT 'Vendas para o produto ' + @CODIGO + ' de nome: ' + @NOME + ', no mês ' + CONVERT(VARCHAR(2), @MES) + ' e ano ' + CONVERT(VARCHAR(4), @ANO) + ' foi de ' + TRIM(STR(15, 2, @TOTAL));
	SET @I = @I + 1
END;

--=============================================================================================================--
