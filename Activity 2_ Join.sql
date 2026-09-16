-- create

-- League Champions Information TABLE
CREATE TABLE CHAMPION (
  champion_ID INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  hp INTEGER NOT NULL,
  mana INTEGER NOT NULL,
  attack_dmg INTEGER NOT NULL
);

-- insert
INSERT INTO CHAMPION VALUES (0001, 'A atrox', 1000, 500, 100);
INSERT INTO CHAMPION VALUES (0002, 'Ahri', 700, 800, 60);
INSERT INTO CHAMPION VALUES (0003, 'Akali', 800, 100, 90);
INSERT INTO CHAMPION VALUES (0004, 'Akshan', 900, 600, 120);
INSERT INTO CHAMPION VALUES (0005, 'Alistar', 1300, 400, 50);
INSERT INTO CHAMPION VALUES (0006, 'Ambessa', 1000, 400, 110);
INSERT INTO CHAMPION VALUES (0007, 'Amumu', 1200, 500, 60);
INSERT INTO CHAMPION VALUES (0008, 'Anivia', 700, 800, 50);
INSERT INTO CHAMPION VALUES (0009, 'Annie', 680, 700, 60);
INSERT INTO CHAMPION VALUES (0010, 'Aphelios', 750, 600, 120);
INSERT INTO CHAMPION VALUES (0011, 'Ashe', 650, 400, 110);
INSERT INTO CHAMPION VALUES (0012, 'Aurelion Sol', 600, 800, 60);
INSERT INTO CHAMPION VALUES (0013, 'Aurora', 700, 650, 65);
INSERT INTO CHAMPION VALUES (0014, 'Azir', 680, 750, 60);
INSERT INTO CHAMPION VALUES (0015, 'Bard', 650, 600, 50);





-- ARENA Game Mode Champion statistics
CREATE TABLE ARENA_STATS (
  stat_id INTEGER PRIMARY KEY,
  champion_id INTEGER NOT NULL,
  tier TEXT NOT NULL,
  win_rate REAL NOT NULL,
  ban_rate REAL NOT NULL
);

INSERT INTO ARENA_STATS VALUES (0001, 0001, 'S', 54.2, 12.5);  
INSERT INTO ARENA_STATS VALUES (0002, 0002, 'A', 51.8, 4.3);   
INSERT INTO ARENA_STATS VALUES (0003, 0003, 'A', 50.5, 8.1);   
INSERT INTO ARENA_STATS VALUES (0004, 0004, 'B', 49.2, 3.0);   
INSERT INTO ARENA_STATS VALUES (0005, 0005, 'S', 55.1, 15.2); 
INSERT INTO ARENA_STATS VALUES (0006, 0006, 'A', 52.4, 6.7);   
INSERT INTO ARENA_STATS VALUES (0007, 0007, 'B', 48.9, 2.1);   
INSERT INTO ARENA_STATS VALUES (0008, 0008, 'A', 51.2, 3.8);   
INSERT INTO ARENA_STATS VALUES (0009, 0009, 'B', 49.8, 1.9);   
INSERT INTO ARENA_STATS VALUES (0010, 0010, 'C', 46.5, 2.4); 
INSERT INTO ARENA_STATS VALUES (0011, 0011, 'B', 49.0, 3.5); 
INSERT INTO ARENA_STATS VALUES (0012, 0012, 'S', 53.7, 9.4);
INSERT INTO ARENA_STATS VALUES (0013, 0013, 'A', 52.0, 5.2); 
INSERT INTO ARENA_STATS VALUES (0014, 0014, 'C', 47.3, 1.8); 
INSERT INTO ARENA_STATS VALUES (0015, 0015, 'B', 48.5, 2.0); 




-- fetch 

-- Insight 1: fetching a champion
SELECT * 
FROM CHAMPION 
WHERE name = 'Ahri';

-- Insight 2: fetching the champions with the most HP
SELECT *
FROM CHAMPION
WHERE hp = (SELECT(MAX(hp)) FROM CHAMPION);

-- Insight 3: fetching the champions with the least attack damage
SELECT *
FROM CHAMPION
WHERE attack_dmg = (SELECT(MIN(attack_dmg)) FROM CHAMPION);

-- Insight 4: fetching S tier champions
SELECT c.name, c.hp, c.attack_dmg, s.tier, s.win_rate, s.ban_rate
FROM CHAMPION c
JOIN ARENA_STATS s
ON c.champion_ID = s.champion_id
WHERE s.tier = 'S'
ORDER BY s.win_rate DESC;

-- Insight 5: fetching the highest attack damage champions to see their performance in AREA gamemode  
SELECT c.name, c.attack_dmg, s.tier, s.win_rate, s.ban_rate
FROM CHAMPION c
JOIN ARENA_STATS s
ON c.champion_ID = s.champion_id
WHERE c.attack_dmg >= 100
ORDER BY c.attack_dmg DESC, s.win_rate DESC;

-- Insight 6: fetching the highest ban rate and win rate champions, basically meta champions
SELECT c.name, c.hp, c.mana, s.tier, s.win_rate, s.ban_rate
FROM CHAMPION c
JOIN ARENA_STATS s
ON c.champion_ID = s.champion_id
WHERE s.win_rate > 50.0
AND s.ban_rate >= 5.0
ORDER BY s.ban_rate DESC;


