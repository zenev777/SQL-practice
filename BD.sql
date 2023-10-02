CREATE TABLE Games (
    game_id INT PRIMARY KEY,
    title VARCHAR(255),
    release_date DATE,
    genre VARCHAR(255)
);

CREATE TABLE Platforms (
    platform_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Developers (
    developer_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Game_Platforms (
    game_id INT,
    platform_id INT,
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (platform_id) REFERENCES Platforms(platform_id),
    PRIMARY KEY (game_id, platform_id)
);

CREATE TABLE Game_Developers (
    game_id INT,
    developer_id INT,
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (developer_id) REFERENCES Developers(developer_id),
    PRIMARY KEY (game_id, developer_id)
);

CREATE TABLE Game_Publishers (
    game_id INT,
    publisher_id INT,
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    PRIMARY KEY (game_id, publisher_id)
);

CREATE TABLE Reviews (
  review_id INT PRIMARY KEY,
  game_id INT,
  reviewer_name VARCHAR(50),
  review_text VARCHAR(500),
  rating INT,
  FOREIGN KEY (game_id) REFERENCES Games (game_id)
);


CREATE TABLE Game_Sales (
  sale_id INT PRIMARY KEY,
  game_id INT,
  platform_id INT,
  sale_date DATE,
  units_sold INT,
  FOREIGN KEY (game_id) REFERENCES Games (game_id),
  FOREIGN KEY (platform_id) REFERENCES Platforms (platform_id)
);



INSERT INTO Games (game_id, title, release_date, genre)
VALUES (1, 'Skyrim', '2011-11-11', 'RPG'),
       (2, 'Overwatch', '2016-05-24', 'FPS'),
       (3, 'The Witcher 3', '2015-05-19', 'RPG'),
       (4, 'Minecraft', '2011-11-18', 'Sandbox');


INSERT INTO Platforms (platform_id, name)
VALUES (1, 'PC'),
       (2, 'PlayStation'),
       (3, 'Xbox'),
       (4, 'Nintendo');


INSERT INTO Developers (developer_id, name)
VALUES (1, 'Bethesda'),
       (2, 'Blizzard'),
       (3, 'CD Projekt Red'),
       (4, 'Mojang Studios');


INSERT INTO Publishers (publisher_id, name)
VALUES (1, 'Bethesda'),
       (2, 'Blizzard'),
       (3, 'CD Projekt Red'),
       (4, 'Mojang Studios');


INSERT INTO Game_Platforms (game_id, platform_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2);


INSERT INTO Game_Developers (game_id, developer_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4);


INSERT INTO Game_Publishers (game_id, publisher_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4);


INSERT INTO Game_Sales (sale_id, game_id, platform_id, sale_date, units_sold)
VALUES
  (1, 1, 1, '2023-01-01', 100);



  INSERT INTO Reviews (review_id, game_id, reviewer_name, review_text, rating)
VALUES
  (1, 1, 'John Smith', 'Great game!', 4),
  (2, 1, 'Emma Johnson', 'Good graphics.', 3),
  (3, 2, 'Michael Brown', 'Highly recommended!', 5),
  (4, 3, 'John Smith', 'Interesting storyline.', 4);


SELECT title, release_date FROM Games WHERE genre = 'RPG';



SELECT name FROM Platforms;


SELECT D.name FROM Developers D
JOIN Game_Developers GD ON D.developer_id = GD.developer_id
WHERE GD.game_id = 1;



SELECT title, genre FROM Games WHERE release_date > '2015-01-01';



SELECT P.name FROM Platforms P
JOIN Game_Platforms GP ON P.platform_id = GP.platform_id
WHERE GP.game_id = 2;


SELECT COUNT(*) AS total_games FROM Games;

SELECT title, genre FROM Games ORDER BY title ASC;


SELECT P.name, COUNT(*) AS game_count FROM Platforms P
JOIN Game_Platforms GP ON P.platform_id = GP.platform_id
GROUP BY P.name;



SELECT P.name FROM Platforms P
JOIN Game_Platforms GP ON P.platform_id = GP.platform_id
WHERE GP.game_id = 3;



SELECT name FROM Platforms ORDER BY name ASC;


