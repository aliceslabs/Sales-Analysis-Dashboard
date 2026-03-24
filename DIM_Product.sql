-- Cleansed DIM_Product Table

SELECT 
       p.[ProductKey]
      ,p.[ProductAlternateKey] AS ProductItemCode
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,p.[EnglishProductName] AS [Product Name]
      ,ps.EnglishProductSubcategoryName AS [Sub Category]
      ,pc.EnglishProductCategoryName AS [Product Category]
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      ,p.[Color] AS [Product Colour]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      ,p.[Size] AS [Product Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,p.[ProductLine] AS [Product Line]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,p.[ModelName] AS [Product Model Name]
      --,[LargePhoto]
      ,p.[EnglishDescription] AS [Product Description]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      -- Clean Null Statuses
      ,ISNULL (p.[Status], 'Outdated') AS [Product Status]
  FROM 
    [AdventureWorksDW2025].[dbo].[DimProduct] as p
    -- Join Sub Category from DimProductSubcategory Table
    LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
    -- Join Category from DimProductCategory Table
    LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
-- Order by ProductKey in ascending order
  ORDER BY
    p.ProductKey ASC
