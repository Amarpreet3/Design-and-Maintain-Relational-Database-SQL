SHOW DATABASES
USE registrardb
#Question 1.
#List the names, ids and major of students who are majored in Computer Engineering
#(CE)
USE registrardb
SELECT DISTINCT S.St_Name, S.St_Id, S.Major 
FROM    student AS S
WHERE   Major = 'CE';


#Question 2.
#List the grade of students who passed the course id 'CPS510' with this format:
#<StudentName StudentId SectionId CourseId Term Year ProfName Grade>
USE registrardb
SELECT DISTINCT S.St_Name as StudentName,S.St_Id as StudentId, 
                SE.S_Id as SectionId, SE.C_Id as CourseId,
                SE.Term,SE.Year, SE.P_Name as ProfName, G.Grade
FROM   student AS S
JOIN   grade AS G 
ON G.St_Id = S.St_Id
JOIN   section AS SE
ON     SE.s_id= G.s_id
WHERE  SE.c_id= 'CPS510';


#Question 3.
#List the student id, student name, course id and course name for all #students enrolled
#in Fall 2021; sort the output in ascending order by student id
USE registrardb
SELECT DISTINCT S.St_Id, S.St_Name, SE.C_Id, C.C_Name 
FROM            student AS S
JOIN            grade AS G 
ON              G.St_id =S.St_Id
JOIN            section AS SE 
ON              SE.S_Id = G.S_Id
JOIN            course AS C 
ON              C.C_Id = SE.C_Id
WHERE           SE.Year = '2021' AND SE.Term = 'Fall'
ORDER BY        S.St_Id ASC;



#Question 4.
 #List the name, id, major, degree, and gpa of all students who have a GPA between 3.0
#and 4.0 inclusively.
USE registrardb
SELECT DISTINCT  S.St_Name, S.St_Id, S.Major,S.Degree,GPA
FROM             student AS S
WHERE            GPA BETWEEN 3.0 AND 4.0;

#Question 5.

#List the name of all Professors who can teach 'CIND110', from the Teach pool table,
#along with the course id, but havenâ€™t taught the course, from the Section table
USE registrardb
SELECT DISTINCT  TP.P_Name, TP.C_Id
FROM             teach_pool AS TP
WHERE            TP.c_id = 'CIND110' 
				 AND 
                 NOT EXISTS ( SELECT SE.C_Id 
                             FROM section AS SE 
                             WHERE TP.P_Name = SE.P_Name AND
                                   TP.C_Id = SE.C_Id);


#Question 6.

#6. [10 Pts.] Create a View as â€™Report Winter 2022â€™ from all attributes of potential Professors who
#will be available to teach in the Winter term along with their course ids, sort the output in
#ascending order based on names; Display Report Winter 2022
USE registrardb
CREATE VIEW Report_Winter_2022_
AS SELECT DISTINCT P.P_Name, P.P_Phone, P.P_Email, TP.C_Id
FROM professor AS P
JOIN teach_pool AS TP
ON P.P_Name = TP.P_Name
WHERE TP.Term = "Winter"
ORDER BY P.P_name ASC;
SELECT * FROM registrardb.Report_Winter_2022_;

#Question 7.

 #Find the Minimum, Maximum, Average, Variance, and Standard deviation of the GPA
#of all students and display them.
USE registrardb
SELECT    MIN(S.GPA) AS Minimum, MAX(S.GPA) AS Maximum,
          AVG(S.GPA) AS Average, variance(S.GPA) AS Variance, STD(S.GPA) AS Standard_deviation
FROM student AS S;


