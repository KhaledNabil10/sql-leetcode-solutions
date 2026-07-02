-- Problem: 1661. Average Time of Process per Machine
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/average-time-of-process-per-machine/

-- ── Approach 1: CTE ──────────────────────────────────────────
-- Separates start and end records into two CTEs for clarity.

WITH cte_start AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'start'
),
cte_end AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
)
SELECT
    c1.machine_id,
    ROUND(AVG(c2.timestamp - c1.timestamp), 3) AS processing_time
FROM cte_start c1
JOIN cte_end c2
    ON  c1.machine_id = c2.machine_id
    AND c1.process_id = c2.process_id
GROUP BY c1.machine_id;

-- ── Approach 2: Self JOIN ─────────────────────────────────────
-- More concise — joins the table with itself to match start/end pairs.

SELECT
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a
JOIN Activity b
    ON  a.machine_id    = b.machine_id
    AND a.process_id    = b.process_id
    AND a.activity_type = 'start'
    AND b.activity_type = 'end'
GROUP BY a.machine_id;
