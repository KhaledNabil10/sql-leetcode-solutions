-- Problem: 1211. Queries Quality and Percentage
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/queries-quality-and-percentage/

SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(query_name)) * 100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
