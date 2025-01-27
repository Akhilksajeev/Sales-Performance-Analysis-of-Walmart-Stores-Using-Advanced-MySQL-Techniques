WITH ProductStats AS (
    SELECT Product_line, round(AVG(Total),2) AS AvgSales
    FROM walmart_sales GROUP BY Product_line
)
SELECT w.Invoice_ID, w.Product_line, w.Total, ps.AvgSales,
    CASE 
        WHEN w.Total > ps.AvgSales * 1.5 THEN 'High Anomaly' 
        WHEN w.Total < ps.AvgSales * 0.5 THEN 'Low Anomaly' 
        ELSE 'Normal'
    END AS AnomalyStatus
FROM walmart_sales w JOIN ProductStats ps ON w.Product_line = ps.Product_line;
