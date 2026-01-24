/* WEEK 1: SQL Fundamentals 
   Concepts: 
   - Data Filtering: WHERE, BETWEEN, IN, LIKE
   - Sorting & Constraints: ORDER BY, LIMIT
   - Aggregations: SUM, AVG, COUNT, MIN/MAX
   - Data Grouping: GROUP BY, HAVING
   Platform: [SQL Academy](https://sql-academy.org/ru/trainer) 
*/

-- Task #6: Which companies have flown on Boeing
-- Skills: INNER JOIN, AS, WHERE
SELECT DISTINCT c.name
FROM Company AS c
JOIN Trip AS t ON c.id = t.company
WHERE t.plane LIKE 'Boeing%';

-- Task #8: What cities can I fly to from Paris and how long will it take?
-- Skills: COUNT
SELECT town_to, 
       (time_in - time_out) AS flight_time
FROM Trip
WHERE town_from = 'Paris';

-- Task #11: Print the passengers with the longest full name. 
-- Skills: MAX, LENGTH
SELECT name
FROM Passenger
WHERE LENGTH(name) = (
    SELECT MAX(LENGTH(name))
    FROM Passenger
);

-- Task #14: Which cities did Bruce Willis visit
-- Skills: INNER JOIN
SELECT DISTINCT t.town_to
FROM Passenger AS p
JOIN Pass_in_trip AS pit ON p.id = pit.passenger
JOIN Trip AS t ON pit.trip = t.id
WHERE p.name = 'Bruce Willis';

-- Task #20: How much and who from the family spent on entertainment. Print family status, name, amount
-- Skills: INNER JOIN
SELECT fm.status, fm.member_name, sum(p.amount*p.unit_price) AS costs
FROM FamilyMembers AS fm 
JOIN Payments AS p ON fm.member_id = p.family_member 
JOIN goods AS g ON p.good = g.good_id
JOIN GoodTypes AS gt ON g.type = gt.good_type_id
WHERE gt.good_type_name = 'entertainment'
GROUP BY fm.status, fm.member_name;

-- Task #29: Print the names of passengers who flew to Moscow on TU-134. There should be no duplicates in the response.
-- Skills: INNER JOIN, AND
SELECT DISTINCT p.name 
FROM passenger AS P
JOIN Pass_in_trip AS PIT ON p.id = pit.passenger
JOIN trip AS T ON pit.trip = t.id
WHERE t.town_to = 'Moscow' AND t.plane = 'TU-134'
