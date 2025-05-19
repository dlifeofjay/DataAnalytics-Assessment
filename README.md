This assessment tested all area in sql query, data cleaning and aggregation.
the main sql dump was filled with irregularities that needed to be filtered and be cleaned, i removed the backticks, and also unneccessary statements not needed for this assessment.


-- Here Are My Approaches For Each Assessment:
For ASSESSMENT_Q1:
In this particular query, the first SELECT statement defined the layout of the table/query outcome
The second SELECT statement is made to count customers where the IS_REGULAR_SAVINGS COLUMN in PLANS_PLAN TABLE equals 1, which is a binary for YES
The third SELECT statement also counts customers where the IS_A_FUND COLUMN in PLANS_PLAN TABLE equals 1
The fourth SELECT statement sums the CONFIRMED_AMOUNT COLUMN in SAVINGS_SAVINGSACCOUNT TABLE and this gives us the TOTAL_DEPOSIT COLUMN
This query finds customers who have at least one savings plan and one investment count ordered by the total_deposits in descending order

For ASSESSMENT_Q2:
The first SELECT statement counts the total monthly transaction over the years
The second SELECT statement does the average of the monthly transaction
While the third categorizes the average transactions per month and uniquely counts the total customers that belongs to each category

For ASSESSMENT_Q3:
In this query, the CASE statement evaluates both the IS_REGULAR_SAVINGS and IS_A_FUND columns in PLANS_PLAN table. If both columns have values greater than 0, the statement assigns 'Savings' or 'Investment' accordingly to the type column.
The last_transaction_date column is defined using the MAX statement which gives the highest date in the transaction_date column in savings_savingsaccount table.
The inactivity_days is given by finding the difference between the days current date in real time and the last transaction date.

For ASSESSMENT_Q4:
This query does a time difference between the month each customers account was created and the current date in real time
The transaction_reference column was counted as total_transaction for each customer
The fomular given this assessment was used to get Estimated Customer Lifetime Value
Note: Both successfull and failed transactions are counted and used in this query



-- CHALLENGES FACED --
This assessment involves critical and analytical thinking, its not something that should be rushed into as all the assessment requires knowledge and indept practice experience of how relational database is handled


-- CONCLUSION --
 Further more, here is my conclusion based on my analysis of this data:
 --For ASSESSMENT_Q1, An indepth promotional strategy can be carried out to retain existing customers to get multiple the savings and investment plan.
 A predictive machine learning model can be carried out on existing customers who has both plans and this will help in understanding the customer behaviour better.

 --For ASSESSMENT_Q2, Since customers have been categorized into Low, Medium and High Frequency based on their transaction numbers per month.
 Under my analysis, customers with low frequency are much more than the other frequency, having over 60% of total customers. customer check up and offers that is capable of retaining customers engagement can be put into use

 --For ASSESSMENT_Q3, Once the flaging is done, i believe the strategy i put down for ASSESSMENT_Q2 can be put into use for the inactive accounts.

 --For ASSESSMENT_Q4, The higher the total_transaction the higher the estimated_CLV. that means customer engagement is also key in this aspect
