/****** This simple SQL query gives the percentage of total US electricity nameplate capacity of each technology type ******/
SELECT DISTINCT (Technology),ROUND(sum([Nameplate Capacity (MW)])*100 / (SELECT SUM([Nameplate Capacity (MW)]) 
FROM [US_Powerstations].[dbo].[Operable$]),2) AS 'Total Capacity (%)'
  FROM [US_Powerstations].[dbo].[Operable$]
 
  GROUP BY Technology
 
  