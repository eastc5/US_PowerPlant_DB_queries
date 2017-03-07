/* This query calculates how much nameplate capacity of each generating technology type was commissioned each year */

/* Top 121 was used to avoid NULLs in the operating row*/
SELECT TOP (121)
Total.[Operating Year],
/*COALESCE is being used to avoid NULL in the data when nothing was installed that year  */
COALESCE(Gas.[Installed Gas Capacity (MW)],0)AS 'Installed Gas Capacity (MW)',
COALESCE(Coal.[Installed Coal Capacity (MW)],0)AS 'Installed Coal Capacity (MW)',
COALESCE( Solar.[Installed Solar Capacity (MW)],0)AS 'Installed Solar Capacity (MW)',
COALESCE(Total.[Installed Capacity (MW)],0) AS 'Installed Total Capacity (MW)',
COALESCE(Wind.[Installed Wind Capacity (MW)],0) AS 'Installed Wind Capacity (MW)',
COALESCE(Nuclear.[Installed Nuclear Capacity (MW)],0) AS 'Installed Nuclear Capacity (MW)'

FROM (
/* Selecting Gas generating plants installed*/
SELECT [Operating Year],
 COUNT(DISTINCT([Generator ID])) AS 'New Gas Generators this Year',
 ROUND(SUM([Nameplate Capacity (MW)]),0) AS 'Installed Gas Capacity (MW)'
FROM [US_Powerstations].[dbo].[Operable$] 
WHERE [Technology] like '%gas%'
GROUP BY [Operating Year]
) AS "Gas"
/* Using Full Join so that all values are kept*/
FULL JOIN 
(/* Selecting coal generating plants installed*/
SELECT [Operating Year],
 COUNT(DISTINCT([Generator ID])) AS 'New Coal Generators this Year',
 ROUND(SUM([Nameplate Capacity (MW)]),0) AS 'Installed Coal Capacity (MW)'
FROM [US_Powerstations].[dbo].[Operable$] 
WHERE [Technology] like '%Coal%'
GROUP BY [Operating Year]
) AS "Coal"

ON Gas.[Operating Year] = Coal.[Operating Year]

FULL JOIN (
/* Selecting Solar generating plants installed*/
SELECT [Operating Year],
 COUNT(DISTINCT([Generator ID])) AS 'New Solar Generators this Year',
 ROUND(SUM([Nameplate Capacity (MW)]),0) AS 'Installed Solar Capacity (MW)'
FROM [US_Powerstations].[dbo].[Operable$] 
WHERE [Technology] like 'Solar%'
GROUP BY [Operating Year]
) AS "Solar"

ON Gas.[Operating Year] = Solar.[Operating Year]

FULL JOIN(
/* Selecting All generating plants installed to get a total installed capacity for the year*/
SELECT [Operating Year],
 COUNT(DISTINCT([Generator ID])) AS 'New Generators this Year',
 ROUND(SUM([Nameplate Capacity (MW)]),0) AS 'Installed Capacity (MW)'
FROM [US_Powerstations].[dbo].[Operable$] 
GROUP BY [Operating Year]
) AS "Total"

ON Gas.[Operating Year] = Total.[Operating Year]

FULL JOIN (

/* Selecting wind generating plants installed*/
SELECT [Operating Year],
 COUNT(DISTINCT([Generator ID])) AS 'New Wind Generators this Year',
 ROUND(SUM([Nameplate Capacity (MW)]),0) AS 'Installed Wind Capacity (MW)'
FROM [US_Powerstations].[dbo].[Operable$] 
WHERE [Technology] like '%Wind%'
GROUP BY [Operating Year]
) AS "Wind"

ON Gas.[Operating Year] = Wind.[Operating Year]

FULL JOIN (

/* Selecting Nuclear generating plants installed*/
SELECT [Operating Year],
 COUNT(DISTINCT([Generator ID])) AS 'New Nuclear Generators this Year',
 ROUND(SUM([Nameplate Capacity (MW)]),0) AS 'Installed Nuclear Capacity (MW)'
FROM [US_Powerstations].[dbo].[Operable$] 
WHERE [Technology] like '%Nuclear%'
GROUP BY [Operating Year]
) AS "Nuclear"

ON Gas.[Operating Year] = Nuclear.[Operating Year]


ORDER BY Total.[Operating Year] DESC