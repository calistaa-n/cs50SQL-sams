INSERT INTO "departments" ("name") VALUES
('Computer Science'), ('Mathematics'), ('Information Systems');

INSERT INTO "lecturers" ("department_id", "name", "birthdate", "email", "highest_degree", "job_title", "hire_date") VALUES
  (1, 'Dr. Alice Jones', '1968-01-15', 'alice.jones@university.edu', 'Ph.D. in Computer Science', 'Professor', '2008-08-01'),
  (1, 'Dr. Frederick Miller', '1972-09-04', 'frederick.miller@university.edu', 'Ph.D. in Computer Science', 'Associate Professor', '2015-02-01'),
  (1, 'Dr. Kevin Thomas', '1960-08-23', 'kevin.thomas@university.edu', 'Ph.D. in Computer Science', 'Professor', '1992-04-01'),
  (1, 'Dr. Peter Allen', '1969-05-19', 'peter.allen@university.edu', 'Ph.D. in Computer Science', 'Professor', '2010-12-01'),
  (1, 'Ms. Stephanie Rodriguez', '1990-10-20', 'stephanie.rodriguez@university.edu', 'M.Sc. in Computer Science', 'Lecturer', '2021-07-01'),
  (2, 'Prof. Jonathan Benjamin Moore', '1965-03-22', 'jonathan.benjamin.moore@university.edu', 'Ph.D. in Mathematics', 'Associate Professor', '2002-07-01'),
  (2, 'Prof. Grace Brown', '1963-12-21', 'grace.brown@university.edu', 'Ph.D. in Statistics', 'Professor', '1998-06-01'),
  (2, 'Prof. Laura Davies', '1967-01-08', 'laura.davies@university.edu', 'Ph.D. in Applied Mathematics', 'Professor', '2003-09-01'),
  (2, 'Prof. Quinn Williams', '1970-07-11', 'quinn.williams@university.edu', 'Ph.D. in Mathematics Education', 'Associate Professor', '2005-03-01'),
  (2, 'Mr. Daniel Ramirez', '1987-06-03', 'daniel.ramirez@university.edu', 'M.Sc. in Mathematics', 'Lecturer', '2018-02-01'),
  (3, 'Ms. Charlotte Lee', '1982-11-09', 'charlotte.lee@university.edu', 'M.Sc. in Information Systems', 'Lecturer', '2018-09-01'),
  (3, 'Mr. Isaac Hernandez', '1988-02-17', 'isaac.hernandez@university.edu', 'M.B.A. in Information Technology Management', 'Lecturer', '2020-05-01'),
  (3, 'Ms. Jessica Young', '1985-06-06', 'jessica.young@university.edu', 'Ph.D. in Information Systems', 'Assistant Professor', '2016-10-01'),
  (3, 'Mr. Michael Clark', '1997-03-14', 'michael.clark@university.edu', 'M.Sc. in Information Systems Security', 'Lecturer', '2023-05-01'),
  (3, 'Ms. Olivia Roberts', '1984-09-01', 'olivia.roberts@university.edu', 'Ph.D. in Information Technology', 'Assistant Professor', '2014-02-01');

-- Computer Science Courses
INSERT INTO "courses" ("title", "credits", "prerequisites", "semester", "department_id")
VALUES
  ('Introduction to Programming', 3, '-', '1', 1),
  ('Computer Architecture and Organization', 3, '-', '1', 1),
  ('Web Development', 3, '-', '1', 1),
  ('Introduction to Cybersecurity', 3, '-', '1', 1),
  ('Data Structures and Algorithms', 3, 'Introduction to Programming', '2', 1),
  ('Database Management Systems', 3, 'Introduction to Programming', '2', 1),
  ('Software Engineering', 3, '-', '2', 1),
  ('Operating Systems', 3, 'Computer Architecture and Organization', '2', 1),
  ('Machine Learning', 3, 'Calculus I (from Math)', '2', 1),
  ('Compiler Design', 3, 'Data Structures and Algorithms', '3', 1),
  ('Computer Networks', 3, 'Introduction to Programming', '3', 1),
  ('Human-Computer Interaction', 3, 'Introduction to Programming', '3', 1),
  ('Web Application Development', 3, 'Web Development', '3', 1),
  ('Computer Graphics', 3, '-', '3', 1),
  ('Artificial Intelligence', 3, 'Machine Learning', '4', 1),
  ('Software Design Patterns', 3, 'Software Engineering', '4', 1),
  ('Database Security', 3, 'Database Management Systems', '4', 1),
  ('Parallel and Distributed Computing', 3, 'Operating Systems', '4', 1),
  ('Computer Ethics', 3, '-', '4', 1),
  ('Natural Language Processing', 3, 'Artificial Intelligence', '5', 1),
  ('Compiler Optimization', 3, 'Compiler Design', '5', 1),
  ('Software Testing and Quality Assurance', 3, 'Software Engineering', '5', 1),
  ('Distributed Systems', 3, 'Computer Networks', '5', 1),
  ('Introduction to Robotics', 3, '-', '5', 1),
  ('Computer Vision', 3, 'Computer Graphics', '6', 1),
  ('Machine Learning Applications', 3, 'Machine Learning', '6', 1),
  ('Software Architecture', 3, 'Software Design Patterns', '6', 1),
  ('Database Administration', 3, 'Database Security', '6', 1),
  ('Information Security', 3, 'Introduction to Cybersecurity', '6', 1),
  ('Capstone Project', 3, 'Min. 120 credits', '8', 1);

