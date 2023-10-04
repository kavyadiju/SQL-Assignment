create table STUDIES
(
PNAME varchar(100),
INSTITUTE varchar(100),
COURSE varchar(100),
COURSE_FEE int,

)

insert into STUDIES values
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRIK','PRAGATHI','DCAP',5200),
('QUADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHY','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000)

create table SOFTWARE
(
PNAME varchar(100),
TITLE varchar(100),
DEVELOPIN varchar(100),
SCOST decimal(8,2),
DCOST int,
SOLD int

)

INSERT INTO SOFTWARE VALUES
('MARY','README','CPP',300,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEO TITLING','PASCAL',7500,16000,9),
('JULIANA','INVENTORY','COBOL',3000,3500,0),
('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7),
('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4),
('MARY','CODE GENERATOR','C',4500,20000,23),
('PATTRICK','README','CPP',300,1200,84),
('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
('QADIR','VACCINES','C',1900,3100,21),
('RAMESH','HOTEL MGMT.','DBASE',13000,35000,4),
('RAMESH','DEAD LEE','PASCAL',599.95,4500,73),
('REMITHA','PC UTILITIES','C',725,5000,51),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500,6000,7),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100,75000,2),
('VIJAYA','TSR EDITOR','C',900,700,6)

create table PROGRAMMER
(
PNAME varchar(100),
DOB date,
DOJ date,
GENDER varchar(50),
PROF1 varchar(100),
PROF2 varchar(100),
SALARY int,
)

INSERT INTO PROGRAMMER VALUES
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500)

--1. Find out the selling cost AVG for packages developed in Pascal. 
SELECT avg(SCOST) as avcost_pas FROM SOFTWARE where DEVELOPIN='PASCAL'


--2. Display Names, Ages of all Programmers. 
SELECT PNAME , DATEDIFF(YY,DOB,GETDATE()) AS AGE FROM PROGRAMMER

--3. Display the Names of those who have done the DAP Course. 
SELECT PNAME FROM STUDIES WHERE COURSE = 'DAP'

--4. Display the Names and Date of Births of all Programmers Born in January. 
SELECT PNAME,DOB FROM PROGRAMMER WHERE DATEPART(MM,DOB) = 01

--5. What is the Highest Number of copies sold by a Package? 
select MAX(SOLD) as max_copies_sold from SOFTWARE

--6. Display lowest course Fee. 
SELECT MIN(COURSE_FEE) AS MIN_FEE FROM STUDIES

--7. How many programmers done the PGDCA Course? 
SELECT COUNT(*) AS NUM_OF_PGMR FROM STUDIES WHERE COURSE='PGDCA'

--8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SCOST*SOLD AS REVENUE FROM SOFTWARE WHERE DEVELOPIN = 'C'

--9. Display the Details of the Software Developed by Ramesh. 
SELECT * FROM SOFTWARE WHERE PNAME='RAMESH'

--10. How many Programmers Studied at Sabhari? 
SELECT COUNT(*) AS NUM_OF_PRG FROM STUDIES WHERE INSTITUTE='SABHARI'

--11. Display details of Packages whose sales crossed the 2000 Mark.		
SELECT * FROM SOFTWARE WHERE (SCOST*SOLD) > 2000

--12. Display the Details of Packages for which Development Cost have been recovered.
SELECT * FROM SOFTWARE WHERE (SCOST*SOLD)>=DCOST

--13. What is the cost of the costliest software development in Basic? 
SELECT MAX(SCOST) AS COSTLY_SW FROM SOFTWARE WHERE  DEVELOPIN = 'BASIC'

--14. How many Packages Developed in DBASE? 
SELECT COUNT(*) AS PACKAGES FROM SOFTWARE WHERE DEVELOPIN = 'DBASE'

--15. How many programmers studied in Pragathi? 
SELECT COUNT(*) AS NUM_OF_PRG FROM STUDIES WHERE INSTITUTE='PRAGATHI'

--16. How many Programmers Paid 5000 to 10000 for their course? 
SELECT COUNT(*) AS NO_OF_PGMR FROM STUDIES WHERE COURSE_FEE BETWEEN 5000 AND 10000

--17. What is AVG Course Fee 
SELECT AVG(COURSE_FEE) AS AVG_FEE FROM STUDIES

--18. Display the details of the Programmers Knowing C.
SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C'

--19. How many Programmers know either COBOL or PASCAL. 
SELECT COUNT(*) AS NO_OF_PGMR FROM PROGRAMMER
WHERE (PROF1 = 'COBOL' OR PROF1 = 'PASCAL') OR (PROF2 = 'COBOL' OR PROF2 = 'PASCAL')

--20. How many Programmers Don’t know PASCAL and C 
SELECT count(*) as no_of_pgmr FROM PROGRAMMER
WHERE PROF1 NOT IN ('C','PASCAL') AND PROF2 NOT IN ('C','PASCAL')


--21. How old is the Oldest Male Programmer. 
SELECT MAX( DATEDIFF(YY,DOB,GETDATE()) ) AS AGE FROM PROGRAMMER WHERE GENDER = 'M'

--22. What is the AVG age of Female Programmers? 
SELECT AVG( DATEDIFF(YY,DOB,GETDATE()) ) AS AGE FROM PROGRAMMER WHERE GENDER = 'F'

--23. Calculate the Experience in Years for each Programmer and Display with their  names in Descending order. 
SELECT PNAME,DATEDIFF(YYYY,DOJ,GETDATE()) AS EXPERIENCE FROM PROGRAMMER ORDER BY PNAME DESC

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month? 
SELECT PNAME FROM PROGRAMMER WHERE DATEPART(MM,DOB)=DATEPART(MM,GETDATE())

--25. How many Female Programmers are there? 
SELECT COUNT(*) AS NO_OF_FEM FROM PROGRAMMER WHERE GENDER = 'F'

--26. What are the Languages studied by Male Programmers. 
SELECT DISTINCT PROF1 FROM PROGRAMMER WHERE GENDER='M' UNION
SELECT DISTINCT PROF2 FROM PROGRAMMER WHERE GENDER='M'


--27. What is the AVG Salary? 
SELECT AVG(SALARY) AS ASVG_SAL FROM PROGRAMMER

--28. How many people draw salary 2000 to 4000? 
SELECT COUNT(SALARY) AS NO_OF_PGMR FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 
SELECT * FROM PROGRAMMER WHERE PROF1 NOT IN ('CLIPPER','COBOL','PASCAL') AND PROF2 NOT IN ('CLIPPER','COBOL','PASCAL')

--30. Display the Cost of Package Developed By each Programmer. 
SELECT PNAME,SUM(DCOST) AS TOTAL_COST FROM SOFTWARE GROUP BY PNAME


--31. Display the sales values of the Packages Developed by the each Programmer. 
 SELECT PNAME, SUM(SCOST*SOLD) as sales_val FROM SOFTWARE GROUP BY PNAME

--32. Display the Number of Packages sold by Each Programmer. 
SELECT sum(SOLD) AS PACK_SOLD FROM SOFTWARE GROUP BY PNAME

--33. Display the sales cost of the packages Developed by each Programmer Language wise. 
SELECT DEVELOPIN, SUM(SCOST) AS sales_cost FROM SOFTWARE GROUP BY DEVELOPIN

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 
SELECT DEVELOPIN,AVG(DCOST) AS avg_dev_cost,AVG(SCOST) AS avg_sell_cost,AVG(SCOST) AS avg_ppc FROM SOFTWARE GROUP BY DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or  her. 
 SELECT PNAME,MAX(DCOST) as costliest,MIN(DCOST) as cheapest FROM SOFTWARE GROUP BY PNAME

--36. Display each institute name with number of Courses, Average Cost per Course. 
SELECT INSTITUTE,COUNT(COURSE) as no_of_course, AVG(COURSE_FEE) as avg_cost FROM STUDIES GROUP BY INSTITUTE

--37. Display each institute Name with Number of Students. 
SELECT INSTITUTE,COUNT(PNAME) as no_of_stud FROM STUDIES GROUP BY INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also. 
SELECT PNAME,GENDER FROM PROGRAMMER ORDER BY GENDER

--39. Display the Name of Programmers and Their Packages. 
SELECT PNAME,TITLE FROM SOFTWARE ORDER BY PNAME

--40. Display the Number of Packages in Each Language Except C and C++. 
SELECT DEVELOPIN,COUNT(TITLE) as no_of_pack FROM SOFTWARE where DEVELOPIN NOT IN ('C','CPP') GROUP BY DEVELOPIN


--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT COUNT(TITLE) as no_of_pack,DEVELOPIN FROM SOFTWARE where DCOST<1000 GROUP BY DEVELOPIN

--42. Display AVG Difference between SCOST, DCOST for Each Package. 
SELECT DEVELOPIN, AVG(DCOST - SCOST) as avg_diff FROM SOFTWARE GROUP BY DEVELOPIN

--43. Display the total SCOST, DCOST and amount to Be Recovered for each  Programmer for Those Whose Cost has not yet been Recovered. 
SELECT SUM(SCOST) as scost, SUM(DCOST) as dcost, SUM(DCOST-(SOLD*SCOST)) as amt_to_recover FROM SOFTWARE GROUP BY PNAME
HAVING SUM(DCOST)>SUM(SOLD*SCOST)

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 
 SELECT MAX(SALARY) as highest, MIN(SALARY) as lowest, AVG(SALARY) as average FROM PROGRAMMER WHERE SALARY > 2000

--45. Who is the Highest Paid C Programmers? 
SELECT PNAME FROM PROGRAMMER
WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C')

--46. Who is the Highest Paid Female COBOL Programmer? 
SELECT PNAME FROM PROGRAMMER 
WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL'))
AND GENDER LIKE 'F'

--47. Display the names of the highest paid programmers for each Language.					
WITH cte AS (
SELECT PNAME, SALARY, PROF1 as PROF FROM programmer
UNION 
SELECT PNAME, SALARY, PROF2      FROM programmer
)
SELECT p1.PNAME, p1.PROF, p1.SALARY
FROM cte p1
LEFT JOIN cte p2
ON p1.PROF = p2.PROF AND p1.SALARY < p2.SALARY
WHERE p2.PNAME IS NULL
order by PROF


--48. Who is the least experienced Programmer. 
SELECT  PNAME,DATEDIFF(YYYY,DOJ,getdate()) EXP FROM PROGRAMMER WHERE
DATEDIFF(YYYY,DOJ,getdate()) = (SELECT MIN(DATEDIFF(YYYY,DOJ,getdate())) FROM PROGRAMMER)

--49. Who is the most experienced male programmer knowing PASCAL.			
SELECT  PNAME,DATEDIFF(YYYY,DOJ,getdate()) AS EXP FROM PROGRAMMER WHERE
DATEDIFF(YYYY,DOJ,getdate()) = (SELECT MAX(DATEDIFF(YYYY,DOJ,getdate())) FROM PROGRAMMER WHERE
((PROF1 LIKE 'PASCAL' OR PROF2 LIKE 'PASCAL') )) AND (PROF1 LIKE 'PASCAL' OR PROF2 LIKE 'PASCAL')

--50. Which Language is known by only one Programmer? 
SELECT PROF1 FROM PROGRAMMER
GROUP BY PROF1
HAVING PROF1
NOT IN
(SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1 
UNION 
SELECT PROF2 FROM PROGRAMMER 
GROUP BY PROF2
HAVING PROF2 
NOT IN
(SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1

--51. Who is the Above Programmer Referred in 50? 
SELECT PNAME FROM PROGRAMMER WHERE PROF1 IN (SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1
HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1)
UNION
SELECT PNAME FROM PROGRAMMER WHERE PROF2 IN (SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1
HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1)

--52. Who is the Youngest Programmer knowing DBASE? 
SELECT PNAME FROM PROGRAMMER
WHERE DATEDIFF(YYYY,DOB,GETDATE()) = (SELECT MIN(DATEDIFF(YYYY,DOB,GETDATE())) FROM PROGRAMMER 
WHERE PROF1 LIKE 'DBASE' OR PROF2 LIKE 'DBASE')

--53. Which Female Programmer earning more than 3000 does not know C, C++, 
--ORACLE or DBASE? 
SELECT PNAME FROM PROGRAMMER 
WHERE  GENDER= 'F'
AND SALARY >3000
AND (PROF1 NOT IN('C','CPP','ORACLE','DBASE') OR PROF2 NOT IN('C','CPP','ORACLE','DBASE'))

--54. Which Institute has most number of Students?	

Select top 1 INSTITUTE, count(pname) as no_of_stu From STUDIES
group by INSTITUTE
order by Count(pname) desc

--55. What is the Costliest course? 
SELECT COURSE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES)

--56. Which course has been done by the most of the Students?
SELECT TOP 2 COURSE  , COUNT(PNAME) AS NO_OF_STU FROM STUDIES GROUP BY COURSE 
ORDER BY COUNT(PNAME) DESC


--57. Which Institute conducts costliest course. 
SELECT INSTITUTE FROM STUDIES
WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES)

--58. Display the name of the Institute and Course, which has below AVG course fee. 
SELECT INSTITUTE,COURSE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM STUDIES)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the 
--Average Fee, 
SELECT COURSE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE)+1000 FROM STUDIES)
AND COURSE_FEE > (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES)

