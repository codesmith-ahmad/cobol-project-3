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
           SELECT STUDENT-FILE-IN
              ASSIGN TO ".\STUFILE.dat"
              ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-FILE-IN
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
       01 USER-RECORD-IN.
          05 WS-STUDENT-ID PIC 9(6).
          05 WS-OPTION PIC 9.

       01 CONTROL-FILE.
          05 EOF-FLAG PIC X VALUE 'N'.

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
          05 VALUE "WELCOME" BLANK SCREEN LINE 1 COL 35.
          05 VALUE "ENTER THE KEY: " LINE 3 COL 10.
          05 STUDENT-ID-IN LINE 3 COL 25 PIC 9(6) TO WS-STUDENT-ID.

       01 OUTPUT-SCREEN.
          05 VALUE "Details of Student" BLANK SCREEN LINE 1 COL 35.
          05 VALUE "STUDENT NUMBER :" LINE 3 COL 10.
          05 STUDENT-NUMBER-IN LINE 3 COL 27 PIC 9(6)
               FROM FOUND-STUDENT-NUMBER.
          05 VALUE "TUTION OWED :" LINE 5 COL 10.
          05 TUITION-OWED-IN LINE 5 COL 24 PIC 9(4).99
               FROM FOUND-TUITION-OWED.
          05 VALUE "STUDENT NAME :" LINE 3 COL 10.
          05 STUDENT-NAME-IN LINE 3 COL 25 PIC X(40)
               FROM FOUND-STUDENT-NAME.
          05 VALUE "PROGRAM OF STUDY :" LINE 4 COL 10.
          05 PROGRAM-OF-STUDY-IN LINE 4 COL 29 PIC X(6)
               FROM FOUND-PROGRAM-OF-STUDY.
          05 VALUE "1. Search Other   2. Edit student no." LINE 6 COL 10.
          05 VALUE "Enter the option: " LINE 7 COL 10.
          05 OPTION-IN LINE 7 COL 27 PIC 9 TO WS-OPTION.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * Display welcome input screen.
           DISPLAY INPUT-SCREEN.
           ACCEPT INPUT-SCREEN.
           PERFORM 101-OPEN-FILES.
      * Search key in dat file.
           PERFORM 102-SEARCH-KEY.
      * Display the details output.
           DISPLAY OUTPUT-SCREEN.
           ACCEPT OUTPUT-SCREEN.
           STOP RUN.

       101-OPEN-FILES.
           OPEN INPUT STUDENT-FILE-IN.

       102-SEARCH-KEY.
           READ STUDENT-FILE-IN
               AT END MOVE 'Y' TO EOF-FLAG
               NOT AT END
                   IF WS-STUDENT-ID = STUDENT-NUMBER
                       MOVE STUDENT-FILE-RECORD TO FOUND-STUDENT-RECORD
                   END-IF
           END-READ.

       END PROGRAM WELCOME-PROGRAM.
