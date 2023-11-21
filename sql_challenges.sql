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

SELECT part, assembly_step 
FROM parts_assembly
WHERE finish_date IS NULL;

-- Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.
-- Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.
-- Effective 15 April 2023, the solution has been updated with a more concise and easy-to-understand approach.
SELECT
SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) as laptop_views,
(SUM(CASE WHEN device_type = 'tablet' THEN 1 ELSE 0 END) +
SUM(CASE WHEN device_type = 'phone' THEN 1 ELSE 0 END)) as mobile_views

FROM viewership;

-- Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.
SELECT 
	user_id, 
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id)>1;

-- Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.
SELECT
sender_id,
COUNT(message_id) AS count
FROM messages
WHERE DATE_PART('year', sent_date::DATE) = 2022 
AND
DATE_PART('month', sent_date::DATE) = 8
GROUP BY sender_id
ORDER BY count DESC
LIMIT 2;

-- Assume you're given a table containing job postings from various companies on the LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.
-- Definition:
-- Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.

SELECT COUNT(*)
FROM(
SELECT 
company_id,
title,
description,
COUNT(company_id) duplicates
FROM job_listings
GROUP BY company_id, title, description
HAVING COUNT(company_id) > 1
) a;

-- Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
-- Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. Output the city name and the corresponding number of completed trade orders.
SELECT u.city, COUNT(status) as total_orders
FROM trades t
LEFT JOIN users u ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;

-- Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. Sort the output first by month and then by product ID.
SELECT 
DATE_PART('month', submit_date::DATE) as month,
product_id,
ROUND(AVG(stars),2) avg_stars
FROM reviews
GROUP BY product_id, month
ORDER BY month, product_id
;

-- Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
-- Definition and note:
-- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, multiply the CTR by 100.0, not 100.

SELECT
app_id,
ROUND(100.0 *
COUNT(CASE WHEN event_type = 'click' THEN 1 ELSE NULL END) /
COUNT(CASE WHEN event_type = 'impression' THEN 1 ELSE NULL END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
AND timestamp < '2023-01-01'
GROUP BY app_id;