--60. Which package has the Highest Development cost? 
SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)

--61. Which course has below AVG number of Students? 
WITH CTEMP AS (
  SELECT  COURSE, count(PNAME) as CC FROM STUDIES group by COURSE
)
SELECT * FROM CTEMP  where CC <= (select avg(CC) from CTEMP)

--62. Which Package has the lowest selling cost? 
SELECT DISTINCT TITLE FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE)

--63. Who Developed the Package that has sold the least number of copies? 
SELECT PNAME FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE)

--64. Which language has used to develop the package, which has the highest sales amount? 
SELECT DEVELOPIN FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)

--65. How many copies of package that has the least difference between development and selling cost where sold. 
SELECT TITLE,SOLD FROM SOFTWARE
WHERE TITLE = (SELECT TITLE FROM SOFTWARE WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE))

--66. Which is the costliest package developed in PASCAL. 
SELECT TITLE AS COSTLY_PACK FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL')

--67. Which language was used to develop the most number of Packages. 
SELECT TOP 1 DEVELOPIN, COUNT(TITLE) as COUNT FROM SOFTWARE GROUP BY DEVELOPIN ORDER BY COUNT DESC

--68. Which programmer has developed the highest number of Packages? 
SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING PNAME = (SELECT MAX(PNAME) FROM SOFTWARE)

