WITH ProductLineProfit AS (
SELECT Branch, Product_line, round(sum(total - COGS),2) AS Profit 
    FROM walmart_sales GROUP BY Branch, Product_line
)
SELECT Branch, Product_Line, Profit FROM ProductLineProfit
WHERE (Branch, Profit) IN (
    SELECT Branch, MAX(Profit) AS MaxProfit
    FROM ProductLineProfit GROUP BY Branch
)ORDER BY Branch;