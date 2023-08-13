      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WELCOME-PROGRAM.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-RECORD-FILE ASSIGN TO "../STUFILE.dat"
                ORGANIZATION IS INDEXED
                ACCESS MODE IS SEQUENTIAL
                RECORD KEY IS STUDENT-NUMBER.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-RECORD-FILE
           DATA RECORD IS FILE-RECORD.

       01 STUDENT-FILE-RECORD.
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
       01 USER-KEY PIC 9(6).
       01 EOF-FLAG PIC X VALUE 'N'.
       01 STUDENT-INPUT.
           05 WS-OPTION PIC 9.
           05 PAY-IN PIC 9(4)V99.

       01 FOUND-STUDENT-RECORD.
           05 FOUND-STUDENT-NUMBER PIC 9(6).
           05 FOUND-TUITION-OWED PIC 9(4)V99.
           05 FOUND-STUDENT-NAME PIC X(40).
           05 FOUND-PROGRAM-OF-STUDY PIC X(6).
           05 FOUND-COURSE-CODE-1 PIC X(7).
           05 FOUND-COURSE-AVERAGE-1 PIC 9(3).
           05 FOUND-COURSE-CODE-2 PIC X(7).
           05 FOUND-COURSE-AVERAGE-2 PIC 9(3).
           05 FOUND-COURSE-CODE-3 PIC X(7).
           05 FOUND-COURSE-AVERAGE-3 PIC 9(3).
           05 FOUND-COURSE-CODE-4 PIC X(7).
           05 FOUND-COURSE-AVERAGE-4 PIC 9(3).
           05 FOUND-COURSE-CODE-5 PIC X(7).
           05 FOUND-COURSE-AVERAGE-5 PIC 9(3).

       SCREEN SECTION.
       01 INPUT-SCREEN.
           05 VALUE "*******************************************" BLANK
               SCREEN LINE 1 COL 30.
           05 VALUE "WELCOME TO COBOL PROJECT 3" LINE 2 COL
               40.
           05 VALUE "STUDENT REPORT GENERATOR" LINE 3 COL
               40.
           05 VALUE "*******************************************"
               LINE 4 COL 30.
           05 VALUE "WHAT YOU WANT TO DO?"  LINE 6 COL 10.
           05 VALUE "1. SEARCH ANOTHER STUDENT [S] OR [1] "  LINE 7
               COL 10.
           05 VALUE "2. ENTER PAYMENT [P] OR [2] " LINE 8
               COL 10.
           05 VALUE "3. GENERATE REPORT [R] OR [3] " LINE 9
               COL 10.
           05 VALUE "3. QUIT [Q] OR [4]" LINE 10 COL 10.
           05 VALUE "ENTER THE OPTION: " LINE 12 COL 10.
           05 OPTION-IN LINE 12 COL 27 PIC 9 TO WS-OPTION.

       01 SEARCH-SCREEN.
           05 VALUE "*******************************************"
               BLANK SCREEN LINE 1 COL 30.
           05 VALUE "DETAILS OF STUDENT" LINE 2 COL 45.
           05 VALUE "*******************************************"
               LINE 3 COL 30.
           05 VALUE "ENTER THE KEY: " LINE 4 COL 10.
           05 STUDENT-ID-IN LINE 4 COL 25 PIC 9(6) TO USER-KEY.

       01 OUTPUT-SCREEN.
           05 VALUE "STUDENT NAME :" LINE 6 COL 10.
           05 STUDENT-NAME-IN LINE 6 COL 25 PIC X(40)
               FROM FOUND-STUDENT-NAME.
           05 VALUE "TUTION OWED :" LINE 7 COL 10.
           05 TUITION-OWED-IN LINE 7 COL 25 PIC 9(4).99
               FROM FOUND-TUITION-OWED.
           05 VALUE "PROGRAM NAME :" LINE 8 COL 10.
           05 PROGRAM-OF-STUDY-IN LINE 8 COL 25 PIC X(6)
               FROM FOUND-PROGRAM-OF-STUDY.
           05 VALUE "COURSES :" LINE 10 COL 10.
           05 VALUE "COURSES CODE " LINE 12 COL 25.
           05 VALUE "COURSES AVG " LINE 12 COL 48.
           05 VALUE "----------------------------------" LINE 13 COL 25.
           05 COURSE-CODE-1-IN LINE 14 COL 25 PIC X(7)
               FROM FOUND-COURSE-CODE-1.
           05 COURSE-AVERAGE-1-IN LINE 14 COL 48 PIC 9(3)
               FROM FOUND-COURSE-AVERAGE-1.
           05 COURSE-CODE-2-IN LINE 15 COL 25 PIC X(7)
               FROM FOUND-COURSE-CODE-2.
           05 COURSE-AVERAGE-2-IN LINE 15 COL 48 PIC 9(3)
               FROM FOUND-COURSE-AVERAGE-2.
           05 COURSE-CODE-3-IN LINE 16 COL 25 PIC X(7)
               FROM FOUND-COURSE-CODE-3.
           05 COURSE-AVERAGE-3-IN LINE 16 COL 48 PIC 9(3)
               FROM FOUND-COURSE-AVERAGE-3.
           05 COURSE-CODE-4-IN LINE 17 COL 25 PIC X(7)
               FROM FOUND-COURSE-CODE-4.
           05 COURSE-AVERAGE-4-IN LINE 17 COL 48 PIC 9(3)
               FROM FOUND-COURSE-AVERAGE-4.
           05 COURSE-CODE-5-IN LINE 18 COL 25 PIC X(7)
               FROM FOUND-COURSE-CODE-5.
           05 COURSE-AVERAGE-5-IN LINE 18 COL 48 PIC 9(3)
               FROM FOUND-COURSE-AVERAGE-5.
           05 VALUE "----------------------------------" LINE 19 COL 25.
      *>      need to put the total value after compute
           05 TOTAL-IN LINE 20 COL 25.
      *>      need to put the total avg value after compute
           05 TOTAL-AVG-IN LINE 20 COL 48.

           05 VALUE "WHAT YOU WANT TO DO?"  LINE 22 COL 10.
           05 VALUE "1. SEARCH ANOTHER STUDENT [S] OR [1] "  LINE 24
               COL 10.
           05 VALUE "2. ENTER PAYMENT [P] OR [2] " LINE 25
               COL 10.
           05 VALUE "3. GENERATE REPORT [R] OR [3] " LINE 26
               COL 10.
           05 VALUE "3. QUIT [Q] OR [4]" LINE 27 COL 10.
           05 VALUE "ENTER THE OPTION: " LINE 28 COL 10.
           05 OPTION-IN LINE 28 COL 27 PIC 9 TO WS-OPTION.

       01 UPDATE-SCREEN.
           05 VALUE "*******************************************"
               BLANK SCREEN LINE 1 COL 30.
           05 VALUE "UPDATE THE PAYMENT" LINE 2 COL 45.
           05 VALUE "*******************************************"
               LINE 3 COL 30.
           05 VALUE "ENTER THE PAYMENT: " LINE 4 COL 10.
           05 TUTION-PAY-IN LINE 4 COL 30 PIC 9(6) TO PAY-IN.

       01 UPDATE-OUT-SCREEN.
           05 VALUE "STUDENT NAME :" LINE 6 COL 10.
           05 STUDENT-NAME-IN LINE 6 COL 25 PIC X(40)
               FROM FOUND-STUDENT-NAME.
           05 VALUE "TUTION OWED :" LINE 7 COL 10.
           05 TUITION-OWED-IN LINE 7 COL 25 PIC 9(4).99
               FROM FOUND-TUITION-OWED.
           05 VALUE "PROGRAM NAME :" LINE 8 COL 10.
           05 PROGRAM-OF-STUDY-IN LINE 8 COL 25 PIC X(6)
               FROM FOUND-PROGRAM-OF-STUDY.

           05 VALUE "WHAT YOU WANT TO DO?"  LINE 11 COL 10.
           05 VALUE "1. SEARCH ANOTHER STUDENT [S] OR [1] "  LINE 12
               COL 10.
           05 VALUE "2. ENTER PAYMENT [P] OR [2] " LINE 13
               COL 10.
           05 VALUE "3. GENERATE REPORT [R] OR [3] " LINE 14
               COL 10.
           05 VALUE "3. QUIT [Q] OR [4]" LINE 15 COL 10.
           05 VALUE "ENTER THE OPTION: " LINE 16 COL 10.
           05 OPTION-IN LINE 16 COL 27 PIC 9 TO WS-OPTION.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       SEARCH-FILE-BY-KEY.
           PERFORM ACCEPT-USER-KEY.
           PERFORM INITIALIZE-FILE.
           PERFORM FIND-MATCH.
           PERFORM CLOSE-FILE.
           STOP RUN.

       ACCEPT-USER-KEY.
           ACCEPT INPUT-SCREEN.
           IF WS-OPTION = 1 OR WS-OPTION = 'S' THEN
               ACCEPT SEARCH-SCREEN
               PERFORM OUTPUT-DISPLAY
           ELSE IF WS-OPTION = 2 OR WS-OPTION = 'P' THEN
               ACCEPT UPDATE-SCREEN
               ACCEPT UPDATE-OUT-SCREEN
           ELSE IF WS-OPTION = 4 OR WS-OPTION = 'R' THEN
               ACCEPT INPUT-SCREEN
           END-IF.

       INITIALIZE-FILE.
           OPEN INPUT STUDENT-RECORD-FILE.

       FIND-MATCH.
           READ STUDENT-RECORD-FILE
               AT END
                   MOVE 'Y' TO EOF-FLAG
               NOT AT END
                   IF USER-KEY = STUDENT-NUMBER
                       MOVE STUDENT-FILE-RECORD
                       TO FOUND-STUDENT-RECORD
                   END-IF
               END-READ.

       OUTPUT-DISPLAY.
           ACCEPT OUTPUT-SCREEN.

       CLOSE-FILE.
           CLOSE STUDENT-RECORD-FILE.
       END PROGRAM WELCOME-PROGRAM.
