# Spotify-Data-Analysis

Dataset Overview
This dataset contains music tracks from various albums, providing a comprehensive analysis of their characteristics and performance metrics on platforms like YouTube and Spotify.

## Columns:

Album: The name of the album to which the track belongs.

Album_type: The type of album (e.g., studio, compilation).

Danceability: A measure of how suitable a track is for dancing based on tempo, rhythm stability, and overall beat strength.

Energy: A measure of intensity and activity, reflecting the perceived intensity of a track.

Loudness: The overall loudness of a track measured in decibels (dB).

Speechiness: A measure of the presence of spoken words in a track.

Acousticness: A measure of the acoustic quality of a track, indicating the likelihood it was recorded using acoustic instruments.

Instrumentalness: A measure of whether a track is likely to be instrumental, i.e., lacking vocals.

Liveness: A measure indicating the presence of an audience in the recording.

Valence: A measure of the musical positiveness of a track, with higher values indicating a happier sound.

Tempo: The speed of the track, measured in beats per minute (BPM).

Duration_min: The length of the track in minutes.

Title: The name of the track.

Channel: The YouTube channel hosting the track.

Views: The total number of views the track has received on YouTube.

Likes: The total number of likes on the track.

Comments: The number of comments made on the track.

Licensed: Indicates whether the track is officially licensed.

official_video: Boolean indicating if the track has an official music video.

Stream: Indicates the streaming platform.

EnergyLiveness: A derived metric combining energy and liveness scores to gauge overall track performance.

most_playedon: Indicates whether the track is more played on Spotify or YouTube.

## Analysis Questions

What are the unique artist names in the dataset?

Purpose: To identify the diversity of artists represented in the dataset.
Relevant Column: Artist (not explicitly mentioned in the column list but implied).
How many tracks are there by each artist?

Purpose: To analyze the output of each artist in the dataset.
Relevant Column: Artist, Title.
List all track names along with their YouTube views.

Purpose: To see which tracks have the highest and lowest views on YouTube.
Relevant Column: Title, Views.
What is the average danceability score of all tracks?

Purpose: To assess the overall danceability of tracks in the dataset.
Relevant Column: Danceability.
How many tracks have more than 1 million YouTube views?

Purpose: To identify popular tracks based on YouTube views.
Relevant Column: Views.
Which artist has the highest total YouTube views across all their tracks?

Purpose: To determine the most popular artist based on views.
Relevant Column: Artist, Views.
What is the total number of likes on YouTube for each track?

Purpose: To analyze audience engagement with each track.
Relevant Column: Title, Likes.
For each album, calculate the total views of all associated tracks.

Purpose: To determine which albums are most popular based on views.
Relevant Column: Album, Views.
Retrieve the track names that have been played on Spotify more than YouTube.

Purpose: To identify tracks that are more popular on Spotify compared to YouTube.
Relevant Column: Title, Stream.
List all tracks along with their views and likes where official_video = TRUE.

Purpose: To focus on officially released music videos.
Relevant Column: Title, Views, Likes, official_video.
Find the top 3 most-viewed tracks for each artist using window functions.

Purpose: To highlight the most popular tracks per artist.
Relevant Column: Artist, Title, Views.
Write a query to find tracks where the liveness score is above the average.

Purpose: To identify tracks with higher audience engagement.
Relevant Column: Title, Liveness.
Determine the percentage contribution of each track's YouTube views to the total YouTube views of the artist.

Purpose: To analyze the significance of each track in relation to the artist's overall views.
Relevant Column: Title, Views, Artist.
Rank artists based on their average YouTube views across all tracks, and show their rank.

Purpose: To find out which artists are performing best based on average views.
Relevant Column: Artist, Views.
Calculate the difference between each track's YouTube views and the artist's average YouTube views.

Purpose: To identify tracks that are performing significantly above or below an artist's average.
Relevant Column: Title, Artist, Views.

## Purpose of Analysis
This dataset can be analyzed to derive insights about musical trends, artist performances, audience engagement, and the effectiveness of different track characteristics on viewer response.
