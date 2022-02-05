<style>
body {
text-align: justify}
</style>



# All your DATAbase are belong to us
### By Ovi Serban, Khadiza Begum, Meng Tong, Clifford Sepato, Emma Smith

# Proposal

Movie is a industry with annual revenue over 42 billion US dollar. A high rating movie will make actors participant become famous super movie star while highest-grossing earn hundreds of million US dollars as profits. Using the historical rating by each movie, one may learn which movie type is the most popular one for movie fans. The costs and revenue data also show the information of high-grossing films. However, it seems a paradox that those high rating movie who won Oscar prize may not be the highest-grossing movies. In this study, we use movie rating ranking from IMDB in comparisons with movie grossing ranking in Wikipedia to investigate if the high rating movies are also high grossing movie. Moreover, if it in related to movie type or some other indicators. 

For example, from the table we join in this report, though the high grossing movies err on the side of high rating, the highest rated movies are not necessarily the highest grossing. The highest grossing movie is Avatar while its rating is only 7.8. On the other hand, the highest rated movie is The Dark Knight at 9.0, though this is only the 48th highest grossing movie. 

The initial findings from the Rotten Tomatoes web scraping are that the audience score seems closer to the IMDB rating than the Rotten Tomatoes (critics) scores. However, this requires further work before any strong relationships/correlation can be found.

# Data collection and cleaning 

## Data extractions

After retrieving the data from https://datasets.imdbws.com/, We collect two data sources from IMDB and Rotten Tomatoes to join them into a single movie list including a unique ID code variable tconst, the start and end year of the movie, movie running time and genres/type, its average rating, the number of votes in IMDB,its ranking overall and its rotten tomato ratings\footnote{The raw data file contained information regarding the unique ID, format of the title (e.g. if it is a move, tv series etc.), main promotional title used, original title, if it is aimed for an adult audience (18+), release year, end year for the series, the runtime of the title and the genre.The rating file contains unique ID, average rating and number of votes for titles.}.

We also collect highest-grossing movies from Wikipedia from https://en.wikipedia.org/wiki/List_of_highest-grossing_films to obtain the top 50 movies with highest grossing in history. We first read the webpage tables into jupyter notebook using "read.html" function in pandas. 
Then we extract and clean the data and construct the table below.

## Data transformation

The datasets are zipped tsv files and we unzipped the files using 7zip software and imported the data into jupyter notebook. Those two datasets were named as 'title.rating.tsv' and 'title.basic .tsv' in our submitted Github repository. After importing the dataset as dataframe, we filter the movie by type and merge them based on the unique ID code. Then we drop those observations with null values in movie type and select those variables we need as listed in previous. 

We used rotten-tomatoes-scraper library to scrap Rotten Tomatoes website to extract metadata of movies. All what you need to do is to feed movie_url or movie_title to extract the movie metadata. A list with movie's titles from IMDB files was created which helped us to feed the movie_title. All the extractions from Rotten Tomatoes were stored in a list of dictionaries and transformed after in a dataframe. We merged Rotten Tomatoes dataframe with IMDB dataframe to have all data in one table. A database called movie_list was created in PostrgeSQL and the new created dataframe was loaded into database. After we rename the variable and merge it with rotten tomato based on ranking, we can have our final data in the dataframe 'final_data'. We create the table in sql from jupyter notebook and using the engine to ensure its connection with pgsql server.  We create a empty csv file and read our highest grossing dataset just cleaned into the the csv file and saved in our repository named 'wiki_data.csv'.Then we read it into jupyter notebook and read it into a sql database that we create using sqlalchemy. Finally, we setup engine to ensure its connections. 

The IMDb data was inserted into dataframes in jupyter notebook. Both datasets were filtered by format type to present only those that were movies. The basic and rating tables were then merged using the unique ID (tconst). Null values appeared as the rating data could not be filtered by format type. The null values were dropped.
The data was then sorted by the number of votes in descending order. The index was reset and the columns that were needed from the tables were then selected (averageRating, numVotes and primaryTitle). These columns were then renamed. This data was then exported as a csv file.

The wikipedia data was read from the webpage and imported into a dataframe. The required columns were selected (Title and Rank) and renamed. This data was exported as a csv.

### Web scraping:

We used rotten-tomatoes-scraper library to scrap Rotten Tomatoes website to extract metadata of movies. All what you need to do is to feed movie_url or movie_title to extract the movie metadata. A list with movie's titles from IMDB files was created which helped us to feed the movie_title. All the extractions from Rotten Tomatoes were stored in a list of dictionaries and transformed after in a dataframe. We merged Rotten Tomatoes dataframe with IMDB dataframe to have all data in one table.
A database called movie_list was created in PostrgeSQL and the new created dataframe was loaded into database.

