CREATE DATABASE college;

USE college;

/*Table structure for table `Col_students` */

DROP TABLE IF EXISTS Col_students;

CREATE TABLE Col_students (
  Student_Id int(11) NOT NULL,
  Name varchar(50) NOT NULL,
  Gender varchar(50) NOT NULL,
  DOB int(11) NOT NULL,
  Email varchar(50) NOT NULL,
  Password varchar(50) DEFAULT NULL,
  Phone INT(50)  NULL,
  Address1 varchar(50) NOT NULL,
  Program varchar(15) DEFAULT NULL,
  constraint students_pk primary key (Student_Id)
  -- add some other attributes if you like here.
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE Col_students
ADD COLUMN  City varchar(50) NOT NULL,
ADD COLUMN State varchar(50) NOT NULL,
ADD COLUMN Country varchar(50) NOT NULL DEFAULT "USA",
ADD COLUMN Credit_required INT(50) DEFAULT NULL;

ALTER TABLE Col_students
MODIFY Student_Id int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE Col_students
MODIFY COLUMN DOB DATETIME;


ALTER TABLE Col_students
MODIFY COLUMN Gender varchar(5);




/*Data for the table `Col_students` */

INSERT INTO Col_students(Student_Id,Name,Gender,DOB,Email,Password,Phone,Address1,City,State,Credit_required,Program) values
							(99990098,"Megha Baral","F","1991-05-10","MBARAL1096@muleriders.saumag.edu","mbaral1096",514333222,"2212 pink road","Monroe","LA",9,"Graduate"),
                           ( 99900097,"Joseph Smith","M","2000-06-15","JSMITH1198@muleriders.saumag.edu","JSMITH1198",314555222,"2251 blue road","Magnolia","AR",30,"Under_Graduate"),
                           (99900095,"Ada William","F","1993-07-20","AWillion1234@muleriders.saumag.edu","AWillion1234",518333222,"2281 yellow road","Shreport","LA",6,"Gradute"),
						   (99999912,"Adam Johnson","M","2001-03-10","AJohnsom4321@muleriders.saumag.edu","AJOHNSON4321",518111222,"2281 green road","Calhoun","AR",40,"Under_Gradute"),
						   (99900059,"Sharmila Sharma","F","1995-03-15","SSharma1234@muleriders.saumag.edu","Ssharma1234",NULL,"2281 white road","LittleRock","AR",9,"Gradute");

INSERT INTO Col_students(Student_Id,Name,Gender,DOB,Email,Password,Phone,Address1,City,State,Credit_required,Program) values
					(99900559,"Dinesh Aryal","M","1994-12-15","DAryal5566@muleriders.saumag.edu","DARYAL1234",NULL,"2118 BLACK road","Dallas","TX",20,"Under_Gradute"),
                    (99900995,"Adam Smith","M","2001-03-15","ASMITH1111@muleriders.saumag.edu","ASMITH1111",318000111,"2281 oliver road","Arlington","TX",12,"Gradute"),
                    (99900554,"Johnson Johnson","M","2002-01-25","JJohnson5432@muleriders.saumag.edu","JJohnson5432",111222444,"2115 north road","Plano","TX",15,"Gradute"),
                    (99900112,"Pragya Lama","F","1993-10-23","PLama1234@muleriders.saumag.edu","PLAMA9999",NULL,"2000 olivernorth road","Plano","TX",20,"Under_Gradute"),
                    (99911221,"Johnson Smith","M","1990-02-21","JSMITH5677@muleriders.saumag.edu","JSMITH5677",999000111,"1276 lacari street","Magnolia","AR",15,"Graduate");

-- UPDATE Col_students
-- SET NAME = 'Sharmila Sharma', Program= 'CSCI'
-- WHERE Student_Id = 99900059 ;

DROP TABLE IF EXISTS Col_undergrad;

CREATE TABLE Col_undergrad
(
Major varchar(50) NOT NULL,
Student_Id int(11) NOT NULL,
CONSTRAINT Col_undergrad_ibfk_1 FOREIGN KEY (Student_Id) REFERENCES Col_students (Student_Id)
 -- add some other attributes if you like here.
 );

 INSERT INTO Col_undergrad(Major,Student_Id) values
							("CIS",99990098),
                            ("B.Tech",99990098),
                            ("BBA",99900559),
                            ("MGMT",99990098),
                            ("BSCI",99990098),
                            ("CIS",99900559),
                            ("CIS",99990098),
                            ("B.A.Com",99990098),
                            ("B.Tech",99990098);

DROP TABLE IF EXISTS Col_grad;

CREATE TABLE Col_grad
(
Major varchar(50) NOT NULL,
Student_Id int(11) NOT NULL,
CONSTRAINT Col_grad_ibfk_ FOREIGN KEY (Student_Id) REFERENCES Col_students (Student_Id)
 -- add some other attributes if you like here.
 );


 INSERT INTO Col_grad(Major,Student_Id) values
							("MCIS",99900097),
                            ("ECON",99900559),
                            ("MBA",99990098),
                            ("MGMT",99900097),
                            ("MCIS",99900559),
                            ("MCIS",99900559),
                            ("MGMT",99900559),
                            ("MA",99900097),
                            ("M.Com",99900097);

DROP TABLE IF EXISTS Col_teacher;

CREATE TABLE Col_teacher(
  Teacher_Id int(20) NOT NULL,
  Name varchar(50) NOT NULL,
  DOB int(20) NOT NULL,
  Email varchar(50) NOT NULL,
  Password varchar(50) DEFAULT NULL,
  Phone varchar(50) NOT NULL,
  Address varchar(50) NOT NULL,
constraint teacher_pk primary key (`Teacher_Id`)
);


ALTER TABLE Col_teacher
ADD COLUMN  City varchar(50) NOT NULL,
ADD COLUMN State varchar(20) NOT NULL,
ADD COLUMN Country varchar(10) NOT NULL DEFAULT 'USA';

ALTER TABLE Col_teacher
MODIFY Teacher_Id int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE Col_teacher
MODIFY COLUMN DOB DATE;


ALTER TABLE Col_teacher
MODIFY COLUMN Phone varchar(10);
-- dml Queries--

INSERT INTO Col_teacher(Teacher_Id,Name,DOB,Email,Password,Phone,Address,City,State) values
						(001,"Ahmad","1975-01-01","Ahmad1234@muleriders.saumag.edu","Ah@1234$",9988774455,"2212 Linda","Magnolia","AR"),
						(002,"Kumar","1976-02-09","Kumar4321@muleriders.saumag.edu","Ku$4321@",9182734556,"1300 Jackson","Bentonville","AR"),
						(003,"Maria","1977-12-19","Maria2011@muleriders.saumag.edu","Ma20@111",7707302304,"1811 Mary","Hope","AR"),
						(004,"Krish","1979-11-29","Krish2016@muleriders.saumag.edu","Kr2!0176",7105302324,"1051 King","Camden","AR"),
						(005,"Rachell","1969-05-18","Rache1988@muleriders.saumag.edu","Ra@198#1",4695302014,"1211 Lynn","Magnolia","AR"),
						(006,"Sanju","1988-06-11","Sanj1957@muleriders.saumag.edu","San@195#",5106109910,"2547 Jerry","Minden","LA"),
						(007,"Ajay","1990-06-26","Aj1990@muleriders.saumag.edu","Aj123456@",9145678236,"1598 Marshall","Marshall","AR"),
						(008,"Bony","1989-08-08","Bony1658@muleriders.saumag.edu","Bony@1234",6453219875,"1968 Lacari","Magnolia","AR"),
						(009,"Shelley ","1985-04-16","Shell1958@muleriders.saumag.edu","Sh!@3455",3166549875,"1211 Lee","Monroe","LA"),
						(010,"Radley","1979-09-15","Radal010@muleriders.saumag.edu","Rad!1234@",1234567892,"1234 Jeff","Malvern","AR"),
						(011,"Roy","1991-06-15","Roy0210@muleriders.saumag.edu","Roy@56478!",9578642233,"2213 Kerry","Magnolia","AR");


select * from Col_teacher;

select * from Col_teacher where Teacher_Id = 001;

select Teacher_Id,Name from Col_teacher where City = "Magnolia";


DELETE FROM Col_teacher WHERE Teacher_Id = 011;

 DROP TABLE IF EXISTS Col_course;

CREATE TABLE Col_course
(
Course_Id INT(15) NOT NULL,
Teacher_Id int(15) NOT NULL,
Course_Name varchar(50) NOT NULL,
Announcements varchar(50) NOT NULL,
Course_Materials varchar(50) NOT NULL,
constraint course_Pk primary key (`Course_Id`),
CONSTRAINT `Col_course_ibfk_1` FOREIGN KEY (`Teacher_Id`) REFERENCES `Col_teacher` (`Teacher_Id`)
 -- add some other attributes if you like here.
 );


INSERT INTO Col_course(Course_Id,Teacher_Id,Course_Name,Announcements,Course_Materials) values
						(6273,001,"Data Mining","QUIZ 1 IS DUE","Chapter 1"),
                        (5133,002,"DB management system","QUIZ 1 5%","Chapter 2"),
                        (6263,003,"Big Data","Assignment I due on nov 10","Chapter 4"),
                        (2003,004,"Business Communication","Project 1 is due on sep 2","week 1to3"),
                        (3023,005,"Theory & Communication","Tommorow class is canceled","week 3to4"),
                        (1102,006,"Introduction to Computing","Lab 1 is due on aug 11","What is computing"),
                        (1003,007,"World history I","write an essay on world history","Chapter 5"),
                        (3003,008,"quality control","mid term is due on oct 2","week 1 to 7");


DROP TABLE IF EXISTS Col_enroll;

CREATE TABLE Col_enroll
(
Num_of_courses int(15) NOT NULL,
Term int(15) NOT NULL,
Student_Id int(11) NOT NULL,
Course_Id int(11) NOT NULL,
CONSTRAINT Col_enroll_ibfk_1 FOREIGN KEY (Student_Id) REFERENCES Col_students (Student_Id),
CONSTRAINT Col_enroll_ibfk_2 FOREIGN KEY (Course_Id) REFERENCES Col_course (Course_Id)
 -- add some other attributes if you like here.
 );


ALTER TABLE Col_enroll
MODIFY COLUMN Term varchar(25);


 INSERT INTO Col_enroll(Num_of_courses,Term,Student_Id,Course_Id) values
						(3,"Fall",99900559,1003),
                        (5,"Spring",99900095,1003),
                        (3,"Summer I",99999912,1003),
                        (2,"Summer II",99900112,3003),
                        (1,"Fall Intersession",99900995,3003),
                        (6,"Fall",99911221,1102),
                        (5,"Spring",99900995,1102),
                        (2,"Summer I",99900095,1102),
                        (1,"Summer II",99900095,1102);

DROP TABLE IF EXISTS Col_assignment;

CREATE TABLE  Col_assignment(
Assignment_Id int(20) NOT NULL,
Teacher_Id int(15) NOT NULL,
Question varchar(50) NOT NULL,
Due_Date varchar(50) NOT NULL,
Course_Id int(50) NOT NULL,
Student_Id  int(20) NOT NULL,
CONSTRAINT assignment_pk PRIMARY KEY (Assignment_Id),
CONSTRAINT Col_assignment_fk1 FOREIGN KEY (Teacher_Id) REFERENCES Col_teacher(Teacher_Id),
CONSTRAINT Col_assignment_fk2 FOREIGN KEY (Course_Id) REFERENCES Col_course(Course_Id),
CONSTRAINT Col_assignment_fk3 FOREIGN KEY (Student_Id) REFERENCES Col_students(Student_Id)
 );

ALTER TABLE Col_assignment
MODIFY COLUMN Due_Date DATE;
-- dml queries
INSERT INTO Col_assignment(Assignment_Id,Teacher_Id,Question,Due_Date,Course_Id,Student_Id)values
							(1,001,"What is data?","2020-10-20",5133,99911221),
							(2,002,"Describe in few words about data mining?","2020-10-21",6273,99900112),
							(3,003,"What is big data?","2020-10-22",6263,99900554),
							(4,004,"Define the main uses about Business Communication?","2020-10-23",2003,99900995),
							(5,005,"Describe about Theory & Communication?","2020-10-24",3023,99900559),
							(6,006,"which components are useful for computing?","2020-10-25",1102,99900059),
							(7,007,"How do you check quality of the logic?","2020-10-26",3003,99999912),
							(8,008,"write about World history in few words?","2020-10-27",1003,99900095);


select * from Col_assignment where Assignment_Id = 5;
select * from Col_assignment where Student_Id = 99900995;


DROP TABLE IF EXISTS Col_submission;

CREATE TABLE Col_submission (
  Submission_Id int(20) NOT NULL,
  Upload_Date date NOT NULL,
  Upload_Time time NOT NULL,
  Answer varchar(200) NOT NULL,
  Assignment_Id int(11) NOT NULL,
  Course_Id int(11) NOT NULL,
  Student_Id int(11) NOT NULL,
  Teacher_Id int(11) NOT NULL,
   CONSTRAINT submission_pk PRIMARY KEY (Submission_id),
   CONSTRAINT Col_submission_fk1 FOREIGN KEY (Assignment_Id) REFERENCES Col_assignment (Assignment_Id),
  CONSTRAINT Col_submission_fk2 FOREIGN KEY (Course_Id) REFERENCES Col_course (Course_Id),
  CONSTRAINT Col_submission_fk3 FOREIGN KEY (Student_Id) REFERENCES Col_students (Student_Id),
  CONSTRAINT Col_submission_fk4 FOREIGN KEY (Teacher_Id) REFERENCES Col_teacher (Teacher_Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO Col_submission(Submission_Id,Upload_Date,Upload_Time,Answer,Assignment_Id,Course_Id,Student_Id,Teacher_Id) values
							(11,'2020-10-14','18:23:24','Data is any sort of informatoion stored in computer memory',1,5133,99911221,001),
							(12,'2020-10-13','20:25:19','Data minning is process of discovering patterns in large data sets',2,6273,99900112,002),
							(13,'2020-10-15','17:11:22','Big data is process of examining large data sets',3,6263,99900554,003),
							(14,'2020-10-16','17:22:30','Business communication uses Executing decision and successful selling',4,2003,99900995,004),
							(15,'2020-10-14','13:22:30','Information transfered between two groups of humans',5,3023,99900559,005),
							(16,'2020-10-14','16:22:30','Motherboared,CPU,RAM',6,1102,99900059,006),
							(17,'2020-10-13','18:22:30','By best practices',7,3003,99999912,007),
							(18,'2020-10-15','21:22:30','History from a global perspective',8,1003,99900095,008);

INSERT INTO Col_submission(Submission_Id,Upload_Date,Upload_Time,Answer,Assignment_Id,Course_Id,Student_Id,Teacher_Id) values
              							(19,'2020-10-14','18:23:24','Data is any sort of informatoion stored in computer memory',1,5133,99900112,001),
              							(20,'2020-10-13','20:25:19','Data minning is process of discovering patterns in large data sets',2,6273,99911221,002);


DROP TABLE IF EXISTS Col_feedback;

CREATE TABLE Col_feedback (
  Feedback_Id int(11) NOT NULL,
  Feedback varchar(100) NOT NULL,
  Assignment_Id int(11) NOT NULL,
  Student_Id int(11) NOT NULL,
  Teacher_Id int(11) NOT NULL,
  Submission_Id int(15) NOT NULL,
  CONSTRAINT feedback_pk PRIMARY KEY (Feedback_Id),
  CONSTRAINT Col_feedback_fk1 FOREIGN KEY (Assignment_Id) REFERENCES Col_assignment(Assignment_Id),
  CONSTRAINT Col_feedback_fk2 FOREIGN KEY (Student_Id) REFERENCES Col_students(Student_Id),
  CONSTRAINT Col_feedback_fk3 FOREIGN KEY (Teacher_Id) REFERENCES Col_teacher(Teacher_Id),
  CONSTRAINT Col_feedback_fk4 FOREIGN KEY (Submission_Id) REFERENCES Col_submission(Submission_Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE Col_feedback
ADD COLUMN  Points int(15) Not NULL;

INSERT INTO Col_feedback(Feedback_Id,Feedback,Assignment_Id,Student_Id,Teacher_Id,Submission_Id,Points) values
							(21,'Good',1,99911221,001,11,11),
							(22,'Average',2,99900112,002,12,7),
							(23,'Very Good',3,99900554,003,13,22),
							(24,'Good',4,99900995,004,14,12),
							(25,'Good',5,99900559,005,15,8),
							(26,'Good',6,99900059,006,16,9),
							(27,'Very Good',7,99999912,007,17,23),
							(28,'Average',8,99900095,008,18,5);
INSERT INTO Col_feedback(Feedback_Id,Feedback,Assignment_Id,Student_Id,Teacher_Id,Submission_Id,Points) values
              							(29,'Good',1,99900112,001,11,15),
              							(30,'Average',2,99911221,002,12,9);

INSERT INTO Col_feedback(Feedback_Id,Feedback,Assignment_Id,Student_Id,Teacher_Id,Submission_Id,Points) values
              							(31,'Excelent',1,99900112,001,15,31),
              							(32,'Excelent',2,99911221,002,16,32);
-- QUERIES TASK 5

-- 1.Write a sql query to find the count of number of MALE and FEMALE STUDENTS
SELECT Gender,
COUNT(Gender)
from Col_students
group by Gender;

SELECT Name FROM Col_students;



-- 2. Write a sql query to find Course_name and term where no.of courses is less than 5.
SELECT Col_course.Course_Name, Num_of_Courses, Col_enroll.Term
FROM Col_course
JOIN Col_enroll ON Col_course.Course_Id = Col_enroll.Course_Id
WHERE Num_of_courses < 5;

SELECT * 
FROM Col_students 
WHERE City='Magnolia';

-- 3. Write a query to update a record where teacher id is 001 and techer id  is 008
UPDATE Col_assignment
SET Question = 'Describe about dbms'
WHERE Teacher_Id = 001 ;

 UPDATE Col_teacher
SET NAME = 'Bhaskar'
WHERE Teacher_Id = 008 ;

-- 4.Write a query to find teacher name and course name and assignment id where the results are sorted in ascending order of teacher name.
SELECT Name,Col_course.Course_Name,Col_assignment.Assignment_Id
 From Col_teacher
 join Col_course on Col_teacher.Teacher_Id= Col_course.Teacher_Id
 join Col_assignment on Col_teacher.Teacher_Id = Col_assignment.Teacher_Id
 order by Name asc;

-- 5.Write a query to create alias name for question ,course name as course and announcement as Assign_detail ,also results should sorted by  desc order of assignment id
  SELECT Assignment_Id,Col_course.Course_Name as 'Course',Question,Col_course.Announcements  as 'Assign_detail'
   From Col_assignment
   join Col_course on Col_assignment.Course_Id = Col_course.Course_Id
   order by  Assignment_Id desc;

-- 6.Write a query to find assignment uploaded in this 10th month.
SELECT Submission_Id,Upload_Date,Upload_Time,Assignment_Id,Course_Id,Student_Id,Teacher_Id
FROM Col_submission
WHERE month(`Upload_Date`) = 10;

-- 7. Aggregate functions. (SUM, AVG, MIN, MAX, COUNT etc.)

-- SUM of points recevied in Feedback for particular student in semester
SELECT SUM(Points), Feedback_Id,Feedback, Points, Submission_Id,Assignment_Id,Student_Id,Teacher_Id
FROM Col_feedback
WHERE Student_Id='99900112';

-- AVG Average results of total assignment submissions for a particular student in semester
SELECT AVG(Points), Feedback_Id,Feedback, Points, Submission_Id,Assignment_Id,Student_Id,Teacher_Id
FROM Col_feedback
WHERE Student_Id=99911221;

-- COUNT of total assignments submitted by particular student in semester
SELECT count(Submission_Id) As 'Total Assignments', Submission_Id,Upload_Date,Upload_Time,Assignment_Id,Course_Id,Student_Id,Teacher_Id
FROM Col_submission
WHERE Student_Id=99911221;

-- Task 6: Views 5 marks


CREATE VIEW MARK_OBTAIN_ON_EACH_TERM
AS
SELECT F.Points,S.Name,E.Term,CASE WHEN Points=0 then 'FAILS'
when Points>0 and Points<10 then 'Average'
when Points>10 and Points<20 then 'Good'
when Points>20 and Points<30 then 'Very Good'
else 'Excelent' end as 'MarkGroup'
from col_feedback AS F
JOIN Col_students AS S
ON F.Student_Id=S.Student_Id
JOIN Col_enroll as E
ON E.Student_Id=F.Student_Id
ORDER BY MarkGroup;

CREATE VIEW CourseMarkwithPoint
AS
SELECT Col_course.Course_Name as 'Course',Question,Col_course.Announcements  as 'Assign_detail',Col_feedback.Points,Col_students.Name
From Col_assignment
join Col_course 
on Col_assignment.Course_Id = Col_course.Course_Id
join Col_feedback
on Col_feedback.Student_Id=Col_assignment.Student_Id
join Col_Students
on Col_assignment.Student_Id=Col_Students.Student_Id
order by Points;

-- NO. of courses taken by each student
CREATE VIEW coursetakenbystudents
AS
SELECT Num_of_courses,col_students.Name
FROM col_enroll
JOIN col_students
ON col_students.Student_Id=col_enroll.Student_Id;



-- Task 7: Performance Tuning
-- QUERY OPTIMIZATION

SELECT Name,Student_Id
FROM Col_students
WHERE City='Magnolia';

SELECT Name 
FROM Col_students
WHERE Name LIKE '%Jo%';

ALTER VIEW coursetakenbystudents
AS
SELECT Num_of_courses,col_students.Name
FROM col_enroll
JOIN col_students
ON col_students.Student_Id=col_enroll.Student_Id
ORDER BY Num_of_courses;

ALTER VIEW coursemarkwithpoint
AS
SELECT Col_course.Course_Name as 'Course',Question,Col_course.Announcements  as 'Assign_detail',Col_feedback.Points,Col_students.Name
From Col_assignment
join Col_course 
on Col_assignment.Course_Id = Col_course.Course_Id
join Col_feedback
on Col_feedback.Student_Id=Col_assignment.Student_Id
join Col_Students
on Col_assignment.Student_Id=Col_Students.Student_Id
order by Points
LIMIT 10;

ALter VIEW MARK_OBTAIN_ON_EACH_TERM
AS
SELECT F.Points,S.Name,E.Term,CASE WHEN Points=0 then 'FAILS'
when Points>0 and Points<10 then 'Average'
when Points>10 and Points<20 then 'Good'
when Points>20 and Points<30 then 'Very Good'
else 'Excelent' end as 'MarkGroup'
from col_feedback AS F
JOIN Col_students AS S
ON F.Student_Id=S.Student_Id
JOIN Col_enroll as E
ON E.Student_Id=F.Student_Id
ORDER BY Points;

-- index 

CREATE INDEX STUDENTS_NAME_IDX
ON Col_students (Name);

CREATE INDEX COLLEGE_NAME_IDX
ON Col_course (Course_Name);












