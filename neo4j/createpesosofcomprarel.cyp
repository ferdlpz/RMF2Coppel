USING PERIODIC COMMIT 1 LOAD CSV WITH HEADERS FROM 'file:///transaccional.csv' AS csvline FIELDTERMINATOR '|'
WITH csvline
WHERE csvline.PROD_AREA IN ["Ropa", "Muebles"] 
MATCH (c:Cliente{id_cte:toInteger(csvline.ID_CTE)})
MATCH (prod:ProdClase{id_prodclase:1000000*(CASE csvline.PROD_AREA WHEN 'Muebles' THEN 2  WHEN 'Ropa' THEN 1 ELSE 3 END)+ 100000*toInteger(csvline.PROD_DEP)+1000*toInteger(csvline.PROD_CLAS)+toInteger(csvline.PROD_FAM)})
WITH csvline,c,prod
MATCH (c)-[r:COMPRO_CLASE]->(prod)
SET r.peso = r.peso + 1
return max(r.peso),min(r.peso); 