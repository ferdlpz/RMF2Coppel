CREATE  TABLE  CENIC.ANALYTICS.ANTONIO_MRF2_DemograficosSample001 AS (
SELECT * 
    from CENIC.ANALYTICS.ANTONIO_MRF2_Demograficos 
    where Sampling <= 0.01
)



CREATE  TABLE  CENIC.ANALYTICS.ANTONIO_MRF2_DemograficosSample010 AS (
SELECT * 
    from CENIC.ANALYTICS.ANTONIO_MRF2_Demograficos 
    where Sampling <= 0.1
)

CREATE  TABLE  CENIC.ANALYTICS.ANTONIO_MRF2_TransaccionalSample001 AS (
SELECT t.* 
   FROM ANALITICAAFORE.ADMIN.TRANSACCIONES_SISTEMA_REC as t 
   INNER JOIN CENIC.ANALYTICS.ANTONIO_MRF2_DemograficosSample001 as dem
   on t.ID_CTE = dem.ID_CTE
  ) DISTRIBUTE ON  (ID_CTE) 
  
  
  CREATE  TABLE  CENIC.ANALYTICS.ANTONIO_MRF2_TransaccionalSample010 AS (
SELECT t.* 
   FROM ANALITICAAFORE.ADMIN.TRANSACCIONES_SISTEMA_REC as t 
   INNER JOIN CENIC.ANALYTICS.ANTONIO_MRF2_DemograficosSample010 as dem
   on t.ID_CTE = dem.ID_CTE
  ) DISTRIBUTE ON  (ID_CTE) 
  
  
