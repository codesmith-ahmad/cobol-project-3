******************************************************************
      * Author:    Stefan Stivicic
      *            Andre Azevedo de Rocha
      *            Ahmad Al-Jabbouri
      * Date: 2023 August 5th
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALC-AVERAGE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
           01 COURSE-AVERAGES OCCURS 5 TIMES.
           05 COURSE-AVG PIC 9(3).

           01 STUDENT-AVG PIC 9(3)V9.

       LINKAGE SECTION.
           01 LINKAGE-STUDENT-AVG PIC 9(3)V9.


       PROCEDURE DIVISION USING LINKAGE-STUDENT-AVG.
           MOVE COURSE-AVERAGES(1) TO COURSE-AVG
           ADD COURSE-AVERAGES(2) TO COURSE-AVG
           ADD COURSE-AVERAGES(3) TO COURSE-AVG
           ADD COURSE-AVERAGES(4) TO COURSE-AVG
           ADD COURSE-AVERAGES(5) TO COURSE-AVG
           DIVIDE COURSE-AVG BY 5 GIVING STUDENT-AVG
           MOVE STUDENT-AVG TO LINKAGE-STUDENT-AVG
           GOBACK.

      *END PROGRAM CALC-AVERAGE.
