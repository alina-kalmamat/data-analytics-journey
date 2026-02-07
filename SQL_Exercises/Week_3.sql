/* WEEK 3: Window Functions
   Concepts:
   - Over Clause: OVER, PARTITION BY
   - Ranking Functions: ROW_NUMBER, RANK, DENSE_RANK
   - Differences between Window Functions and GROUP BY
   Platform: [SQL Academy](https://sql-academy.org/ru/trainer)
*/

-- Task #60: Teachers of 11th grades
-- Skills: SUBQUERY, INNER JOIN
SELECT teacher.id AS teacher 
FROM Teacher
JOIN schedule ON schedule.teacher = teacher.id 
JOIN class ON class.id = schedule.class
WHERE class.name LIKE '11%'
GROUP BY teacher.id
HAVING COUNT(DISTINCT class.id) = (SELECT COUNT(id) FROM class WHERE name LIKE '11%');

-- Task #66: Rooms with all amenities
-- Skills: LEFT JOIN, COALESCE
SELECT 
    r.home_type, 
    r.address, 
    COALESCE(SUM(EXTRACT(DAY FROM (res.end_date - res.start_date))), 0) AS days, 
    COALESCE(SUM(res.total), 0) AS total_fee
FROM Rooms r
LEFT JOIN Reservations res ON r.id = res.room_id
WHERE r.has_tv = true 
  AND r.has_internet = true 
  AND r.has_kitchen = true 
  AND r.has_air_con = true
GROUP BY r.home_type, r.address;


-- Task #68: Last room tenant
-- Skills: ROW_NUMBER, SUBQUERY
SELECT room_id, name, end_date
FROM (
    SELECT 
        res.room_id AS room_id, 
        u.name AS name, 
        res.end_date AS end_date,
        ROW_NUMBER() OVER (PARTITION BY res.room_id ORDER BY res.end_date DESC) AS rn
    FROM Reservations AS res
    JOIN Users AS u ON res.user_id = u.id
) AS ranked_bookings
WHERE rn = 1;


-- Task #70: Categorization of housing by price
-- Skills: CASE WHEN
SELECT 
    CASE WHEN price <= 100 THEN 'economy'
        WHEN price > 100 AND price < 200 THEN 'comfort'
        WHEN price >= 200 THEN 'premium'
    END AS category,
    COUNT(*) AS count
FROM rooms
GROUP BY category

-- Task #71: Percentage of active users
-- Skills: UNION, JOIN, SUBQUERY
SELECT 
    ROUND(
        COUNT(DISTINCT Users.id) * 100.0 / (SELECT COUNT(*) FROM Users), 
        2
    ) AS percent
FROM Users
JOIN (
    SELECT user_id AS active_id FROM Reservations
    UNION 
    SELECT r.owner_id AS active_id 
    FROM Rooms r
    JOIN Reservations res ON r.id = res.room_id
) AS active_list ON Users.id = active_list.active_id;

-- Task #101: User's first order
-- Skills: ROW_NUMBER
SELECT user_id, item
FROM (
    SELECT user_id, item,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_ts ASC) AS rn
    FROM Transactions
) AS ranked_table
WHERE rn = 1;

