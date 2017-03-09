/* This query determines the generating technology with the largest name plate capacity for each state */

SELECT DISTINCT [state],[Technology]
FROM US_Powerstations.dbo.Operable$ AS x
Where [Technology] = (
Select TOP (1)[Technology]
FROM [US_Powerstations].[dbo].[Operable$] AS y
WHERE x.State = y.State
GROUP BY Technology
ORDER BY sum([Nameplate Capacity (MW)]) DESC)

