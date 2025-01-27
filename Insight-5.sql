WITH PaymentStats AS (
    SELECT City, Payment, COUNT(*) AS PaymentCount FROM walmart_sales
    GROUP BY City, Payment
),
MostPopularPayment AS (
    SELECT City, Payment, PaymentCount,
        RANK() OVER (PARTITION BY City ORDER BY PaymentCount DESC) AS Rank1 FROM PaymentStats
)
SELECT City, Payment AS MostPopularPaymentMethod, PaymentCount AS TransactionCount
FROM MostPopularPayment
WHERE Rank1 = 1;
