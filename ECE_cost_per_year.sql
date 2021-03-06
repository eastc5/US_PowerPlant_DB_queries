/****** A query to determine the total amount per year spent on emissions control equipment by US power generators   ******/
SELECT [Inservice Year]
      ,sum([Total Cost (Thousand Dollars)]) AS 'Total Cost per Year (Thousand dolars) '
  FROM [US_Powerstations].[dbo].['Emissions Control Equipment$']
  GROUP BY [Inservice Year]
  ORDER BY [Inservice Year] DESC