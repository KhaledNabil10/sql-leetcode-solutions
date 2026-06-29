-- Problem: 1683. Invalid Tweets
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/invalid-tweets/

SELECT tweet_id
FROM tweets
WHERE CHAR_LENGTH(content) > 15;
