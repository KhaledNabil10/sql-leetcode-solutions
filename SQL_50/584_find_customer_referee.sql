-- Problem: 584. Find Customer Referee
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/find-customer-referee/

SELECT name
FROM customer
WHERE referee_id != 2
   OR referee_id IS NULL;
