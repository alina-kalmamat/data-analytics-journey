/* WEEK 2: Joins & Conditional Logic
   Concepts:
   - Joins: INNER, LEFT, RIGHT, FULL OUTER JOIN
   - Set Operators: UNION, UNION ALL
   - Conditional Logic: CASE WHEN, COALESCE
   - Data Integrity: Handling NULLs, preventing row duplication
   Platforms: [SQL Academy](https://sql-academy.org/ru/trainer), [Kaggle](https://www.kaggle.com/learn/intro-to-sql)
*/

-- Task #33: Average price of caviar
-- Skills: INNER JOIN, AVG
SELECT AVG(unit_price) AS cost
FROM Payments
JOIN Goods ON Payments.good = Goods.good_id
WHERE Goods.good_name IN ('red caviar', 'black caviar');

-- Task #40: Subjects of Romashkin P.P.
-- Skills: INNER JOIN
SELECT name AS subjects 
FROM subject 
JOIN schedule ON subject.id = schedule.subject 
JOIN teacher ON schedule.teacher = teacher.id
WHERE LEFT(first_name, 1) = 'P' 
  AND LEFT(middle_name, 1) = 'P' 
  AND last_name = 'Romashkin';

-- Task #44: Minimum age in 10th grades
-- Skills: INNER JOIN, EXTRACT
SELECT MAX(EXTRACT(YEAR FROM age(birthday))) AS max_year 
FROM Student
JOIN Student_in_class ON student.id = Student_in_class.student
JOIN class ON Student_in_class.class = class.id
WHERE class.name LIKE '10%';

-- Task #45: Most used classrooms
-- Skills: SUBQUERY, HAVING
SELECT classroom
FROM Schedule
GROUP BY classroom
HAVING COUNT(*) = (
    SELECT MAX(count_res)
    FROM (
        SELECT COUNT(*) AS count_res
        FROM Schedule
        GROUP BY classroom
    ) AS subquery
);

-- Task #49: Percentage of students in 10A
-- Skills: INNER JOIN, ROUND
SELECT 
    ROUND(
        (COUNT(student)::numeric / (SELECT COUNT(*) FROM Student_in_class)) * 100, 
        4
    ) AS percent
FROM Student_in_class AS sic
JOIN Class AS c ON c.id = sic.class
WHERE c.name = '10 A';

-- Task #55: Delete companies with fewest flights
-- Skills: DELETE, SUBQUERY
DELETE FROM Company
WHERE id IN (
    SELECT company
    FROM Trip
    GROUP BY company
    HAVING COUNT(id) = (
        SELECT COUNT(id) AS trip_count
        FROM Trip
        GROUP BY company
        ORDER BY trip_count ASC
        LIMIT 1
    )
);



