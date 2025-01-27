WITH CustomerTransactions AS (
    SELECT Customer_ID, STR_TO_DATE(Date1, '%d-%m-%Y') AS TransactionDate
    FROM walmart_sales
), RepeatCustomers AS (
    SELECT c1.Customer_ID, COUNT(*) AS RepeatCount FROM CustomerTransactions c1
    JOIN CustomerTransactions c2
    ON c1.Customer_ID = c2.Customer_ID 
       AND c1.TransactionDate < c2.TransactionDate 
       AND DATEDIFF(c2.TransactionDate, c1.TransactionDate) <= 30 -- Check if within 30 days
    GROUP BY c1.Customer_ID
)
SELECT Customer_ID, RepeatCount FROM RepeatCustomers
WHERE RepeatCount > 0 ORDER BY RepeatCount DESC;
