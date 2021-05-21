/* The database stores data for a consulting company that tracks all charges to projects. The charges are
 based on the hours each employee works on each project. The structure and contents of the database are
 shown in Figure. */

/* Note that the ASSIGNMENT table in Figure stores the JOB_CHG_HOUR values as an attribute
 (ASSIGN_CHG_HR) to maintain historical accuracy of the data. The JOB_CHG_HOUR values
 are likely to change over time. In fact, a JOB_CHG_HOUR change will be reflected in the
 ASSIGNMENT table. And, naturally, the employee primary job assignment might change, so the
 ASSIGN_JOB is also stored. Because those attributes are required to maintain the historical
 accuracy of the data, they are not redundant.

Given the structure and contents of the database shown in Figure, use SQL commands to answer
 Problems 1–20. */

/* 1. Write the SQL code that will create the database: Ch07_ConstructCo and the tables structure
 for all the listed tables (EMPLOYEE, JOB, PROJECT, ASSIGNMENT) */

CREATE DATABASE Ch07_ConstructCo;

USE Ch07_ConstructCo;

DROP TABLE IF EXISTS JOB;
CREATE TABLE JOB (
JOB_CODE	CHAR(3) NOT NULL,
JOB_DESCRIPTION CHAR(30) NOT NULL,
JOB_CHG_HOUR FLOAT(7) ,
JOB_LAST_UPDATE DATE 
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO JOB VALUES  (JOB_CODE,JOB_DESCRIPTION,JOB_CHG_HOUR,JOB_LAST_UPDATE),
						('500','Programmer','35.75','2009/11/20'),
                        ('501','System Analyst','96.75','2009/11/20'),
                        ('502','DataBase designer','125.00','2010/03/24'),
                        ('503','Electrical Engineer','84.5','2009/11/20'),
						('504','Mechanical Engineer','67.9','2009/11/20'),
						('505','Civil Engineer','55.78','2009/11/20'),
						('506','Clerical Support','26.87','2009/11/20'),
						('507','DSS Analyst','45.95','2009/11/20'),
						('508','Applications Designer','48.1','2010/03/24'),
						('509','Bio Technician','34.55','2009/11/20'),
						('510','General Support','18.36','2009/11/20');

DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
EMP_NUM CHAR(3) NOT NULL,
EMP_LNAME VARCHAR(20) NOT NULL,
EMP_FNAME VARCHAR(20) NOT NULL,
EMP_INITIAL CHAR(2) NULL,
EMP_HIREDATE DATE,
JOB_CODE CHAR(3) NOT NULL,
EMP_YEARS CHAR(4) NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

INSERT INTO EMPLOYEE VALUES(EMP_NUM,EMP_LNAME,EMP_FNAME,EMP_INITIAL,EMP_HIREDATE,JOB_CODE,EMP_YEARS),

('101', 'News', 'John', 'G', '00/11/08', '502','8'),
('102', 'Senior', 'David', 'H', '89/07/12', '501','19'),
('103', 'Arbough', 'June', 'E', '96/12/01', '500','12'),
('104', 'Rarnoras', 'Anne', 'K', '87/11/15', '501','21'),
('105','Johnson','Alice','K','93/02/01','502','16'),
('106','Smithfield','William',NULL,'04/06/22','500','4'),
('107','Alonzo','Maria','D','93/10/10','500','15'),
('108','Washington','Ralph','B','91/08/22','501','17'),
('109','Smith','Larry','W','07/07/18','501','11'),
('110','Olenko','Gerald','A','95/12/11','505','13'),
('111','Wabash','Geoff','B','91/04/04','506','17'),
('112','Smithson','Darlene','M','94/10/23','507','14'),
('113','Joenbrood','Delbert','K','96/11/15','508','12'),
('114','Jones','Annelise',NULL,'93/08/20','508','15'),
('115','Bawangi','Travis','B','92/01/25','501','17'),
('116','Pratt','Gerald','L','97/03/05','510','12'),
('117','Williamson','Angie','H','98/06/19','509','12'),
('118','Frommer','James','J','05/01/04','510','4');

DROP TABLE IF EXISTS PROJECT;
CREATE TABLE PROJECT (
PROJ_NUM CHAR(2) NOT NULL,
PROJ_NAME CHAR(15) NOT NULL,
PROJ_VALUE FLOAT(15) NOT NULL,
PROJ_BALANCE FLOAT(15) NOT NULL,
EMP_NUM CHAR(3) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO PROJECT VALUES (PROJ_NUM,PROJ_NAME,PROJ_VALUE,PROJ_BALANCE,EMP_NUM),
('15','Evergreen','1453500.00','1002350.00','103'),
('18','Amber Wave','3500500.00','2110346.00','108'),
('22','Rolling Tide','805000.00','500345.20','102'),
('25','Starflight','2650500.00','2309880.00','107');


DROP TABLE IF EXISTS ASSIGNMENT;
CREATE TABLE ASSIGNMENT (
ASSIGN_NUM	CHAR(4) NOT NULL,
ASSIGN_DATE	DATE NOT NULL,
PROJ_NUM CHAR(2) NOT NULL,
EMP_NUM CHAR(3) NOT NULL,
ASSIGN_JOB	CHAR(3) NOT NULL,
ASSIGN_CHG_HR FLOAT(7) NOT NULL,
ASSIGN_HOURS FLOAT (7) NOT NULL,
ASSIGN_CHARGE	FLOAT(7) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO ASSIGNMENT VALUES (ASSIGN_NUM,ASSIGN_DATE,PROJ_NUM,EMP_NUM,ASSIGN_JOB,ASSIGN_CHG_HR,ASSIGN_HOURS,ASSIGN_CHARGE),
('1001','10/04/22','18','103','503','84.50','3.5','295.75'),
('1002','10/04/22','22','117','509','34.55','4.2','145.11'),
('1003','10/04/22','18','117','509','34.55','2','69.10'),
('1004','10/04/22','18','103','503','84.50','5.9','498.55'),
('1005','10/04/22','25','108','501','96.75','2.2','212.85'),
('1006','10/04/22','22','104','501','96.75','4.2','406.35'),
('1007','10/04/22','25','113','508','50.75','3.8','192.85'),
('1008','10/04/22','18','103','503','84.50','0.9','76.05'),
('1009','10/04/23','15','115','501','96.75','5.6','541.80'),
('1010','10/04/23','15','117','509','34.55','2.4','82.92'),
('1011','10/04/23','25','105','502','105.00','4.3','451.50'),
('1012','10/04/23','18','108','501','96.75','3.4','328.95'),
('1013','10/04/23','25','115','501','96.75','2.0','193.50'),
('1014','10/04/23','22','104','501','96.75','2.8','270.90'),
('1015','10/04/23','15','103','503','84.50','6.1','515.45'),
('1016','10/04/23','22','105','502','105.00','4.7','493.50'),
('1017','10/04/23','18','117','509','34.55','3.8','131.29'),
('1018','10/04/23','25','117','509','34.55','2.2','76.01'),
('1019','10/04/24','25','104','501','110.50','4.9','541.45'),
('1020','10/04/24','15','101','502','125.00','3.1','387.50'),
('1021','10/04/24','22','108','501','110.50','2.7','298.35'),
('1022','10/04/24','22','115','501','110.50','4.9','541.45'),
('1023','10/04/24','22','105','502','125.00','3.5','437.50'),
('1024','10/04/24','15','103','503','84.50','3.3','278.85'),
('1025','10/04/24','18','117','509','34.55','4.2','145.11');


/* 2. Write SQL code to establish the relation and constraint as highlighted in the Relational
Diagram. */

ALTER TABLE JOB
ADD CONSTRAINT JOB_PK PRIMARY KEY  (JOB_CODE);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT EMP_PK PRIMARY KEY  (EMP_NUM),
ADD CONSTRAINT EMP_IBFK FOREIGN KEY (JOB_CODE) REFERENCES JOB (JOB_CODE);

ALTER TABLE PROJECT
ADD CONSTRAINT PROJ_PK PRIMARY KEY  (PROJ_NUM),
ADD CONSTRAINT PROJ_IBFK FOREIGN KEY (EMP_NUM) REFERENCES EMPLOYEE (EMP_NUM);

ALTER TABLE ASSIGNMENT
ADD CONSTRAINT ASSIGN_PK PRIMARY KEY  (ASSIGN_NUM),
ADD CONSTRAINT ASSIGN_IBFK1 FOREIGN KEY (PROJ_NUM) REFERENCES PROJECT (PROJ_NUM),
ADD CONSTRAINT ASSIGN_IBFK2 FOREIGN KEY (EMP_NUM) REFERENCES EMPLOYEE (EMP_NUM);

 /* 3. Write the SQL code that will create the table named EMP_1. This table is a subset of the
 EMPLOYEE table. The basic EMP_1 table structure is summarized in the table below. (Note
that the JOB_CODE is the FK to JOB.) */

DROP TABLE IF EXISTS EMP_1;
CREATE TABLE EMP_1 (
EMP_NUM		CHAR(3) NOT NULL,
EMP_LNAME	VARCHAR(15) NOT NULL,
EMP_FNAME	VARCHAR(15) NOT NULL,
EMP_INITIAL	CHAR(1) NULL,
EMP_HIREDATE DATE,
JOB_CODE	CHAR(3) NOT NULL,
CONSTRAINT EMP_1_PK PRIMARY KEY  (EMP_NUM),
CONSTRAINT EMP_1_IBFK FOREIGN KEY (JOB_CODE) REFERENCES JOB (JOB_CODE)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;



/* 4. Having created the table structure in Problem 1, write the SQL code to enter the rows for the
table shown in Figure */

INSERT INTO EMP_1 VALUES  (EMP_NUM,EMP_LNAME,EMP_FNAME,EMP_INITIAL,EMP_HIREDATE,JOB_CODE),
						('101', 'News', 'John', 'G', '00/11/08', '502'),
						('102', 'Senior', 'David', 'H', '89/07/12', '501'),
                        ('103', 'Arbough', 'June', 'E', '96/12/01', '500'),
                        ('104', 'Rarnoras', 'Anne', 'K', '87/11/15', '501'),
                        ('105','Johnson','Alice','K','93/02/01','502'),
                        ('106','Smithfield','William',NULL,'04/06/22','500'),
                        ('107','Alonzo','Maria','D','93/10/10','500'),
                        ('108','Washington','Ralph','B','91/08/22','501'),
                        ('109','Smith','Larry','W','07/07/18','501');
   
-- 5. Write the SQL code that will save the changes made to the EMP_1 table.

COMMIT;

/* 6. Write the SQL code to change the job code to 501 for the person whose employee number
(EMP_NUM) is 107. After you have completed the task, examine the results, and then reset the
job code to its original value. */

SET autocommit = 0;
START TRANSACTION;
BEGIN;
UPDATE EMP_1
SET JOB_CODE = '501'
WHERE EMP_NUM = '107';

-- CHECKING THE CHANGES MADE:

SELECT	*
FROM	EMP_1
WHERE	EMP_NUM = '107';

-- RESETTING TO ITS ORIGINAL VALUE
ROLLBACK;
SET autocommit = 1;


/* 7. Write the SQL code to delete the row for the person named William Smithfield, who was hired
on June 22, 2004, and whose job code classification is 500. (Hint: Use logical operators to
include all of the information given in this problem.) */

SET autocommit = 0;
START TRANSACTION;
BEGIN;
DELETE FROM EMP_1
WHERE EMP_LNAME = 'Smithfield'
AND EMP_FNAME = 'William'
AND EMP_HIREDATE = '04/06/22'
AND JOB_CODE = '500'; 



/* 8. Write the SQL code that will restore the data to its original status; that is, the table should
contain the data that existed before you made the changes in Problems 5 and 6. */


ROLLBACK;
SET autocommit = 1;

/* 9. Write the SQL code to create a copy of EMP_1, naming the copy EMP_2. Then write the SQL
code that will add the attributes EMP_PCT and PROJ_NUM to its structure. The EMP_PCT
is the bonus percentage to be paid to each employee. The new attribute characteristics are:
EMP_PCTNUMBER(4,2)
PROJ_NUMCHAR(3)
(Note: If your SQL implementation allows it, you may use DECIMAL(4,2) rather than
NUMBER(4,2).) */

CREATE TABLE EMP_2 
AS SELECT * FROM EMP_1;

ALTER TABLE EMP_2
ADD EMP_PCT DECIMAL (4,2),
ADD PROJ_NUM CHAR(3) ;

/* 10. Write the SQL code to change the EMP_PCT value to 3.85 for the person whose employee
number (EMP_NUM) is 103. Next, write the SQL command sequences to change the
EMP_PCT values as shown in*/


SET SQL_SAFE_UPDATES = 0;



UPDATE EMP_2
SET EMP_PCT = '3.85'
WHERE EMP_NUM = '103';

-- SQL COMMAND SEQUENCE TO CHNAGE EMP_PCT VALUES SHOWN IN TABLE.
UPDATE EMP_2
SET EMP_PCT = '5'
WHERE EMP_NUM = '101';

UPDATE EMP_2
SET EMP_PCT = '8'
WHERE EMP_NUM = '102';

UPDATE EMP_2
SET EMP_PCT = '10'
WHERE EMP_NUM = '104';

UPDATE EMP_2
SET EMP_PCT = '5'
WHERE EMP_NUM = '105';

UPDATE EMP_2
SET EMP_PCT = '6.20'
WHERE EMP_NUM = '106';

UPDATE EMP_2
SET EMP_PCT = '5.15'
WHERE EMP_NUM = '107';

UPDATE EMP_2
SET EMP_PCT = '10'
WHERE EMP_NUM = '108';

UPDATE EMP_2
SET EMP_PCT = '2'
WHERE EMP_NUM = '109';

/* 11. Using a single command sequence, write the SQL code that will change the project number
(PROJ_NUM) to 18 for all employees whose job classification (JOB_CODE) is 500. */

UPDATE EMP_2
SET PROJ_NUM = '18'
WHERE JOB_CODE = '500';

/* 12. Using a single command sequence, write the SQL code that will change the project number
(PROJ_NUM) to 25 for all employees whose job classification (JOB_CODE) is 502 or higher.
When you finish Problems 10 and 11, the EMP_2 table will contain the data shown in Figure.
(You may assume that the table has been saved again at this point. */

UPDATE EMP_2
SET PROJ_NUM='25'
WHERE JOB_CODE>='502';

/*13. Write the SQL code that will change the PROJ_NUM to 14 for those employees who were
hired before January 1, 1994 and whose job code is at least 501. (You may assume that the
table will be restored to its condition preceding this question.) */

UPDATE EMP_2
SET PROJ_NUM='14'
WHERE EMP_HIREDATE<= '1994/01/01'
AND JOB_CODE>='502';

/* 14. Write the two SQL command sequences required to:
a. Create a temporary table named TEMP_1 whose structure is composed of the EMP_2
attributes EMP_NUM and EMP_PCT. 

b. Copy the matching EMP_2 values into the TEMP_1 table.

BOTH CAN BE ANSWERED IN SAME CODE
*/

CREATE TABLE TEMP_1
AS SELECT EMP_NUM, EMP_PCT
FROM EMP_2;

/* 
15. Write the SQL command that will delete the newly created TEMP_1 table from the database.
*/

DROP TABLE TEMP_1;

/* 16. Write the SQL code required to list all employees whose last names start with Smith. In other
words, the rows for both Smith and Smithfield should be included in the listing. Assume case
sensitivity.*/

SELECT *
FROM EMP_2
WHERE EMP_LNAME LIKE 'Smith%';

/* 17. Using the EMPLOYEE, JOB, and PROJECT tables in the Ch07_ConstructCo database (see
Figure), write the SQL code that will produce the results shown in Figure*/

SELECT PROJ_NAME,PROJ_VALUE,PROJ_BALANCE,E.EMP_LNAME,E.EMP_FNAME,E.EMP_INITIAL,E.JOB_CODE,J.JOB_DESCRIPTION,J.JOB_CHG_HOUR
FROM PROJECT AS P,JOB AS J,EMPLOYEE AS E
WHERE E.EMP_NUM=P.EMP_NUM
AND J.JOB_CODE=E.JOB_CODE;

/* 18. Write the SQL code that will produce a virtual table named REP_1. The virtual table should
contain the same information that was shown in Problem 16. */

CREATE VIEW REP_1
AS
SELECT PROJ_NAME,PROJ_VALUE,PROJ_BALANCE,E.EMP_LNAME,E.EMP_FNAME,E.EMP_INITIAL,E.JOB_CODE,J.JOB_DESCRIPTION,J.JOB_CHG_HOUR
FROM PROJECT AS P,JOB AS J,EMPLOYEE AS E
WHERE E.EMP_NUM=P.EMP_NUM
AND J.JOB_CODE=E.JOB_CODE;

/* 19. Write the SQL code to find the average bonus percentage in the EMP_2 table you created in
Problem 8.*/

SELECT 
AVG(EMP_PCT)
FROM EMP_2;

/*20. Write the SQL code that will produce a listing for the data in the EMP_2 table in ascending
order by the bonus percentage. */

SELECT *
FROM EMP_2
ORDER BY EMP_PCT


 






