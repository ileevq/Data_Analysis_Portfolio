CREATE SCHEMA game_store_management_system;

CREATE TABLE IF NOT EXISTS game_store_management_system.games(
	game_id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	description TEXT,
	release_date DATE NOT NULL,
	base_price DECIMAL(10,2) NOT NULL,
	genre VARCHAR(100),
	age_rating VARCHAR(10),
	publisher_id INTEGER NOT NULL,
	system_requirements TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS game_store_management_system.game_library(
	library_id SERIAL PRIMARY KEY,
	user_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
	game_id INTEGER REFERENCES games(game_id) ON DELETE CASCADE,
	purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	playtime INTEGER DEFAULT 0,
	last_played TIMESTAMP,
	installation_status VARCHAR(20) DEFAULT 'not_installed',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(user_id, game_id)
);

CREATE TABLE IF NOT EXISTS game_store_management_system.reviews(
	review_id SERIAL PRIMARY KEY,
	user_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
	game_id INTEGER REFERENCES games(game_id) ON DELETE CASCADE,
	rating INTEGER CHECK (rating >=1 AND rating <=5),
	review_text TEXT,
	review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(user_id, game_id)
);

CREATE TABLE IF NOT EXISTS game_store_management_system.achievements(
	achievemnt_id SERIAL PRIMARY KEY,
	game_id INTEGER REFERENCES games(game_id) ON DELETE CASCADE,
	title VARCHAR(100) NOT NULL,
	description TEXT,
	points INTEGER DEFAULT 0,
	rarity VARCHAR(20) DEFAULT 'common',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(game_id, title)
);

CREATE TABLE IF NOT EXISTS game_store_management_system.user_achievements(
	user_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
	achievements_id INTEGER REFERENCES achievements(achievement_id) ON DELETE CASCADE,
	unlock_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS game_store_management_system.dlc(
	dlc_id SERIAL PRIMARY KEY,
	game_id INTEGER REFERENCES games(game_id) ON DELETE CASCADE,
	title VARCHAR(100) NOT NULL,
	description TEXT,
	base_price DECIMAL(10,2) NOT NULL,
	release_date DATE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS game_store_management_system.friends(
	friendship_id SERIAL PRIMARY KEY,
	user1_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
	user2_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
	friendship_status VARCHAR(20) DEFAULT 'pending',
	friend_since TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CHECK (user1_id != user2_id),
	UNIQUE(user1_id, user2_id)
);