--69. Who is the Author of the Costliest Package? 
SELECT PNAME FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM   SOFTWARE)

--70. Display the names of the packages, which have sold less than the AVG 
--number of copies. 
SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE)

--71. Who are the authors of the Packages, which have recovered more than double the 
--Development cost? 
SELECT PNAME FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST

--72. Display the programmer Name and the cheapest packages developed by them in each language. 
Select PNAME, TITLE	FROM SOFTWARE
WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN)

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 
SELECT PNAME,DEVELOPIN FROM SOFTWARE
WHERE SOLD IN (SELECT MAX(SOLD) AS HIGH FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT PNAME,DEVELOPIN FROM SOFTWARE
WHERE SOLD IN (SELECT MIN(SOLD) AS LOW FROM SOFTWARE GROUP BY PNAME)

--74. Who is the youngest male Programmer born in 1965? 
SELECT TOP 1 PNAME  from PROGRAMMER
WHERE DATEPART(YYYY,DOB) = '1965' AND GENDER = 'M'
ORDER BY DATEPART(MM,DOB) DESC

--75. Who is the oldest Female Programmer who joined in 1992?
SELECT TOP 1 PNAME from PROGRAMMER
WHERE DATEPART(YYYY,DOJ) = '1992' AND GENDER = 'F' 
ORDER BY DATEPART(YYYY,DOB)

--76. In which year was the most number of Programmers born. 
WITH TEMPTABLE AS (
  SELECT COUNT(PNAME) AS NO_OF_PRO ,DATEPART(YYYY, DOB) AS YEAR FROM programmer GROUP BY DATEPART(YYYY, DOB)
)
Select YEAR,NO_OF_PRO from TEMPTABLE
WHERE NO_OF_PRO = (SELECT MAX(NO_OF_PRO) FROM TEMPTABLE)

--77. In which month did most number of programmers join? 
WITH TEMPTABLE AS (
  SELECT COUNT(PNAME) AS NO_OF_PRO ,DATEPART(YYYY, DOJ) AS YEAR FROM programmer GROUP BY DATEPART(YYYY, DOJ)
)
Select YEAR,NO_OF_PRO from TEMPTABLE
WHERE NO_OF_PRO = (SELECT MAX(NO_OF_PRO) FROM TEMPTABLE)

--78. In which language are most of the programmer’s proficient. 
CREATE TABLE PROF_1(PROF varchar(20),CNT int)
INSERT INTO PROF_1(PROF,CNT)
SELECT PROF1,COUNT(PNAME) FROM PROGRAMMER GROUP BY PROF1
UNION ALL
SELECT PROF2,COUNT(PNAME) FROM PROGRAMMER GROUP BY PROF2

CREATE TABLE PROF_2(P varchar(20),C int)
INSERT INTO PROF_2(P,C)
SELECT PROF,SUM(CNT) FROM PROF_1
GROUP BY PROF

SELECT * FROM PROF_2
WHERE C = (SELECT MAX(C) FROM PROF_2)

--79. Who are the male programmers earning below the AVG salary of Female Programmers? 
SELECT PNAME FROM PROGRAMMER 
WHERE GENDER = 'M' AND SALARY < (SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER = 'F')

--80. Who are the Female Programmers earning more than the Highest Paid male programmers? 
SELECT PNAME FROM PROGRAMMER 
WHERE GENDER = 'F' AND SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER = 'M')

