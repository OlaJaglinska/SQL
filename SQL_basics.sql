SELECT user_name FROM users;
INSERT INTO users(user_name, display_name, year_of_birth) VALUES('olaj', 'Ola', '1996');
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

# lesson 2

SELECT * FROM users;
SELECT * FROM user_groups;
SELECT * FROM users_to_groups;
INSERT INTO user_groups(group_name) VALUES ('programmers'), ('skiers'), ('nature lovers'), ('history experts');
INSERT INTO users_to_groups(user_id, group_id) VALUES(1,1), (1,2), (2,1), (1,3), (2,4), (3,3),(4,1);

SELECT COUNT(user_name) FROM users;
SELECT MIN(year_of_birth) FROM users;
SELECT MAX(year_of_birth) FROM users;
SELECT SUM(year_of_birth) FROM users;
SELECT AVG(year_of_birth) FROM users;

# SUBQUERY
SELECT user_name FROM users WHERE id IN
(SELECT user_id FROM users_to_groups WHERE group_id = 2);

SELECT usersTable.id AS userId,user_name, group_name FROM users AS usersTable
JOIN users_to_groups ON usersTable.id = users_to_groups.user_id
JOIN user_groups ON users_to_groups.group_id = user_groups.id;

SELECT user_groups.group_name, COUNT(users.user_name) AS number_of_users FROM users
JOIN users_to_groups ON users.id = users_to_groups.user_id
JOIN user_groups ON users_to_groups.group_id = user_groups.id
GROUP BY user_groups.group_name 
HAVING number_of_users > 2
ORDER BY number_of_users;

# updating and deleting
UPDATE users SET user_name='jula123', display_name='Julia 2' WHERE id=3;
DELETE FROM users WHERE id=3;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM users;
TRUNCATE user_groups;
DROP TABLE users;

# lesson 3
INSERT INTO departments(name)
VALUES ('R&D'), ('Service Desk'), ('Maintenance'), ('Very secret Department');
INSERT INTO employees(name, department_id)
VALUES
('Ola', 1),
('Marcin', 1),
('Anna', 2),
('Jacek', 3),
('Mateusz', NULL),
('Kamila', NULL),
('Artur', 3);

# inner join
SELECT employees.name, departments.name
FROM employees JOIN departments
ON employees.department_id = departments.id;

# left join
SELECT employees.name, departments.name
FROM employees LEFT JOIN departments
ON employees.department_id = departments.id;

# right join
SELECT employees.name, departments.name
FROM employees RIGHT JOIN departments
ON employees.department_id = departments.id;

# full join
SELECT employees.name, departments.name
FROM employees LEFT JOIN departments
ON employees.department_id = departments.id
UNION
SELECT employees.name, departments.name
FROM employees RIGHT JOIN departments
ON employees.department_id = departments.id;

# left join without the intersection
SELECT employees.name, departments.name
FROM employees LEFT JOIN departments
ON employees.department_id = departments.id
WHERE departments.id IS NULL;

# right join without the intersection
SELECT employees.name, departments.name
FROM employees RIGHT JOIN departments
ON employees.department_id = departments.id
WHERE employees.department_id IS NULL;

# full join without the intersection
SELECT employees.name, departments.name
FROM employees LEFT JOIN departments
ON employees.department_id = departments.id
WHERE employees.department_id IS NULL OR departments.id IS NULL
UNION ALL
SELECT employees.name, departments.name
FROM employees RIGHT JOIN departments
ON employees.department_id = departments.id
WHERE employees.department_id IS NULL OR departments.id IS NULL;