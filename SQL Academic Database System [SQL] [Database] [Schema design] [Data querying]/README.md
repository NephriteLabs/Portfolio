## Concept
This relational database system is designed to manage and organise academic information for an educational institution, with a robust foundation for tracking student data, course offerings, instructor details, and various academic processes.

### The project included:
- Database creation and schema design
- Table creation for various entities (Students, Courses, Instructors, etc)
- Data insertion
- SQL queries for data retrieval and analysis

## Dataset

The dataset consists of several interconnected tables, including Students, Courses, Instructors, Departments, Enrolment, Grades and other tables.

## Skills and Technologies

- SQL
- Database design
- Data modeling
- Relational database management
- Foreign and primary key relationships
- Data querying

## Development:
The development process involved:

1. Designing the database schema
``` sql
CREATE DATABASE StudentData;
USE StudentData;

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    EnrolmentDate DATE NOT NULL,
    Title VARCHAR(255),
    Major VARCHAR(255)
);

-- [Similar CREATE TABLE statements for other entities]
```

2. Creating tables with appropriate fields and data types
3. Establishing relationships between tables using foreign and primary keys
``` sql
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
```
4. Inserting data into the tables
``` sql
INSERT INTO Students (FirstName, LastName, EnrolmentDate, Title, Major)
VALUES
('Bob', 'Williams', '2021-09-01', 'Calculus I', 'Computer Science'),
('Mary', 'Davis', '2021-09-01', 'Advanced Programming', 'Mathematics'),
-- [More INSERT statements]
```
5. Writing SQL queries to extract and analyse information from the database
``` sql
-- Find all courses in the 'Computer Science' department:
SELECT * FROM Courses WHERE Department = 'Computer Science';

-- Find the total number of credits for each department:
SELECT Department, SUM(Credits) FROM Courses GROUP BY Department;

-- Find all instructors who were hired after '2019-01-01'
SELECT * FROM Instructors WHERE HireDate > '2019-01-01';

-- [More SQL queries]
```
