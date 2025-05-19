-- Task3: Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days).

SELECT
    p.plan_id,
    p.owner_id,
    CASE
        WHEN p.is_regular_savings > 0 THEN 'Savings'
        WHEN p.is_a_fund > 0 THEN 'Investments'
    END AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM plans_plan p
LEFT JOIN savings_savingsaccount s ON p.owner_id = s.owner_id
WHERE (p.is_regular_savings > 0 OR p.is_a_fund > 0)
GROUP BY p.plan_id, p.owner_id, type
HAVING inactivity_days <= 365;


-- comment --
-- In this query, the CASE statement evaluates both the IS_REGULAR_SAVINGS and IS_A_FUND columns in PLANS_PLAN table....
-- ....If both columns have values greater than 0, the statement assigns 'Savings' or 'Investment' accordingly to the type column.
-- The last_transaction_date column is defined using the MAX statement which gives the highest date in the transaction_date column in savings_savingsaccount table.
-- The inactivity_days is given by finding the difference between the days current date in real time and the last transaction date.