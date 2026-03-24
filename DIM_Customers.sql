-- Cleansed DIM_Customer Table

SELECT c.customerkey AS CustomerKey
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
      , c.FirstName AS [FirstName]
      --,[MiddleName]
      , c.LastName AS [LastName]
      -- Combined First and Last Name
      , c.FirstName + ' ' + lastname AS [FullName]
      --,[NameStyle]
      --,[BirthDate]
      --,[MaritalStatus]
      --,[Suffix]
      ,CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS [Gender]
      --,[EmailAddress]
      --,[YearlyIncome]
      --,[TotalChildren]
      --,[NumberChildrenAtHome]
      --,[EnglishEducation]
      --,[SpanishEducation]
      --,[FrenchEducation]
      --,[EnglishOccupation]
      --,[SpanishOccupation]
      --,[FrenchOccupation]
      --,[HouseOwnerFlag]
      --,[NumberCarsOwned]
      --,[AddressLine1]
      --,[AddressLine2]
      --,[Phone]
      ,c.DateFirstPurchase AS DateFirstPurchase
      --,[CommuteDistance]
      ,g.city AS [Customer City]
  FROM 
    [AdventureWorksDW2025].[dbo].[DimCustomer] as c
    -- Join Customer City from DimGeography Table
    LEFT JOIN dbo.DimGeography AS g ON g.GeographyKey = c.GeographyKey
    -- Ordered List by CustomerKey in Ascending Order
    ORDER BY
        CustomerKey ASC
