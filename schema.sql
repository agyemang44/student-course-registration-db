-- Student Course Registration Database
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    program VARCHAR(50),
    year_level INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_code VARCHAR(10),
    course_name VARCHAR(100),
    credits INT
);

CREATE TABLE registrations (
    student_id INT,
    course_id INT,
    reg_date DATE,
    grade DECIMAL(4,2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
