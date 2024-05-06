<?php
// Establish an SQLite connection to the local file
$db = new PDO('sqlite:./db.sqlite');

// Set the error mode to exceptions for better error handling
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Create STUDENT table if it does not already exist
$db->exec("
CREATE TABLE IF NOT EXISTS STUDENT (
    Rollno VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Branch VARCHAR(20) NOT NULL,
    Year INT NOT NULL,
    CGPA DECIMAL(5, 2) NOT NULL,
    DOB DATE NOT NULL,
    EmailID VARCHAR(50) NOT NULL
)");

// Create COURSES table if it does not already exist
$db->exec("
CREATE TABLE IF NOT EXISTS COURSES (
    Cid VARCHAR(20) PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    FacultyName VARCHAR(50) NOT NULL
)");

// Create COURSE_TAKEN table if it does not already exist
$db->exec("
CREATE TABLE IF NOT EXISTS COURSE_TAKEN (
    Rollno VARCHAR(20),
    Cid VARCHAR(20),
    FOREIGN KEY (Rollno) REFERENCES STUDENT(Rollno),
    FOREIGN KEY (Cid) REFERENCES COURSES(Cid),
    PRIMARY KEY (Rollno, Cid)
)");
