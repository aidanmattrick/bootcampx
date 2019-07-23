-- SELECT assignments.id as id, assignments.name as name, assignments.day as day, assignments.chapters as chapters
-- FROM (
--   SELECT count(assistance_requests.assignment_id) as total_requests
--   FROM assistance_requests
--   JOIN assignments ON assignments.id = assistance_requests.assignment_id
--   ORDER BY total_requests DESC
-- );

SELECT assignments.id, name, day, chapter, assignments.name, count(assistance_requests) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;