--81. Which language has been stated as the proficiency by most of the Programmers? 
SELECT PROF1 AS PROF FROM PROGRAMMER GROUP BY PROF1
HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER)
UNION
SELECT PROF2 AS PROF FROM PROGRAMMER GROUP BY PROF2
HAVING PROF2 = (SELECT MAX(PROF2) FROM PROGRAMMER)
	
--82. Display the details of those who are drawing the same salary. 
SELECT PNAME, SALARY FROM PROGRAMMER
WHERE SALARY = ANY(SELECT SALARY FROM PROGRAMMER p GROUP BY SALARY HAVING SALARY=p.SALARY AND COUNT(*)>1)

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 
SELECT s.PNAME as PROGRAMMER, s.TITLE, s.DEVELOPIN,s.SCOST,s.DCOST,s.SOLD FROM software s
INNER JOIN PROGRAMMER p
ON p.PNAME=s.PNAME 
WHERE salary>3000 AND GENDER='M'

--84. Display the details of the packages developed in Pascal by the Female Programmers. 
SELECT s.* FROM software s
INNER JOIN PROGRAMMER p
ON p.PNAME=s.PNAME
WHERE  GENDER='F' AND DEVELOPIN='PASCAL'

--85. Display the details of the Programmers who joined before 1990. 
SELECT * FROM PROGRAMMER WHERE DATEPART(YYYY,DOJ)<1990

