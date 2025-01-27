SELECT Customer_ID, round(SUM(Total),2) AS TotalSales
FROM walmart_sales
GROUP BY Customer_ID
ORDER BY TotalSales DESC
LIMIT 5;
