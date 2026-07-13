SELECT name
FROM sqlite_master
WHERE type='table';

SELECT sql
FROM sqlite_master
WHERE type='table';

--1.Calculeaza vanzarile totale pe regiune

SELECT
    s.Region,
    SUM(t.Quantity*p.UnitPrice) as TotalSales
FROM Transactions t
JOIN  Stores s
on s.StoreID=t.StoreID
join Products p
on p.ProductID=t.ProductID
GROUP BY  Region
ORDER BY  TotalSales desc;

--2.Adaugam profitul pe fiecare regiune si marja procentuala-rotunjita (folosind subquery)

CREATE VIEW vw_RegionSalesSummary AS
SELECT Region,
       TotalSales,
       TotalProfit,
       round(TotalProfit/TotalSales*100,2) as  ProfitMarginPercent
       FROM (
       SELECT s.Region,
                    SUM(t.Quantity * p.UnitPrice)             as TotalSales,
                    sum(t.Quantity * (UnitPrice - CostPrice)) as TotalProfit
             FROM Transactions t
                      JOIN Stores s
                           on s.StoreID = t.StoreID
                      join Products p
                           on p.ProductID = t.ProductID
             GROUP BY Region
             ORDER BY TotalSales desc) AS SUB
ORDER BY TotalSales DESC;

--Testam

select *
from vw_RegionSalesSummary;

--3.Vanzarile pe orase

CREATE VIEW vw_CitySalesSummary AS
SELECT Region,
       City,
       TotalSales,
       TotalProfit,
       round(TotalProfit/TotalSales*100,2) as  ProfitMarginPercent
       FROM (
       SELECT s.Region,
              S.City,
                   round(SUM(t.Quantity * p.UnitPrice)   ,2)          as TotalSales,
                   round(sum(t.Quantity * (UnitPrice - CostPrice)),2) as TotalProfit
             FROM Transactions t
                      JOIN Stores s
                           on s.StoreID = t.StoreID
                      join Products p
                           on p.ProductID = t.ProductID
             GROUP BY Region, City
             ORDER BY TotalSales desc) AS SUB
ORDER BY TotalSales DESC;

--verificare

select *
FROM vw_CitySalesSummary;

--4.Vanzarile pe regiuni si categorie de produse

CREATE VIEW vw_RegionCategorySalesSummary AS
SELECT Region,
       Category,
       TotalSales,
       TotalProfit,
       round(TotalProfit/TotalSales*100,2) as  ProfitMarginPercent
 FROM (
       SELECT s.Region,
              p.Category,
                   round(SUM(t.Quantity * p.UnitPrice)   ,2)          as TotalSales,
                   round(sum(t.Quantity * (UnitPrice - CostPrice)),2) as TotalProfit
             FROM Transactions t
                      JOIN Stores s
                           on s.StoreID = t.StoreID
                      join Products p
                           on p.ProductID = t.ProductID
             GROUP BY Region, Category
             ORDER BY TotalSales desc) AS SUB
ORDER BY TotalSales DESC;

--verificare

select *
FROM vw_RegionCategorySalesSummary;