/*Create a new database called "School" this database
should have two tables: teachers and students. 
The teachers table: teacher_id, first_name, last_name, 
homeroom_number, department, email, and phone.*/
CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number SMALLINT,
	department VARCHAR(50),
	email VARCHAR(50) UNIQUE NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL
);
--insert a teacher--
INSERT INTO teachers
(first_name,
 last_name, 
 homeroom_number,
 department,
 email,
 phone
)
VALUES
('Jonas',
 'Halk',
 5,
 'Biology',
 'jsalk@school.org',
 '777-555-4321'
);
SELECT * FROM teachers
/*The students table: student_id, first_name,last_name, 
homeroom_number, phone,email, and graduation year.*/
CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number SMALLINT,
	email VARCHAR(50) UNIQUE,
	phone VARCHAR(50) UNIQUE NOT NULL,
	graduation_year INTEGER	
);
--insert a student--
INSERT INTO students
(first_name,
 last_name, 
 homeroom_number, 
 phone,
 graduation_year)
VALUES
('Mark',
 'Watney',
 5,
 '777-555-1234',
 '2023' 
);

SELECT * FROM students;