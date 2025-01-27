WITH CustomerSpending AS ( SELECT Customer_ID, round(SUM(Total),2) AS TotalSpending
    FROM walmart_sales
    GROUP BY Customer_ID
)
SELECT Customer_ID, TotalSpending,
    CASE 
        WHEN TotalSpending < 20556 THEN 'Low Spender'  -- Less than $20,556
        WHEN TotalSpending BETWEEN 20556 AND 23456 THEN 'Medium Spender'  -- Between $20,556 and $23,456
        ELSE 'High Spender'  -- More than $23,456
    END AS SpendingCategory
FROM CustomerSpending;
