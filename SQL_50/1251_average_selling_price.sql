-- Problem: 1251. Average Selling Price
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/average-selling-price/

SELECT
    p.product_id,
    ROUND(IFNULL(SUM(price * units) / SUM(units), 0), 2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON  p.product_id   = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
