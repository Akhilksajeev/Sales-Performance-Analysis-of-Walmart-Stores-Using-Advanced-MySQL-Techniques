SELECT 
    DAYNAME(STR_TO_DATE(Date1, '%d-%m-%Y')) AS DayOfWeek, -- Convert the date to the day of the week
    round(SUM(Total),2) AS TotalSales
FROM walmart_sales
GROUP BY DayOfWeek
ORDER BY TotalSales DESC;
