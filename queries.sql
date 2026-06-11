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
