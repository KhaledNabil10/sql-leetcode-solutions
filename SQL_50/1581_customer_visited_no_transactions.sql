-- Problem: 1581. Customer Who Visited but Did Not Make Any Transactions
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/

SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits
WHERE visit_id NOT IN (
    SELECT visit_id
    FROM Transactions
)
GROUP BY customer_id;
