SELECT students.name as student_name, cohorts.name as cohort_name, cohorts.start_date as cohort_start_date, students.start_date as student_student_start_date
FROM students
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date;