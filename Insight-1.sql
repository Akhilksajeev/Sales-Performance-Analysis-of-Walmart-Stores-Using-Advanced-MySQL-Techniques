WITH MonthlySales AS (SELECT Branch,
        DATE_FORMAT(STR_TO_DATE(Date1, '%d-%m-%Y'), '%Y-%m') AS Month, 
        SUM(Total) AS MonthlyTotal FROM walmart_sales GROUP BY Branch, Month
),GrowthRateTable AS (SELECT Branch,
        ROUND((MAX(MonthlyTotal) - MIN(MonthlyTotal)) / MIN(MonthlyTotal) * 100, 1) AS GrowthRate 
    FROM MonthlySales GROUP BY Branch)
SELECT Branch, GrowthRate FROM GrowthRateTable
ORDER BY GrowthRate DESC
LIMIT 1;
