-- Data Lemur challenges

-- Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
-- Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.
--Assumption:
-- There are no duplicates in the candidates table.

SELECT a.candidate_id
FROM
(SELECT candidate_id, skill
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')) a
GROUP BY a.candidate_id
HAVING COUNT(candidate_id) > 2;


-- Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
-- In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

SELECT a.total_tweets tweet_bucket, COUNT(a.total_tweets) as user_num
FROM
(
SELECT COUNT(tweet_id) as total_tweets, user_id
FROM tweets
WHERE tweet_date > '12/31/2021'
GROUP BY user_id

) a
GROUP BY total_tweets;

-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.
SELECT page_id
FROM pages
WHERE page_id NOT IN (SELECT page_id FROM page_likes)
ORDER BY page_id;


-- Tesla is investigating production bottlenecks and they need your help to extract the relevant data. Write a query to determine which parts have begun the assembly process but are not yet finished.
-- Assumptions:
-- parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
-- An unfinished part is one that lacks a finish_date.
-- This question is straightforward, so let's approach it with simplicity in both thinking and solution.
-- Effective April 11th 2023, the problem statement and assumptions were updated to enhance clarity.