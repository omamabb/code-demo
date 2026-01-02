USE college;
DROP TABLE IF EXISTS student;
CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    admission_date DATE
);
INSERT INTO student (id, name, city, admission_date) VALUES
(1, 'Rahim', 'Dhaka', '2025-01-01'),
(2, 'Karim', 'Chittagong', '2025-01-02'),
(3, 'Fatema', 'Rajshahi', '2025-01-03'),
(4, 'Sakib', 'Khulna', '2025-01-04'),
(5, 'Taslima', 'Barishal', '2025-01-05'),
(6, 'Rony', 'Sylhet', '2025-01-06'),
(7, 'Jannat', 'Mymensingh', '2025-01-07'),
(8, 'Arif', 'Comilla', '2025-01-08'),
(9, 'Nabila', 'Dinajpur', '2025-01-09'),
(10, 'Rashed', 'Gazipur', '2025-01-10');
-- 1️⃣ সব data দেখার জন্য
SELECT * FROM student;

-- 2️⃣ নির্দিষ্ট column দেখার জন্য
SELECT id, name, city FROM student;

-- 3️⃣ নির্দিষ্ট condition দিয়ে filter করা
SELECT * FROM student 
WHERE city = 'Dhaka';

-- 4️⃣ sorting (ascending / descending)
SELECT * FROM student 
ORDER BY admission_date ASC;
SELECT * FROM student 
ORDER BY name DESC;

-- 5️⃣ নির্দিষ্ট row সংখ্যা দেখার জন্য
SELECT * FROM student LIMIT 5;

-- 6️⃣ duplicate values বাদ দিয়ে
SELECT DISTINCT city FROM student;

-- 7️⃣ নির্দিষ্ট condition + sorting
SELECT name, city FROM student WHERE city='Dhaka' ORDER BY name ASC;

-- 8️⃣ pattern match (LIKE)
SELECT * FROM student WHERE name LIKE 'R%';
