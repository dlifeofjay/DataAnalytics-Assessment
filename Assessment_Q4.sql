-- Task4: For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate:
-- Account tenure (months since signup)
-- Total transactions
-- Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction)
-- Order by estimated CLV from highest to lowest



SELECT 
    u.owner_id,
    CONCAT(u.first_name,' ',u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, MIN(s.created_on), CURDATE()) AS tenure_months,
    COUNT(s.transaction_reference) AS total_transactions,
    ROUND((COUNT(s.transaction_reference) / TIMESTAMPDIFF(MONTH, MIN(s.created_on), CURDATE())) * 12 * AVG(s.confirmed_amount * 0.001), 2) AS estimated_CLV
FROM users_customuser u
RIGHT JOIN savings_savingsaccount s
on s.owner_id = u.owner_id
GROUP BY u.owner_id
ORDER BY estimated_CLV DESC;

-- COMMENT --
-- This query does a time difference between the month each customers account was created and the current date in real time
-- the transaction_reference column was counted as total_transaction for each customer
-- the fomular given this assessment was used to get Estimated Customer Lifetime Value
-- note: Both successfull and failed transactions is counted and used in this query
