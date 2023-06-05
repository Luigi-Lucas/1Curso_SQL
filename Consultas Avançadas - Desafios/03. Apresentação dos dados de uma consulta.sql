
-- Desafio 1
SELECT * FROM NOTAS_FISCAIS

SELECT TOP 10 * FROM NOTAS_FISCAIS WHERE DATA_VENDA = '2017-10-01';

--=============================================================================================================--

-- Desafio 2
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limao';

--Código do produto: 1101035

SELECT * FROM ITENS_NOTAS_FISCAIS

SELECT TOP 1 * FROM ITENS_NOTAS_FISCAIS WHERE CODIGO_DO_PRODUTO = 1101035 ORDER BY QUANTIDADE DESC

--=============================================================================================================--

-- Desafio 3
SELECT * FROM ITENS_NOTAS_FISCAIS

SELECT COUNT(*) FROM ITENS_NOTAS_FISCAIS WHERE QUANTIDADE = '99' AND CODIGO_DO_PRODUTO = '1101035'

--=============================================================================================================--

-- Desafio 4
SELECT * FROM ITENS_NOTAS_FISCAIS;

SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE_TOTAL 
FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO
ORDER BY SUM(QUANTIDADE) DESC;

--=============================================================================================================--

-- Desafio 5
SELECT * FROM ITENS_NOTAS_FISCAIS;

SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE_TOTAL 
FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO
HAVING SUM(QUANTIDADE) > 394000
ORDER BY SUM(QUANTIDADE) DESC;

--=============================================================================================================--

-- Desafio 6
SELECT * FROM TABELA_DE_CLIENTES

SELECT NOME,
(CASE WHEN LIMITE_DE_CREDITO >= 150000 THEN 'CLIENTE GRANDE'
      WHEN LIMITE_DE_CREDITO >= 110000 AND LIMITE_DE_CREDITO < 150000 THEN 'CLIENTE MÉDIO'
	  ELSE 'CLIENTE PEQUENO' END) AS CLASSIFICACAO
FROM TABELA_DE_CLIENTES;

--=============================================================================================================--
