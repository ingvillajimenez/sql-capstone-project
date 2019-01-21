-- Show all students ordered by last name in ascendent way.

SELECT * 
FROM STUDENT 
ORDER BY lastName ASC;

-- Write a query to list all the students living in the Whitman dorm.

SELECT * 
FROM STUDENT 
WHERE dormName = 'Whitman'; 

-- Write a query to list the number of students assigned to each faculty advisor.

SELECT 
    CONCAT(AD.firstName, " ", AD.lastName) AS 'Faculty Advisor', 
    COUNT(ST.studentID) AS 'Number of Students'
FROM ADVISOR AD
INNER JOIN ADVISOR_STUDENT_DATE ASD
ON AD.advisorID = ASD.advisorID
INNER JOIN STUDENT ST
ON ASD.studentID = ST.studentID
GROUP BY AD.advisorID;


-- Write a query to list first name, last name, and email, and company name of the alumni working as a mentor in the university.

SELECT
    CONCAT(ME.firstName, ' ', ME.lastName) AS 'Alumni Working as a Mentor',
    AL.alumniEmail AS 'Alumni Email',
    ME.mentorEmail AS 'Mentor Email',
    CO.CompanyName AS 'Company Name'
FROM ALUMNI AL
INNER JOIN MENTOR ME
ON AL.alumniEmail = ME.alumniEmail
INNER JOIN COMPANY CO
ON ME.CompanyPhone = CO.CompanyPhone;