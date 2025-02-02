# Examination-System
The Examination System is designed to manage students, courses, instructors, and exams efficiently. It facilitates exam generation, question management, student responses, and report generation. This system aims to streamline the examination process and improve accuracy in grading.

Setup & Usage Instructions
    Database Setup
1.	Install Microsoft SQL Server.
2.	Execute the provided SQL scripts to create tables and stored procedures.
3.	Insert initial data (departments, instructors, courses, students, etc.).
   
System Usage
1.	Exam Creation: Use SP_CreateExam to generate new exams.
2.	Adding Questions: Use SP_AddNewQuestion to insert questions.
3.	Student Enrollment: Enroll students using SP_EnrollStudentInCourse.
4.	Exam Execution: Students can start exams using SP_StartExam.
5.	Grading: Calculate student grades using SP_CalculateGrade.
   
Security & Maintenance
•	Regular database backups should be performed.
•	User roles and permissions should be managed carefully to prevent unauthorized access.
•	Stored procedures should be optimized for performance.
