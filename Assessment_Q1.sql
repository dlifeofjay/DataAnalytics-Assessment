-- Task 1: Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.

SELECT 
    u.owner_id, 
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    savings.savings_count,
    investments.investment_count,
    ROUND(deposits.total_deposits, 2) AS total_deposits
FROM users_customuser u
LEFT JOIN (
    SELECT owner_id, COUNT(*) AS savings_count 
    FROM plans_plan 
    WHERE is_regular_savings = 1 
    GROUP BY owner_id
) AS savings ON u.owner_id = savings.owner_id
LEFT JOIN (
    SELECT owner_id, COUNT(*) AS investment_count 
    FROM plans_plan 
    WHERE is_a_fund = 1 
    GROUP BY owner_id
) AS investments ON u.owner_id = investments.owner_id
LEFT JOIN (
    SELECT owner_id, SUM(confirmed_amount) AS total_deposits 
    FROM savings_savingsaccount 
    GROUP BY owner_id
) AS deposits ON u.owner_id = deposits.owner_id
WHERE savings.savings_count >= 1 
AND investments.investment_count >= 1
ORDER BY deposits.total_deposits DESC;


-- COMMENT --
-- In this particular query, the first SELECT statement defined the layout of the table/query outcome
-- The second SELECT statement is made to count customers where the IS_REGULAR_SAVINGS COLUMN in PLANS_PLAN TABLE equals 1, which is a binary for YES
-- The third SELECT statement also counts customers where the IS_A_FUND COLUMN in PLANS_PLAN TABLE equals 1
-- The fourth SELECT statement sums the CONFIRMED_AMOUNT COLUMN in SAVINGS_SAVINGSACCOUNT TABLE and this gives us the TOTAL_DEPOSIT COLUMN
-- This query finds customers who have at least one savings plan and one investment count ordered by the total_deposits in descending order

