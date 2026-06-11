-- 1. List all students in CS301
SELECT s.full_name FROM students s 
JOIN registrations r ON s.student_id = r.student_id 
WHERE r.course_id = 101;

-- 2. Count students per course
SELECT c.course_name, COUNT(*) as total_students 
FROM courses c JOIN registrations r ON c.course_id = r.course_id 
GROUP BY c.course_name;

-- 3. Students with no registrations
SELECT full_name FROM students 
WHERE student_id NOT IN (SELECT student_id FROM registrations);

-- 4. Top 3 courses by student enrollment
SELECT c.course_code, c.course_name, COUNT(r.student_id) as total_students
FROM courses c
JOIN registrations r ON c.course_id = r.course_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY total_students DESC
LIMIT 3;

-- 5. Average grade per program
SELECT s.program, ROUND(AVG(r.grade), 2) as avg_gpa
FROM students s
JOIN registrations r ON s.student_id = r.student_id
WHERE r.grade IS NOT NULL
GROUP BY s.program
ORDER BY avg_gpa DESC;
