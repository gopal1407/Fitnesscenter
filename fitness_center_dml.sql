USE `Mini project`;
 
DROP TABLE IF EXISTS WorkoutSessions;
DROP TABLE IF EXISTS Members;

CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO Members (id, name, age) VALUES
(1, 'Jane Doe', 28),
(2, 'John Smith', 35),
(3, 'Alice Johnson', 24);

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) VALUES
(101, 1, '2025-04-01', 'Morning', 'Cardio'),
(102, 2, '2025-04-01', 'Evening', 'Weight Training'),
(103, 3, '2025-04-01', 'Afternoon', 'Yoga');

UPDATE WorkoutSessions
SET session_time = 'Evening'
WHERE member_id = (
    SELECT id FROM Members WHERE name = 'Jane Doe'
);

DELETE FROM WorkoutSessions
WHERE member_id = (
    SELECT id FROM (SELECT id FROM Members WHERE name = 'John Smith') AS temp
);

DELETE m FROM Members m
JOIN (
    SELECT id FROM Members WHERE name = 'John Smith'
) AS target ON m.id = target.id;
