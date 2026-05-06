      
CREATE DATABASE OnlineLearningSystem_db ;
USE OnlineLearningSystem_db ; 

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Course (
	CourseID INT PRIMARY KEY AUTO_INCREMENT , 
    CourseName NVARCHAR(200) NOT NULL,
    Description TEXT,
    Lessons INT DEFAULT 10,
    
    TeacherID INT ,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID) 
    ON DELETE SET NULL ON UPDATE CASCADE 
) ENGINE = InnoDB ; 
 
 CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    BirthDate DATE,
    Email VARCHAR(100) UNIQUE NOT NULL
) ENGINE=InnoDB;

 CREATE TABLE Enrollment (
	EnrollmentID INT PRIMARY KEY AUTO_INCREMENT ,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollDate DATE DEFAULT (CURRENT_DATE) ,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE ,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE ,
    
    UNIQUE KEY Unique_Enrollment (StudentID, CourseID)
 ) ENGINE = InnoDB; 
 
 CREATE TABLE Score (
	ScoreID INT PRIMARY KEY AUTO_INCREMENT, 
    StudentID INT NOT NULL ,
    CourseID INT NOT NULL ,
    MidtermScore DECIMAL(4,2) ,
    FinalScore DECIMAL(4,2) ,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE ,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE ,
    
    CONSTRAINT Check_Score_Range CHECK (MidtermScore BETWEEN 0 AND 10 AND FinalScore BETWEEN 0 AND 10 ) ,
    UNIQUE KEY Unique_Result (StudentID , CourseID) 
 ) ENGINE = InnoDB ; 
 
 
 INSERT INTO Teacher (FullName , Email) 
 VALUES 
('Nguyễn Văn A', 'anv@university.edu.vn'),
('Trần Thị B', 'btt@university.edu.vn'),
('Lê Văn C', 'clv@university.edu.vn'),
('Phạm Minh D', 'dpm@university.edu.vn'),
('Hoàng Lan E', 'ehl@university.edu.vn'); 

INSERT INTO Course (CourseName , Description , Lessons, TeacherID) 
VALUES 
('Lập trình C cơ bản', 'Học về kiểu dữ liệu, vòng lặp', 15, 1),
('Cơ sở dữ liệu SQL', 'Thiết kế và truy vấn CSDL', 12, 2),
('Web Frontend', 'HTML, CSS và JavaScript', 20, 3),
('Cấu trúc dữ liệu', 'Giải thuật và tổ chức dữ liệu', 18, 1),
('Mạng máy tính', 'Giao thức và mô hình OSI', 10, 4); 

INSERT INTO Student (FullName ,BirthDate,Email) 
VALUES 
('Nguyễn Văn Nam', '2005-05-15', 'namnv@gmail.com'),
('Lê Thị Hoa', '2005-08-20', 'hoalt@gmail.com'),
('Trần Minh Tuấn', '2004-12-01', 'tuanmt@gmail.com'),
('Phạm Thảo Vy', '2005-02-10', 'vypt@gmail.com'),
('Đỗ Hùng Dũng', '2005-11-30', 'dungdh@gmail.com'); 

INSERT INTO Enrollment (StudentID, CourseID, EnrollDate)
VALUES 
(1, 1, '2026-04-01'),
(1, 2, '2026-04-02'),
(2, 2, '2026-04-01'),
(3, 3, '2026-04-05'),
(4, 1, '2026-04-10'); 

USE OnlineLearningsystem_db ;
INSERT INTO Score (StudentID, CourseID, MidtermScore) VALUES 
(5, 2, 9.5) ; 
 

UPDATE Student
SET Email = 'nam_new_2026@gmail.com' 
WHERE StudentID = 1;

UPDATE Course 
SET Description = 'Học MySQL cơ bản và nâng cao'
 WHERE CourseID = 2;
 
UPDATE Score 
SET FinalScore = 9.5 
WHERE StudentID = 1 AND CourseID = 1;

DELETE FROM Enrollment 
WHERE EnrollmentID = 5 ; 

SELECT * FROM Student; 

SELECT c.CourseName, t.FullName AS Instructor
FROM Course c
LEFT JOIN Teacher t ON c.TeacherID = t.TeacherID; 

SELECT s.FullName, c.CourseName, sc.MidtermScore, sc.FinalScore
FROM Score sc
JOIN Student s ON sc.StudentID = s.StudentID
JOIN Course c ON sc.CourseID = c.CourseID; 


    