WITH ProductLineSales AS (
    SELECT Customer_type, Product_line, round(SUM(Total),2) AS TotalSales
    FROM walmart_sales GROUP BY Customer_type, Product_line
),
BestProductLine AS (
    SELECT Customer_type, Product_line, TotalSales,
        RANK() OVER (PARTITION BY Customer_type ORDER BY TotalSales DESC) AS Rank1
    FROM ProductLineSales
)
SELECT Customer_type, Product_line AS BestProductLine, TotalSales AS SalesAmount
FROM BestProductLine WHERE Rank1 = 1;
