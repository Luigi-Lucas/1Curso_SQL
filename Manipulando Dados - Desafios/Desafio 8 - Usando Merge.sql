
MERGE INTO CLIENTES A
USING VENDEDORES B
ON A.BAIRRO = B.BAIRRO
WHEN MATCHED THEN  
UPDATE SET A.VOLUME_COMPRA = VOLUME_COMPRA * 1.3;

SELECT * FROM CLIENTES