(





Three datasets were utilised, two of which originated from IMDb and the third from wikipedia. The IMDb data was contained within tsv files, a table was extracted from a wikipedia page to make up the third dataset. 

The aim was to compare the highest grossing movies from Wikipedia against the highest rated movies on IMDB, to see if there is a correlation between how well a movie perfoms and the rating it recieves.The data was transformed in jupyter notebook and loaded into Postgres (pgAdmin) where individual tables represented each dataset. These tables were then merged to produce a table showing the rank of highest grossing movies and the ratings and votes recieved on IMDB. We used Postgres as it is a relational database and we needed to be able to compare the information by joining different tables.

From the table we can see that there is no strong correlation between high rating and high grossing movies, though the high grossing movies err on the side of high rating, the highest rated movies are not necessarily the highest grossing. The highest grossing movie is Avatar, though the rating is only 7.8. The highest rated movie is The Dark Knight with 9.0, though this is only the 48th highest grossing movie. 

The initial findings from the Rotten Tomatoes web scraping are that the audience score seems closer to the IMDB rating than the Rotten Tomatoes (critics) scores. However, this requires further work before any strong relationships/correlation can be found.

## Report
**Extraction**

The IMDb datasets were downloaded from https://datasets.imdbws.com/ as zipped tsv files. After the files had been unzipped using 7zip/winzip, they were imported into jupyter notebook. Two datasets were downloaded, titled 'title.ratings.tsv' and 'title.basic.tsv'. 

The basic file contained information regarding the unique ID, format of the title (e.g. if it is a move, tv series etc.), main promotional title used, original title, if it is aimed for an adult audience (18+), release year, end year for the series, the runtime of the title and the genre.

The rating file contains unique ID, average rating and number of votes for titles.

The wikipedia data was taken from 'https://en.wikipedia.org/wiki/List_of_highest-grossing_films'. The table was read and imported into jupyter notebook.

**Transformation**

The IMDb data was inserted into dataframes in jupyter notebook. Both datasets were filtered by format type to present only those that were movies. The basic and rating tables were then merged using the unique ID (tconst). Null values appeared as the rating data could not be filtered by format type. The null values were dropped.
The data was then sorted by the number of votes in descending order. The index was reset and the columns that were needed from the tables were then selected (averageRating, numVotes and primaryTitle). These columns were then renamed. This data was then exported as a csv file.

The wikipedia data was read from the webpage and imported into a dataframe. The required columns were selected (Title and Rank) and renamed. This data was exported as a csv.

Web scraping:

We used rotten-tomatoes-scraper library to scrap Rotten Tomatoes website to extract metadata of movies. All what you need to do is to feed movie_url or movie_title to extract the movie metadata. A list with movie's titles from IMDB files was created which helped us to feed the movie_title. All the extractions from Rotten Tomatoes were stored in a list of dictionaries and transformed after in a dataframe. We merged Rotten Tomatoes dataframe with IMDB dataframe to have all data in one table.
A database called movie_list was created in PostrgeSQL and the new created dataframe was loaded into database.

)




**Loading**

The IMDb and wikipedia data was imported into SQL database (Postgres) using the connection in jupyter notebook. The tables were merged in SQL user an inner join in order to compare the highest grossing films to the highest rated films.

![SQL Table](https://user-images.githubusercontent.com/88689661/152639970-622fa681-2350-4336-9c6d-7919303e0708.png)

**What problems did we have?**

We initially faced issues in using the TSV files, they required unzipping and loading into jupyter notebook. They loaded into jupyter notebook okay, however they took a long time to load and we thought this may be an issue. There was also problems with duplicate data, we filtered as much as we could without restricting the data too much. However there were still duplicates present. 

Web scraping presented more issues, in that we could only scrape a certain number of films from Rotten Tomatoes at one time. The scraping also didn't return the movie titles, so this was sorted by adding a new column 'Rank' to allow for the merging of the IMDB data and Rotten Tomatoes data.

**What would we do without limitations/with more time?**

If we had more time, we would look into removing further duplicates. There were duplicates of some movies because of alternative versions of them, such as alternative language or directors cut. We could use the title.akas TSV, which included the language column and possibly filter some of the duplicates out that way.

We would also like to create a comparison of ratings between IMDB, Rotten Tomatoes and MetaCritic, to see how rating differs between each site. 

Possibly look into creating a scatter plot comparing the ratings on IMDB and the grossing amount from Wikipedia.

Further work would also be needed with the rotten tomatoes data to allow for proper comparison between ratings. Rotten Tomatoes scores are out of 100, while IMDB scores are out of 10. We could either scale up the IMDB scores, or scale down the Rotten Tomatoes scores. Rotten Tomatoes also has both critics and audience scores, so we could add those into the comparison as well, as IMDB ratings are made up from user voting, where as the Rotten Tomatoes scores are usually made from critics ratings. 
