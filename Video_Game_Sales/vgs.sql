CREATE SCHEMA video_game_sales;

CREATE TABLE IF NOT EXISTS video_game_sales.vgsales(
	Rank INTEGER,
	Name VARCHAR(150),
	Platform VARCHAR(10),
	Year SMALLINT,
	Genre VARCHAR(20),
	Publisher VARCHAR(50),
	NA_Sales DECIMAL(5,2),
	EU_Sales DECIMAL(5,2),
	JP_sales DECIMAL(5,2),
	Other_Sales DECIMAL(5,2),
	Global_Sales DECIMAL(5,2)
);
