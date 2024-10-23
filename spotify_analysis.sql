SELECT * FROM spotify;

-- There are total 20594 rows data in dataset

-- SIMPLE QUESTIONS

-- Q1. What are the unique artist names in the dataset?

SELECT COUNT(DISTINCT(artist)) FROM spotify;

-- There are 2074 unique artist in the dataset

-- Q2. How many tracks are there by each artist ?

SELECT artist,COUNT(track) as track_count FROM spotify 
GROUP BY artist ORDER BY track_count ASC;


-- Q3. List all track names along with their YouTube views.

SELECT track,SUM(views) as view_counts FROM spotify
GROUP BY track ORDER BY view_counts ASC;

-- "Despacito" has most views i.e 16159296273 views
-- "Rukh Zindagi Ne Mod Liya - Unplugged" has least views i.e 0 views

-- Q4. What is the average danceability score of all tracks?

SELECT AVG(danceability) as avg_score FROM spotify;

-- average danceability score of all tracks is 0.6201018112071469

-- Q5. How many tracks have more than 1 million YouTube views?

SELECT COUNT(*) FROM spotify WHERE views > 1000000;

-- 16064 tracks have views greater than 1 million

-- Q6. Which artist has the highest total YouTube views across all their tracks?

SELECT artist,SUM(views) as total_views FROM spotify 
GROUP BY artist ORDER BY total_views DESC;

-- Ed Sheeran has the highest views across all his tracks i.e 15460207769 views

-- Q7. What is the total number of likes on YouTube for each track?

SELECT track,sum(likes) as total_likes FROM spotify
GROUP BY track ORDER BY 2 DESC;

-- "Despacito" is most liked song on Youtube with count of likes = 101577278


-- Q8. For each album, calculate the total views of all associated tracks.

SELECT album,SUM(views) as total_views FROM spotify 
GROUP BY album ORDER BY total_views DESC;

-- "VIDA", "See You Again (feat. Charlie Puth)", "The Heist", "Peace Is The Mission (Extended)",
-- "CoComelon Kids Hits, Vol. 1" are the TOP 5 albums with respect to views

-- Q9. Retrieve the track names that have been played on Spotify more than YouTube.
WITH CTE1 as
(
SELECT 
track,
COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END),0) as YT_streamed,
COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END),0) as SP_streamed
FROM spotify
GROUP BY 1
)

SELECT * FROM CTE1 WHERE SP_streamed > YT_streamed and YT_streamed <> 0;

-- "Usted" is the track mostly played on Spotify More than Youtube

-- Q10. List all tracks along with their views and likes where official_video = TRUE.

SELECT track,SUM(views) as total_views,SUM(likes) as total_likes FROM spotify 
WHERE official_video = TRUE GROUP BY 1 ;


-- Q11. Find the top 3 most-viewed tracks for each artist using window functions.

SELECT DISTINCT track,SUM(views) OVER(PARTITION BY track) as top_tracks FROM spotify
ORDER BY top_tracks DESC
LIMIT 3;

-- top 3 tracks are >> Despacito, See You Again (feat. Charlie Puth), Lean On


-- Q12. Write a query to find tracks where the liveness score is above the average.

SELECT track FROM spotify WHERE liveness > (SELECT AVG(liveness) FROM spotify);

-- Total 6364 tracks have liveness score than Avg Liveness Score


-- Q13. Determine the percentage contribution of each track's YouTube views to the total YouTube views of the artist.

WITH CTE2 AS
(
SELECT DISTINCT track, SUM(views) OVER(PARTITION BY track) as track_tot_views FROM spotify
),
CTE3 AS
(
SELECT track,track_tot_views,
(track_tot_views/(SELECT SUM(views) FROM spotify)*100)  as contri_percent FROM CTE2
ORDER BY contri_percent DESC
)

SELECT * FROM CTE3;


-- Q14. Rank artists based on their average YouTube views across all tracks, and show their rank.

SELECT artist, AVG(views) AS avg_views,
RANK() OVER (ORDER BY AVG(views) DESC) AS artist_rank
FROM spotify
GROUP BY artist;

-- TOP 3 artists based on their average YouTube views across all tracks are >> 
-- "Ed Sheeran"
-- "CoComelon"
-- "Katy Perry"


-- Q15. Calculate the difference between each track's YouTube views and the artist's average YouTube views.

SELECT artist, track, views,
views - AVG(views) OVER (PARTITION BY artist) AS view_diff
FROM spotify;
