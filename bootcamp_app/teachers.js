
const { Pool } = require('pg');

let value = process.argv[2];

const pool = new Pool({
  user: 'vagrant',
  host: 'localhost',
  password: '123',
  database: 'bootcampx'
});

pool.connect();

console.log(value);
pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${value}%'
ORDER BY teacher;
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(user);
     // console.log(`${user.cohort}: ${user.teacher}`);
      // `${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
    });
  }).catch(err => console.error('query error', err.stack));