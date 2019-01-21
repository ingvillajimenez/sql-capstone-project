CREATE DATABASE UNIVERSITYJ;

USE UNIVERSITYJ;

CREATE TABLE STUDENT (
    studentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    dormPhone VARCHAR(20) NOT NULL,
    dormName VARCHAR(50) NOT NULL,
    dormRoom INT(3) NOT NULL
);

CREATE TABLE GRADUATION (
    studentID INT,
    FOREIGN KEY (studentID) REFERENCES STUDENT(studentID),
    studentDegree VARCHAR(50) NOT NULL PRIMARY KEY,
    dateEnrolled DATE NOT NULL,
    dateGraduated DATE
);

CREATE TABLE ADVISOR (
    advisorID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL
);

CREATE TABLE DEPARTMENT (
    advisorID INT,
    FOREIGN KEY (advisorID) REFERENCES ADVISOR(advisorID),
    departmentName VARCHAR(50) NOT NULL PRIMARY KEY,
    officeBuildingName VARCHAR(50) NOT NULL,
    OfficeRoom INT(3) NOT NULL,
    OfficePhone VARCHAR(20) NOT NULL
);

CREATE TABLE ADVISOR_STUDENT_DATE (
    advisorID INT,
    studentID INT,
    FOREIGN KEY (advisorID) REFERENCES ADVISOR(advisorID),
    FOREIGN KEY (studentID) REFERENCES STUDENT(studentID),
    startDate DATE NOT NULL,
    endDate DATE
);

CREATE TABLE ALUMNI (
    alumniEmail VARCHAR(50) NOT NULL PRIMARY KEY,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    formerStudentID INT NOT NULL
);

CREATE TABLE COMPANY (
    companyPhone VARCHAR(20) NOT NULL PRIMARY KEY,
    companyName VARCHAR(50) NOT NULL,
    companyAddress VARCHAR(50) NOT NULL,
    companyCity VARCHAR(50) NOT NULL,
    companyState VARCHAR(50) NOT NULL,
    companyZIP INT(5) NOT NULL
);

CREATE TABLE MENTOR (
    mentorEmail VARCHAR(50) NOT NULL PRIMARY KEY,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    alumniEmail VARCHAR(50),
    companyPhone VARCHAR(20) NOT NULL,
    FOREIGN KEY (alumniEmail) REFERENCES ALUMNI(alumniEmail),
    FOREIGN KEY (companyPhone) REFERENCES COMPANY(companyPhone)
);

CREATE TABLE ADVISOR_MENTOR_DATE (
    advisorID INT,
    mentorEmail VARCHAR(50),
    FOREIGN KEY (advisorID) REFERENCES ADVISOR(advisorID),
    FOREIGN KEY (mentorEmail) REFERENCES MENTOR(mentorEmail),
    startDate DATE NOT NULL,
    endDate DATE
);

CREATE TABLE MENTOR_STUDENT_DATE (
    mentorEmail VARCHAR(50),
    studentID INT,
    FOREIGN KEY (mentorEmail) REFERENCES MENTOR(mentorEmail),
    FOREIGN KEY (studentID) REFERENCES STUDENT(studentID),
    startDate DATE NOT NULL,
    endDate DATE
);

CREATE TABLE ALUMNI_HOME (
    alumniEmail VARCHAR(50),
    FOREIGN KEY (alumniEmail) REFERENCES ALUMNI(alumniEmail),
    homeAddress VARCHAR(50) NOT NULL,
    homeCity VARCHAR(50) NOT NULL,
    homeState VARCHAR(50) NOT NULL,
    homeZip INT(5) NOT NULL,
    homePhone VARCHAR(20) NOT NULL
);