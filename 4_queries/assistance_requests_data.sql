SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, assignments.duration as duration
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN assignments ON assignments.id = assignment_id
JOIN students ON students.id = student_id
ORDER BY duration DESC;
