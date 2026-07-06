-- Problem: 570. Managers with at Least 5 Direct Reports
-- Difficulty: Medium
-- Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

SELECT m.name
FROM Employee e
JOIN Employee m
    ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(m.id) >= 5;
