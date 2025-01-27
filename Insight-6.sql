WITH MonthlySalesByGender AS (
    SELECT DATE_FORMAT(STR_TO_DATE(Date1, '%d-%m-%Y'), '%Y-%m') AS Month, 
        Gender,round(SUM(Total),2) AS TotalSales
    FROM walmart_sales
    GROUP BY Month, Gender
)
SELECT Month, Gender, TotalSales
FROM MonthlySalesByGender
ORDER BY Month, Gender;
