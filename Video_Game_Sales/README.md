In this project, I took a dataset from [Kaggle.com](https://www.kaggle.com/datasets/gregorut/videogamesales) and decided to address three business questions created using AI. I will visualize the data at the end.\
Below, I will outline these business tasks.

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