-- Mathematics
INSERT INTO "courses" ("title", "credits", "prerequisites", "semester", "department_id") VALUES
  ('Calculus I', 4, '-', '1', 2),
  ('Linear Algebra', 3, '-', '1', 2),
  ('Probability and Statistics', 3, '-', '1', 2),
  ('History of Mathematics', 3, '-', '1', 2),
  ('Calculus for Business', 3, '-', '1', 2),
  ('Calculus II', 4, 'Calculus I', '2', 2),
  ('Differential Equations', 3, 'Calculus I', '2', 2),
  ('Numerical Analysis', 3, 'Calculus II, Linear Algebra', '2', 2),
  ('Discrete Mathematics for Computer Science', 3, '-', '2', 2),
  ('Introduction to Mathematical Modeling', 3, 'Calculus I, Probability and Statistics', '2', 2),
  ('Abstract Algebra', 3, 'Linear Algebra', '3', 2),
  ('Real Analysis', 3, 'Calculus II', '3', 2),
  ('Mathematical Statistics', 3, 'Probability and Statistics', '3', 2),
  ('Cryptography', 3, 'Discrete Mathematics for Computer Science', '3', 2),
  ('Introduction to Topology', 3, 'Calculus I', '3', 2),
  ('Complex Analysis', 3, 'Real Analysis', '4', 2),
  ('Differential Geometry', 3, 'Abstract Algebra', '4', 2),
  ('Optimization Techniques', 3, 'Calculus II', '4', 2),
  ('Mathematical Biology', 3, 'Calculus I', '4', 2),
  ('Introduction to Chaos Theory', 3, 'Calculus II', '4', 2),
  ('Numerical Linear Algebra', 3, 'Linear Algebra', '5', 2),
  ('Functional Analysis', 3, 'Real Analysis', '5', 2),
  ('Stochastic Processes', 3, 'Mathematical Statistics', '5', 2),
  ('Combinatorics', 3, 'Discrete Mathematics for Computer Science', '5', 2),
  ('Mathematical Physics', 3, '-', '5', 2),
  ('Partial Differential Equations', 3, 'Differential Geometry', '6', 2),
  ('Algebraic Topology', 3, 'Introduction to Topology', '6', 2),
  ('Optimization Theory', 3, 'Optimization Techniques', '6', 2),
  ('Financial Mathematics', 3, 'Probability and Statistics', '6', 2),
  ('Fuzzy Logic and Neural Networks', 3, '-', '6', 2),
  ('Research Paper', 3, 'Min. 120 credits', '8', 2);

-- Information Systems
INSERT INTO "courses" ("title", "credits", "prerequisites", "semester", "department_id") VALUES
  ('Introduction to Information Systems', 3, '-', '1', 3),
  ('Networking Fundamentals', 3, '-', '1', 3),
  ('Business Process Analysis', 3, '-', '1', 3),
  ('User Experience', 3, '-', '1', 3),
  ('Systems Analysis and Design', 3, 'Introduction to Information Systems', '2', 3),
  ('Data Warehousing and Business Intelligence', 3, 'Database Management Systems(from CS)', '2', 3),
  ('Information Systems Project Management', 3, '-', '2', 3),
  ('Network Security', 3, 'Networking Fundamentals', '2', 3),
  ('E-commerce and Digital Marketing', 3, '-', '2', 3),
  ('Database Administration', 3, 'Database Management Systems(from CS)', '3', 3),
  ('Enterprise Resource Planning (ERP) Systems', 3, 'Introduction to Information Systems', '3', 3),
  ('Business Intelligence and Data Analytics', 3, 'Probability and Statistics (from Math)', '3', 3),
  ('Information Systems Security Management', 3, 'Introduction to Cybersecurity', '3', 3),
  ('Web Programming', 3, 'Introduction to Web Design', '3', 3),
  ('IT Infrastructure Management', 3, 'Networking Fundamentals', '4', 3),
  ('Cloud Computing', 3, 'Database Management Systems(from CS)', '4', 3),
  ('Social Media Marketing', 3, 'E-commerce and Digital Marketing', '4', 3),
  ('Big Data Management', 3, 'Database Warehousing and Business Intelligence', '4', 3),
  ('Information Systems Auditing', 3, 'Systems Analysis and Design', '4', 3),
  ('Business Process Modeling and Simulation', 3, 'Systems Analysis and Design', '5', 3),
  ('Data Mining and Machine Learning for Business', 3, 'Business Intelligence and Data Analytics', '5', 3),
  ('Systems Integration', 3, '-', '5', 3),
  ('Information Systems Strategy and Management', 3, '-', '5', 3),
  ('Mobile Application Development', 3, 'Web Programming', '5', 3),
  ('Business Intelligence and Big Data Analytics', 3, 'Big Data Management', '6', 3),
  ('Information Systems Project Management', 3, '-', '6', 3),
  ('Information Technology Law and Ethics', 3, '-', '6', 3),
  ('User Experience Design', 3, '-', '6', 3),
  ('E-commerce and Social Media Analytics', 3, 'Social Media Marketing', '6', 3),
  ('Internship Project', 3, 'Min. 120 credits', '8', 3);

