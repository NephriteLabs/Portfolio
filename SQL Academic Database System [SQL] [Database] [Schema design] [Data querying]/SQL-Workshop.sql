-- Creating database named 'StudentData'
CREATE DATABASE StudentData;
USE StudentData;

-- Create Students Table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    EnrolmentDate DATE NOT NULL,
    Title VARCHAR(255),
    Major VARCHAR(255)
);

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Department VARCHAR(255) NOT NULL,
    Credits INT NOT NULL
);

-- Create Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    HireDate DATE NOT NULL,
    Department VARCHAR(255) NOT NULL
);

-- Create Enrolment Table
CREATE TABLE Enrolment (
    EnrolmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    Semester VARCHAR(255) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

-- Create Grades Table
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    EnrolmentID INT,
    Grade VARCHAR(2) NOT NULL,
    FOREIGN KEY (EnrolmentID) REFERENCES Enrolment(EnrolmentID)
);

-- Create Prerequisites Table
CREATE TABLE IF NOT EXISTS Prerequisites (
    CourseID INT,
    PrerequisiteCourseID INT,
    PRIMARY KEY (CourseID, PrerequisiteCourseID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseID)
);

-- Create Classrooms Table
CREATE TABLE Classrooms (
    ClassroomID INT PRIMARY KEY,
    BuildingName VARCHAR(255) NOT NULL,
    RoomNumber VARCHAR(10) NOT NULL
);

-- Create ClassroomAssignment Table
CREATE TABLE ClassroomAssignment (
    ClassroomAssignmentID INT PRIMARY KEY,
    EnrolmentID INT,
    ClassroomID INT,
    FOREIGN KEY (EnrolmentID) REFERENCES Enrolment(EnrolmentID),
    FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID)
);

-- Inserting data into StudentsData database:

-- Insert data into Students table
INSERT INTO Students (FirstName, LastName, EnrolmentDate, Title, Major)
VALUES
('Bob', 'Williams', '2021-09-01', 'Calculus I', 'Computer Science'),
('Mary', 'Davis', '2021-09-01', 'Advanced Programming', 'Mathematics'),
('Charles', 'Brown', '2021-09-01', 'Calculus II', 'Physics'),
('John', 'Doe', '2021-09-01', 'Introduction to Programming', 'Computer Science'),
('Alice', 'Johnson', '2021-09-01', 'Quantum Physics', 'Mathematics'),
('Jane', 'Smith', '2021-09-01', 'Physics 101', 'Physics');

-- Insert data into Courses table
INSERT INTO Courses (CourseID, Title, Department, Credits)
VALUES
(505, 'Quantum Physics', 'Physics', 4),
(101, 'Introduction to Programming', 'Computer Science', 3),
(606, 'Calculus II', 'Mathematics', 4),
(202, 'Physics 101', 'Physics', 4),
(404, 'Advanced Programming', 'Computer Science', 3),
(303, 'Calculus I', 'Mathematics', 4);

-- Insert data into Instructors table
INSERT INTO Instructors (InstructorID, FirstName, LastName, Department, HireDate)
VALUES
(334, 'Charlie', 'Miller', 'Mathematics', '2018-07-01'),
(556, 'Elizabeth', 'Taylor', 'Physics', '2018-07-01'),
(112, 'Robert', 'Smith', 'Computer Science', '2020-07-01'),
(223, 'Mary', 'Brown', 'Physics', '2019-07-01'),
(667, 'James', 'Johnson', 'Mathematics', '2020-07-01'),
(445, 'Daniel', 'Olsen', 'Computer Science', '2017-07-01');

-- Insert data into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(55, 'Biology'),
(33, 'Mathematics'),
(22, 'Physics'),
(66, 'English'),
(11, 'Computer Science'),
(44, 'Chemistry');

-- Insert data into Enrolment table
INSERT INTO Enrolment (EnrolmentID, Semester)
VALUES
(4504, 'Fall 2023'),
(1201, 'Fall 2023'),
(5605, 'Fall 2023'),
(3403, 'Fall 2023'),
(6706, 'Fall 2023'),
(2302, 'Fall 2023');

-- Insert data into Grades table
INSERT INTO Grades (GradeID, Grade)
VALUES
(5404, 'B'),
(2101, 'A'),
(3202, 'B'),
(6505, 'C'),
(4303, 'A'),
(7606, 'A');

-- Insert data into Classrooms table
INSERT INTO Classrooms (ClassroomID, BuildingName, RoomNumber)
VALUES
(58, 'Tech Building', '310'),
(29, 'Science Building', '102'),
(47, 'Tech Building', '305'),
(18, 'Science Building', '101'),
(61, 'Science Building', '103'),
(32, 'Math Building', '201');

-- Insert data into Classroom Assignment table
INSERT INTO ClassroomAssignment (ClassroomAssignmentID)
VALUES
(9003),
(9002),
(9001),
(9005),
(9006),
(9004);

-- SQL queries:

-- 1) SELECT all student names and their majors:
SELECT FirstName, LastName, Major FROM Students;

-- 2) Find all courses in the 'Computer Science' department:
SELECT * FROM Courses WHERE Department = 'Computer Science';

-- 3) Find all students who are majoring in 'Mathematics':
SELECT * FROM Students WHERE Major = 'Mathematics';

-- 4) Find the total number of credits for each department:
SELECT Department, SUM(Credits) FROM Courses GROUP BY Department;

-- 5) Find the number of students in each major, ordered by the number of students:
SELECT Major, COUNT(*) AS Students FROM Students GROUP BY Major ORDER BY Students;

-- 6) Find all instructors who were hired after '2019-01-01'
SELECT * FROM Instructors WHERE HireDate > '2019-01-01';

-- 7) Find all instructors' names along with their respective department names:
SELECT FirstName, LastName, Department FROM Instructors;

-- 8) Find all students enrolled in 'Quantum Physics':
SELECT * FROM Students WHERE Title = 'Quantum Physics';