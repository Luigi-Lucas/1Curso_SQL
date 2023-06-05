-- Desafio 1
SELECT NOME, CHARINDEX(' ', NOME, 1) FROM TABELA_DE_CLIENTES;

SELECT NOME, SUBSTRING(NOME, 1, CHARINDEX(' ', NOME, 1)) AS PRIMEIRO_NOME FROM TABELA_DE_CLIENTES;

--=============================================================================================================--

-- Desafio 2
SELECT * FROM TABELA_DE_CLIENTES

SELECT NOME + ' ==> ' + 
'Dia: ' + DATENAME(DAY, DATA_DE_NASCIMENTO) + ', ' +
'Dia da semana: ' + DATENAME(WEEKDAY, DATA_DE_NASCIMENTO) + ', ' +
'Mês: ' + DATENAME(MONTH, DATA_DE_NASCIMENTO) + ', ' +
'Ano: ' + DATENAME(YEAR, DATA_DE_NASCIMENTO) AS DATA_POR_EXTENSO
FROM TABELA_DE_CLIENTES;

--=============================================================================================================--

-- Desafio 3
SELECT * FROM NOTAS_FISCAIS;
SELECT * FROM ITENS_NOTAS_FISCAIS;

SELECT YEAR(DATA_VENDA) AS ANO, FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF 
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);

--=============================================================================================================--

-- Desafio 4
SELECT * FROM NOTAS_FISCAIS

SELECT 'O cliente ' + TC.NOME + ' Comprou R$ ' + 
TRIM(STR(SUM(INF.QUANTIDADE * INF.PRECO) ,10,2)) + 
' no ano de ' + DATENAME(YEAR, NF.DATA_VENDA) AS COMPRAS_DE_2016
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF 
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON NF.CPF = TC.CPF
WHERE YEAR(NF.DATA_VENDA) = '2016'
GROUP BY TC.NOME, NF.DATA_VENDA;

--=============================================================================================================--
