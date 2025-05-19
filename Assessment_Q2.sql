-- Task2: Calculate the average number of transactions per customer per month and categorize them:
-- "High Frequency" (≥10 transactions/month)
-- "Medium Frequency" (3-9 transactions/month)
-- "Low Frequency" (≤2 transactions/month)


WITH monthly_transactions AS (
    SELECT 
        owner_id,
        YEAR(transaction_date) AS year,
        MONTH(transaction_date) AS month,
        COUNT(*) AS monthly_transaction
    FROM savings_savingsaccount
    GROUP BY owner_id, YEAR(transaction_date), MONTH(transaction_date)
),
customer_avg AS (
    SELECT 
        owner_id,
        ROUND(COALESCE(AVG(monthly_transaction), 0), 1) AS avg_transaction_per_month
    FROM monthly_transactions
    GROUP BY owner_id
)
SELECT 
    CASE
        WHEN avg_transaction_per_month >= 10 THEN 'High_Frequency'
        WHEN avg_transaction_per_month BETWEEN 3 AND 9 THEN 'Medium_Frequency'
        ELSE 'Low_Frequency'
    END AS frequency_category,
    COUNT(owner_id) AS customer_count,
    ROUND(AVG(avg_transaction_per_month), 1) AS avg_transaction_per_month
FROM customer_avg
GROUP BY frequency_category;


-- comment --
-- The first SELECT statement counts the total monthly transaction over the years
-- The second SELECT statement does the average of the monthly transaction
-- While the third categorizes the average transactions per month and uniquely counts the total customers that belongs to each category



