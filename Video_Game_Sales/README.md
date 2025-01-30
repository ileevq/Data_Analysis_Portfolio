In this project, I took a dataset from [Kaggle.com](https://www.kaggle.com/datasets/gregorut/videogamesales) and decided to address three business questions created using AI. I will visualize basic data using Power BI.\
Below, I will outline these business tasks.

![vgsviz](https://github.com/user-attachments/assets/1e984009-f9e1-4dad-a486-64d4522a7fd2)

### 1. Genre Popularity Analysis

>**Task**: Show the most popular game genres (e.g., RPG, FPS, Sports) in terms of total sales. Pay special attention to differences in sales results by region (e.g., North America, Europe, Japan).

**Goal**: Understand market trends and regional preferences.

<details>
<summary>Query & Output</summary>  
  
## Average sales per game in every genre (in millions) globally.  
  
```
SELECT genre, COUNT(*) AS number_of_games, SUM(global_sales) AS sum_of_total_sales, ROUND(SUM(global_sales)/COUNT(*),2) AS average_sales_per_game
FROM video_game_sales.vgsales
GROUP BY genre
ORDER BY average_sales_per_game DESC
```  
![average_sales_per_game](https://github.com/user-attachments/assets/7deff255-6cb4-4a2e-a21d-546126c437c0)  

## Average sales per game in every genre (in millions) in North America.  

```
SELECT genre, COUNT(*) AS number_of_games, SUM(na_sales) AS sum_of_sales_in_na, ROUND(SUM(na_sales)/COUNT(*),2) AS average_sales_per_game
FROM video_game_sales.vgsales
GROUP BY genre
ORDER BY average_sales_per_game DESC
```
![average_sales_per_game_na](https://github.com/user-attachments/assets/5bf263ca-b753-4b7a-b34b-731bbcf78290)  

## Average sales per game in every genre (in millions) in Europe.  

```
SELECT genre, COUNT(*) AS number_of_games, SUM(eu_sales) AS sum_of_sales_in_na, ROUND(SUM(eu_sales)/COUNT(*),2) AS average_sales_per_game
FROM video_game_sales.vgsales
GROUP BY genre
ORDER BY average_sales_per_game DESC
```
![average_sales_per_game_eu](https://github.com/user-attachments/assets/ebb76482-6617-417f-a423-eb6d221143f7)  

## Average sales per game in every genre (in millions) in Japan.  

```
SELECT genre, COUNT(*) AS number_of_games, SUM(jp_sales) AS sum_of_sales_in_na, ROUND(SUM(jp_sales)/COUNT(*),2) AS average_sales_per_game
FROM video_game_sales.vgsales
GROUP BY genre
ORDER BY average_sales_per_game DESC
```  
![average_sales_per_game_jp](https://github.com/user-attachments/assets/0cbda3c5-a8a3-4e45-bc3f-12df4c285c99)  

## Average sales per game in every genre (in millions) in other parts of the world.  

```
SELECT genre, COUNT(*) AS number_of_games, SUM(other_sales) AS sum_of_sales_in_na, ROUND(SUM(other_sales)/COUNT(*),2) AS average_sales_per_game
FROM video_game_sales.vgsales
GROUP BY genre
ORDER BY average_sales_per_game DESC
```  
![average_sales_per_game_other](https://github.com/user-attachments/assets/3aa1f7f3-f1c2-4c21-bbf9-d53e05b50672)

</details>  

### Analysis
  Looking at the tables, we can see that the genre of games that sell best for North America, Europe and other parts of the world mostly overlap with global sales. An interesting exception to this is Japan, where we can see with the naked eye that the best-selling games genre is completely different. With this in mind, we might take a different approach in marketing a game to that market. At the same time, we know that when producing Shooter or Action games, we should not do it around that market.

### 2. Identifying the Best-Performing Platforms
>**Task**: Analyze which platforms (e.g., PlayStation, Xbox, PC) have the highest average sales per game.

**Goal**: Assess the profitability of investing in specific platforms.

<details>  
  
<summary>Query & Output</summary>  

```
SELECT platform, COUNT(*) AS number_of_games, SUM(global_sales) AS sum_of_sales, ROUND(SUM(global_sales)/COUNT(*),2) AS average_sales_per_game
FROM video_game_sales.vgsales
GROUP BY platform
ORDER BY average_sales_per_game DESC
```
![average_sales_per_game_console](https://github.com/user-attachments/assets/dcee54eb-6697-46c7-94a6-bdb682d6f3e9)


</details>  

### Analysis
  In this case, even though we see consoles like the GameBoy or NES at the top, we know that these consoles went out of use years ago. Taking that into account, one of the top systems is the PlayStation 4. Even though it's a previous-generation console, many people still use it, and new games continue to be released for it. In a direct comparison with the other console of that generation – the Xbox One – the former comes out on top. Looking back one more generation, we can see that the Xbox 360 and PlayStation 3 have very similar statistics. This table is more informational rather than meant to help us make a decision. We know that new productions are designed to run on the latest generation, which, unfortunately, is not included in this comparison.

### 3. Publisher Impact on Sales
>**Task**: Create a ranking of 10 publishers based on their total game sales.

**Goal**: Support decisions regarding potential collaborations with publishers.

<details>  
  
<summary>Query & Output</summary>  

```
SELECT publisher, SUM(global_sales) FROM video_game_sales.vgsales
WHERE publisher IS NOT NULL
GROUP BY publisher
ORDER BY SUM(global_sales) DESC
LIMIT 10
```
![top_publishers](https://github.com/user-attachments/assets/2b2cd1a4-ec9a-447a-ac55-1dc61f725ed3)  

</details>  

### Analysis
 Looking at this table, choosing a publisher might seem simple. Unfortunately, the devil is in the details. As we know from the table in task 2, it also includes the best-selling titles from older consoles. This might mean that a publisher who was once at the top no longer produces as many high-quality games. Making a decision about a potential collaboration would require taking significantly more steps and conducting further analyses. Interestingly, in this comparison, we have as many as 5 Japanese publishers, 4 American ones, and only one European publisher – Ubisoft from France.
