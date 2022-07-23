SELECT user_name FROM users;
INSERT INTO users(user_name, display_name, year_of_birth) VALUES('olaj', 'Ola Jaglinska', '1996');
SELECT user_name, display_name, year_of_birth FROM users;
INSERT INTO users(user_name, display_name, year_of_birth) VALUES 
('adam', 'Adam', 1987),
('jula', 'Julia', 1988),
('filip', 'Filip', 1993);

SELECT * FROM users WHERE year_of_birth > 1987 OR year_of_birth = 1987;
SELECT * FROM users WHERE year_of_birth = 1988 AND display_name = 'Julia';
SELECT * FROM users WHERE user_name LIKE 'f%';
SELECT * FROM users WHERE user_name NOT LIKE 'f%';
INSERT INTO users(user_name, display_name) VALUES('ania', 'Anna');
SELECT * FROM users;
SELECT * FROM users WHERE year_of_birth IS NULL;
SELECT * FROM users WHERE year_of_birth IN(1988, 1987);
SELECT * FROM users WHERE year_of_birth BETWEEN 1987 AND 1993;

SELECT DISTINCT year_of_birth FROM users 
WHERE year_of_birth IS NOT NULL
ORDER BY year_of_birth DESC LIMIT 0, 1;
