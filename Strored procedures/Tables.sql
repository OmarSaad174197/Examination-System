CREATE DATABASE ExamSystem
GO
USE ExamSystem
GO

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    St_FName NVARCHAR(25) NOT NULL,
    St_LName NVARCHAR(25) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Email NVARCHAR(50) UNIQUE NOT NULL,
    Password NVARCHAR(25) NOT NULL,
    PhoneNumber NVARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY IDENTITY(1,1), 
    Ins_FName NVARCHAR(25) NOT NULL,
    Ins_LName NVARCHAR(25) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    Email NVARCHAR(50) UNIQUE NOT NULL,
    Password NVARCHAR(25) NOT NULL,
    PhoneNumber NVARCHAR(15),
    HireDate DATE NOT NULL,
    Specialization NVARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1), 
    CourseName NVARCHAR(100) NOT NULL,
    CourseDescription NVARCHAR(255),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);


CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    AttemptNumber INT, 
    Grade NVARCHAR(2),
    PRIMARY KEY (StudentID, CourseID, AttemptNumber),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Topic (
    CourseID INT,
    TopicName NVARCHAR(50),
    PRIMARY KEY (CourseID, TopicName),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


CREATE TABLE Exams (
    ExamID INT PRIMARY KEY IDENTITY(1,1),
    ExamName NVARCHAR(100) NOT NULL,
    StartTime DATETIME NOT NULL,
    Duration INT NOT NULL,
    CreatedTime DATETIME NOT NULL,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Questions (
    QuestionID INT PRIMARY KEY IDENTITY(1,1),
    QuestionText NVARCHAR(255) NOT NULL,
    QuestionType NVARCHAR(10) CHECK (QuestionType IN ('TF', 'MCQ')), 
    Mark FLOAT NOT NULL,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE ExamQuestions (
    QuestionID INT,
    ExamID INT,
    PRIMARY KEY (QuestionID, ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

CREATE TABLE Choices (
    ChoiceID INT PRIMARY KEY IDENTITY(1,1),
    ChoiceText NVARCHAR(255) NOT NULL
);


CREATE TABLE QuestionChoices (
    QuestionID INT,
    ChoiceID INT,
    IsCorrect BIT NOT NULL,
    PRIMARY KEY (QuestionID, ChoiceID),
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID),
    FOREIGN KEY (ChoiceID) REFERENCES Choices(ChoiceID)
);


CREATE TABLE ExamStudentAnswer (
    ExamID INT,
    StudentID INT,
    QuestionID INT,
    ChoiceID INT,
    PRIMARY KEY (ExamID, StudentID, QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID),
    FOREIGN KEY (ChoiceID) REFERENCES Choices(ChoiceID)
);
CREATE TYPE StudentAnswersType AS TABLE
(
    QuestionId INT,
    CorrectChoiceId INT
);