--86. Display the details of the Software Developed in C By female programmers of Pragathi. 
--NOTE: NO SUCH PROGRAMMERS SATISFIES ALL CONDITIONS - ONLY 1 RECORD FOR PRAGATHI AND DEVELOPIN IS DBASE THERE

SELECT s.*, ST.INSTITUTE FROM SOFTWARE s
INNER JOIN
STUDIES st
ON s.PNAME=st.PNAME
INNER JOIN
PROGRAMMER p 
ON S.PNAME=P.PNAME
WHERE GENDER='F'  AND S.DEVELOPIN = 'C' AND INSTITUTE='PRAGATHI'

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 
SELECT st.INSTITUTE, COUNT(s.DEVELOPIN) as no_of_pack, COUNT(s.SOLD) as copies_sold, 
SUM(s.SOLD*s.SCOST)  as sales_value
FROM software s,studies st
WHERE s.PNAME=st.PNAME 
GROUP BY st.INSTITUTE

--88. Display the details of the software developed in DBASE by Male Programmers, who 
--belong to the institute in which most number of Programmers studied. 
CREATE TABLE INS(ins varchar(20), CNT int)
INSERT INTO INS
SELECT INSTITUTE,COUNT(PNAME) FROM STUDIES
GROUP BY INSTITUTE

