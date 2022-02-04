# Project-2-Group-1

## Proposal

Three datasets were utilised, two of which originated from IMDb and the third from wikipedia. The IMDb data was contained within tsv files, a table was extracted from a wikipedia page to make up the third dataset. The aim was to compare the highest grossing movies from Wikipedia against the highest rating movies on IMDB, to see if there was a correlation between how well a movie perfoms and the rating it recieves.The data was transformed in jupyter notebook and loaded into Postgres (pgAdmin) where individual tables represented each dataset. These tables were then merged to produce a table showing the rank of highest grossing movies and the ratings and votes recieved on IMDB.
From the table we can see that there is no clear correlation between high rating and high grossing movies, though the high grossing movies err on the side of high rating, the highest rated movies are not necessarily the highest grossing. The highest grossing movie is Avatar, though the rating is only 7.8. The highest rated movie is The Dark Knight, though this is only the 48th highest grossing movie. 

## Report
**Extraction**
The IMDb datasets were downloaded from ............ as zipped tsv files. After the files had been unzipped using ...., they were imported into jupyter notebook. Two datasets were downloaded, titled 'title.ratings.tsv' and 'title.basic.tsv'.
The wikipedia data was taken from 'https://en.wikipedia.org/wiki/List_of_highest-grossing_films'. The table was read and inserted into a dataframe in jupyter notebook.

**Transformation**

**Loading**
