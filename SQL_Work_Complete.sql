/* These first two sets of code are troubleshooting, from when I had duplicates of every movie. Turned out I had imported the wiki_data.csv twice

SELECT 
    "Movie Rating",
    "User Votes",
    "Title",
    "Rank of Highest Grossing Movies",
    COUNT (*)AS cnt 
FROM joined_data

GROUP BY 
    "Movie Rating",
    "User Votes",
    "Title",
    "Rank of Highest Grossing Movies"
HAVING COUNT (*) >=1
ORDER BY "User Votes" DESC;

CREATE TABLE joined_data AS SELECT
imdb_data."Movie Rating", imdb_data."User Votes", imdb_data."Title", wiki_data."Rank of Highest Grossing Movies"
FROM imdb_data JOIN wiki_data ON imdb_data."Title" = wiki_data."Title"
ORDER BY "Movie Rating" DESC;