SELECT DISTINCT sw.*
FROM PROGRAMMER p, STUDIES s, Software sw, INS
WHERE DEVELOPIN = 'DBASE' AND GENDER = 'M' AND SW.PNAME = P.PNAME
AND INSTITUTE = INS and CNT = (Select max(CNT) from INS)

---89. Display the details of the software Developed by the male programmers Born 
--before 1965 and female programmers born after 1975. 

SELECT P.PNAME,S.TITLE, S.DEVELOPIN , S.SCOST,S.DCOST,S.SOLD FROM SOFTWARE AS S
FULL JOIN PROGRAMMER AS P
ON S.PNAME=P.PNAME
WHERE (P.GENDER='M' AND DATEPART(YYYY,P.DOB)<1965) OR (P.GENDER='F' AND DATEPART(YYYY,P.DOB)>1975)

--90. Display the details of the software that has developed in the language which is
--neither the first nor the second proficiency of the programmers. 
SELECT S.* FROM PROGRAMMER P
INNER JOIN SOFTWARE S
ON S.PNAME=P.PNAME 
WHERE (S.DEVELOPIN <> P.PROF1 AND S.DEVELOPIN <> P.PROF2)

--91. Display the details of the software developed by the male students of Sabhari. 
SELECT S.* FROM PROGRAMMER P
INNER JOIN SOFTWARE S
ON S.PNAME=P.PNAME 
INNER JOIN STUDIES STU
ON S.PNAME=STU.PNAME 
WHERE P.GENDER='M' AND STU.INSTITUTE='SABHARI'

--92. Display the names of the programmers who have not developed any packages. 
SELECT PNAME FROM PROGRAMMER 
WHERE PNAME NOT IN(SELECT PNAME FROM SOFTWARE)

--93. What is the total cost of the Software developed by the programmers of Apple? 
SELECT SUM(SCOST) AS TOTALCOST FROM SOFTWARE S, STUDIES ST
WHERE S.PNAME = ST.PNAME AND ST.INSTITUTE = 'APPLE'

--94. Who are the programmers who joined on the same day? 
SELECT A.PNAME,A.DOJ FROM PROGRAMMER A,PROGRAMMER B 
WHERE A.DOJ=B.DOJ AND A.PNAME <> B.PNAME 
ORDER BY DOJ

--95. Who are the programmers who have the same Prof2? 
SELECT A.PNAME,A.PROF2 FROM PROGRAMMER A,PROGRAMMER B 
WHERE A.PROF2=B.PROF2 AND A.PNAME <> B.PNAME 
ORDER BY PROF2

--96. Display the total sales value of the software, institute wise. 
SELECT ST.INSTITUTE,SUM(S.SOLD*S.SCOST) AS TOT_SALES_VAL FROM SOFTWARE AS S,STUDIES AS ST
WHERE ST.PNAME=S.PNAME 
GROUP BY ST.INSTITUTE

--97. In which institute does the person who developed the costliest package studied. 
SELECT INSTITUTE FROM STUDIES ST, SOFTWARE S
WHERE ST.PNAME = S.PNAME AND DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)
GROUP BY INSTITUTE

--98. Which language listed in prof1, prof2 has not been used to develop any package. 
SELECT PROF1 FROM PROGRAMMER 
WHERE PROF1 NOT IN(SELECT DEVELOPIN FROM SOFTWARE) 
UNION
SELECT PROF2 FROM PROGRAMMER
WHERE PROF2 NOT IN(SELECT DEVELOPIN FROM SOFTWARE)

