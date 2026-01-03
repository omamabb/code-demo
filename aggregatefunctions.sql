USE college;

DROP TABLE IF EXISTS student_marks;

CREATE TABLE student_marks(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    math INT,
    physics INT,
    chemistry INT
);

INSERT INTO student_marks (id, name, math, physics, chemistry) VALUES
(1, 'Rahim', 85, 90, 80),
(2, 'Karim', 75, 70, 80),
(3, 'Fatema', 95, 85, 90),
(4, 'Sakib', 65, 60, 70),
(5, 'Taslima', 88, 92, 85),
(6, 'Rony', 55, 60, 58),
(7, 'Jannat', 78, 80, 82),
(8, 'Arif', 90, 88, 85),
(9, 'Nabila', 70, 75, 72),
(10, 'Rashed', 82, 85, 80);
SELECT * FROM student_marks;
-- an aggregate funcitons ignore always NULL  values when it sperform calculation 
-- but it is except from count funtion

-- 1️⃣ COUNT: মোট student সংখ্যা
SELECT COUNT(*) AS total_students FROM student_marks;

-- 2️⃣ SUM: Math এর total marks
SELECT SUM(math) AS total_math_marks FROM student_marks;

-- 3️⃣ AVG: Physics এর average marks
SELECT AVG(physics) AS avg_physics_marks FROM student_marks;

-- 4️⃣ MAX: Chemistry এর highest marks
SELECT MAX(chemistry) AS max_chemistry_marks FROM student_marks;

-- 5️⃣ MIN: Math এর lowest marks
SELECT MIN(math) AS min_math_marks FROM student_marks;

-- 6️⃣ GROUP BY + aggregate: প্রতিটি subject এর average marks
SELECT 
    'Math' AS subject, AVG(math) AS avg_marks FROM student_marks
UNION
SELECT 
    'Physics', AVG(physics) FROM student_marks
UNION
SELECT 
    'Chemistry', AVG(chemistry) FROM student_marks;

-- 7️⃣ GROUP BY student total marks
SELECT 
    name, (math + physics + chemistry) AS total_marks
FROM student_marks
ORDER BY total_marks DESC;