-- Computer Science students
INSERT INTO "students" ("name", "birthdate", "enrollment_year", "department_id") VALUES
('Alice Marie Anderson', '2004-01-01', 2023, 1),
('Bob William Baker', '2005-10-09', 2023, 1),
('Sarah Sanchez', '2005-07-07', 2023, 1),

-- Mathematics students
('William Charles Williams', '2003-01-01', 2023, 2),
('Sophia Rose Smith', '2005-02-02', 2023, 2),
('Lily Marie Johnson', '2005-01-01', 2023, 2),

-- Information Systems students
('Daniel Baker', '2005-06-06', 2023, 3),
('Noah Garcia', '2005-06-18', 2023, 3),
('Liam Clark', '2005-11-03', 2023, 3);


INSERT INTO "course_selections" ("student_id", "semester", "academic_year", "course_1", "course_2", "course_3", "course_4", "course_5") VALUES
-- Computer Science
((SELECT "id" FROM "students" where "name" = 'Alice Marie Anderson'), '1', '2023/24: Fall', 1, 2, 3, 4, 31),
((SELECT "id" FROM "students" where "name" = 'Bob William Baker'), '1', '2023/24: Fall', 1, 2, 3, 4, 31),
((SELECT "id" FROM "students" where "name" = 'Sarah Sanchez'), '1', '2023/24: Fall', 1, 2, 3, 4, 31),

-- Mathematics
((SELECT "id" FROM "students" WHERE "name" = 'William Charles Williams'), '1', '2023/24: Fall', 31, 32, 33, 34, 35),
((SELECT "id" FROM "students" WHERE "name" = 'Sophia Rose Smith'), '1', '2023/24: Fall', 31, 32, 33, 34, 35),
((SELECT "id" FROM "students" WHERE "name" = 'Lily Marie Johnson'), '1', '2023/24: Fall', 31, 32, 33, 34, 35),
-- Information Systems
((SELECT "id" FROM "students" WHERE "name" = 'Daniel Baker'), '1', '2023/24: Fall', 62, 63, 64, 65, 33),
((SELECT "id" FROM "students" WHERE "name" = 'Noah Garcia'), '1', '2023/24: Fall', 62, 63, 64, 65, 33),
((SELECT "id" FROM "students" WHERE "name" = 'Liam Clark'), '1', '2023/24: Fall', 62, 63, 64, 65, 33);

INSERT INTO "classes" ("course_id", "lecturer_id", "academic_year", "meeting_day", "start_time", "end_time", "meeting_location", "capacity") VALUES
((SELECT "id" FROM "courses" WHERE "title" = 'Calculus I'), (SELECT "id" FROM 'lecturers' WHERE "name" = 'Prof. Grace Brown'), '2023/24: Fall', 'Tuesday', '09:00', '12:00', 'Class A', '30'),
((SELECT "id" FROM "courses" WHERE "title" = 'Probability and Statistics'), (SELECT "id" FROM 'lecturers' WHERE "name" = 'Prof. Quinn Williams'), '2023/24: Fall', 'Friday', '14:00', '16:30', 'Class C (Building C)', '50');

INSERT INTO "attendances" ("class_id", "student_id", "week_1") VALUES
(1, 1, 'attend'),
(1, 2, 'attend'),
(1, 3, 'permit'),
(1, 6, 'attend'),
(1, 7, 'attend'),
(1, 8, 'attend');

UPDATE "attendances" SET
  "week_2" = 'attend', "week_2" = 'attend', "week_2" = 'attend',
  "week_2" = 'attend', "week_2" = 'attend', "week_2" = 'attend'
WHERE "student_id" = 1 OR "student_id" = 2 OR "student_id" = 3
OR "student_id" = 6 OR "student_id" = 7 OR "student_id" = 8;