--99. How much does the person who developed the highest selling package earn and
--what course did HE/SHE undergo.
SELECT P1.SALARY,S2.COURSE FROM PROGRAMMER P1
INNER JOIN SOFTWARE S1
ON P1.PNAME=S1.PNAME
INNER JOIN STUDIES S2 
ON S1.PNAME=S2.PNAME
WHERE SCOST=(SELECT MAX(SCOST) FROM SOFTWARE)

--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
SELECT AVG(SALARY) AS AVG_SALE FROM PROGRAMMER P
INNER JOIN SOFTWARE S 
ON P .PNAME=S.PNAME 
WHERE S.SOLD*S.SCOST>50000

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 
SELECT S.PNAME, COUNT(TITLE) AS PACKAGES FROM STUDIES ST, SOFTWARE S
WHERE ST.PNAME = S.PNAME AND COURSE_FEE = (SELECT MIN(COURSE_FEE) FROM STUDIES)
GROUP BY S.PNAME, COURSE_FEE

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
SELECT COUNT(DEVELOPIN) AS PACKAGE FROM PROGRAMMER S, SOFTWARE P
WHERE S.PNAME = P.PNAME 
GROUP BY DEVELOPIN
HAVING MIN(DCOST)=(SELECT MIN(DCOST) FROM SOFTWARE)

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
SELECT COUNT(DEVELOPIN) AS NO_OF_PACK FROM PROGRAMMER P
INNER JOIN SOFTWARE S
ON S.PNAME=P.PNAME
WHERE P.GENDER='F' AND
P.SALARY>(SELECT MAX(P.SALARY) FROM PROGRAMMER P INNER JOIN SOFTWARE S ON S.PNAME=P.PNAME WHERE P.GENDER='M')

--104. How many packages are developed by the most experienced programmer form BDPS. 
SELECT COUNT(*) AS COUNTP FROM SOFTWARE S,PROGRAMMER P
WHERE P.PNAME=S.PNAME GROUP BY DOJ 
HAVING MIN(DOJ)=(SELECT MIN(DOJ) FROM STUDIES ST,PROGRAMMER P, SOFTWARE S
WHERE P.PNAME=S.PNAME AND ST.PNAME=P.PNAME AND (INSTITUTE='BDPS'))

--105. List the programmers (form the software table) and the institutes they studied.
 SELECT S.PNAME,ST.INSTITUTE FROM SOFTWARE AS S
 INNER JOIN STUDIES AS ST
 ON S.PNAME=ST.PNAME

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
CREATE TABLE PROF_TABLE(PROF varchar(80), NO_PGMR int)
INSERT INTO PROF_TABLE SELECT DISTINCT(PROF1) AS PROF , COUNT(PNAME) AS NO_PGMR FROM PROGRAMMER  GROUP BY PROF1
UNION
SELECT DISTINCT(PROF2) AS PROF , COUNT(PNAME) AS NO_PGMR FROM PROGRAMMER GROUP BY PROF2 

INSERT INTO PROF_TABLE 
SELECT PROF1 AS PROF , COUNT(PNAME) AS NO_PGMR FROM PROGRAMMER GROUP BY PROF1
INTERSECT
SELECT PROF2 AS PROF , COUNT(PNAME) AS NO_PGMR FROM PROGRAMMER GROUP BY PROF2

CREATE TABLE PACK_TABLE(PROF varchar(80), NO_PACK int)
INSERT INTO PACK_TABLE SELECT DEVELOPIN AS PROF, COUNT(*) AS NO_OF_PACK FROM SOFTWARE
WHERE DEVELOPIN IN (SELECT PROF FROM PROF_TABLE)
GROUP BY DEVELOPIN

SELECT PF.PROF,PF.NO_PGMR,PK.NO_PACK FROM PROF_TABLE AS PF
FULL JOIN PACK_TABLE AS PK
ON PF.PROF = PK.PROF

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed. 
SELECT S.PNAME,COUNT(DEVELOPIN) AS NO_OF_PACK FROM PROGRAMMER P1
INNER JOIN SOFTWARE S 
ON P1.PNAME=S.PNAME
GROUP BY S.PNAME
