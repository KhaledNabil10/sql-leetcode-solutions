-- Problem: 1633. Percentage of Users Attended a Contest
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/

SELECT
    contest_id,
    ROUND((COUNT(r.user_id) / (SELECT COUNT(*) FROM Users)) * 100, 2) AS percentage
FROM Users u
JOIN Register r
    ON u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;
