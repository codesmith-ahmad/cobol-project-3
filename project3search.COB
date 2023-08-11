      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJECT-3-SEARCH.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-INDEXED-FILE
               ASSIGN "..\STUFILE.DAT"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS STUDENT-NUMBER
               FILE STATUS IS STATUS-FILED.
       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-INDEXED-FILE.
       01 STUDENT-RECORD.
           05 STUDENT-NUMBER PIC 9(6).
           05 TUITION-OWED PIC 9(4)V99.
           05 STUDENT-NAME PIC X(40).
           05 PROGRAM-OF-STUDY PIC X(6).
           05 COURSE-CODE-1 PIC X(7).
           05 COURSE-AVERAGE-1 PIC 9(3).
           05 COURSE-CODE-2 PIC X(7).
           05 COURSE-AVERAGE-2 PIC 9(3).
           05 COURSE-CODE-3 PIC X(7).
           05 COURSE-AVERAGE-3 PIC 9(3).
           05 COURSE-CODE-4 PIC X(7).
           05 COURSE-AVERAGE-4 PIC 9(3).
           05 COURSE-CODE-5 PIC X(7).
           05 COURSE-AVERAGE-5 PIC 9(3).
       WORKING-STORAGE SECTION.
       01 STATUS-FILED PIC X(2).
       01 WS-EOF PIC X.
       01 USER-INPUT PIC 9(6).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM ACCEPT-INPUT.
           PERFORM INITIALIZE-RTN.
           PERFORM CLOSE-RTN.
           STOP RUN.

       ACCEPT-INPUT.
           DISPLAY "ENTER STUDENT NUMBER: ".
           ACCEPT USER-INPUT.

       INITIALIZE-RTN.
           OPEN I-O STUDENT-INDEXED-FILE.
           MOVE USER-INPUT TO STUDENT-NUMBER.
           PERFORM READ-STUDENT-RECORD.

       READ-STUDENT-RECORD.
           READ STUDENT-INDEXED-FILE
               INVALID KEY
                   DISPLAY "NO RECORDS EXIST WITH THIS STUDENT NUMBER: "
                   , STUDENT-NUMBER
               NOT INVALID KEY
                   DISPLAY "STUDENT RECORD FOUND"
                   PERFORM PRINT-STUDENT-RECORD
           END-READ.

       PRINT-STUDENT-RECORD.
           DISPLAY "STUDENT NUMBER: ", STUDENT-NUMBER.
           DISPLAY "STUDENT NAME: ", STUDENT-NAME.
           DISPLAY "TUITION OWED: ", TUITION-OWED.

           DISPLAY "COURSE 1: ", COURSE-CODE-1, " AVERAGE ",
           COURSE-AVERAGE-1.
           DISPLAY "COURSE 2: ", COURSE-CODE-2, " AVERAGE ",
           COURSE-AVERAGE-2.
           DISPLAY "COURSE 3: ", COURSE-CODE-3, " AVERAGE ",
           COURSE-AVERAGE-3.
           DISPLAY "COURSE 4: ", COURSE-CODE-4, " AVERAGE ",
           COURSE-AVERAGE-4.
           DISPLAY "COURSE 5: ", COURSE-CODE-5, " AVERAGE ",
           COURSE-AVERAGE-5.

       CLOSE-RTN.
           CLOSE STUDENT-INDEXED-FILE.

       END PROGRAM PROJECT-3-SEARCH.
