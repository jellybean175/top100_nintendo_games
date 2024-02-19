-- The CSV file has been imported into a table named 'Top 100 Best Nintendo Games of All Time' with a column named 'Genre'

using Top 100 Best Nintendo Games of All Time

  ------------------------------------
Query to retrieve the most popular genres
------------------------------------
SELECT Genre, COUNT(*) AS Count
FROM 
(
    SELECT Genre
    FROM Top 100 Best Nintendo Games of All Time
) 
AS GenreList
GROUP BY Genre
ORDER BY Count DESC;

------------------------------------
Find the average cost of a game in US Dollars
------------------------------------
SELECT AVG("Game Purchase Price (USD)") AS AveragePrice
FROM "Top 100 Best Nintendo Games of All Time";

------------------------------------
Which studio made the most popular games?
------------------------------------
SELECT Developers, COUNT(*) AS GamesCount
FROM "Top 100 Best Nintendo Games of All Time"
GROUP BY Developers
ORDER BY GamesCount DESC
LIMIT 1;

------------------------------------
How many games allow for more than 2 players to play at once?
------------------------------------
SELECT COUNT(*) AS GamesWithMoreThan2Players
FROM "Top 100 Best Nintendo Games of All Time"
WHERE "Number of Players" > 2;

------------------------------------
Which year had the most games on this list?
------------------------------------

SELECT "Year Released", COUNT(*) AS GamesCount
FROM "Top 100 Best Nintendo Games of All Time"
GROUP BY "Year Released"
ORDER BY GamesCount DESC
LIMIT 1;
