      ******************************************************************
      * Author: Stefan Stivicic, Andre Azevedo Da Rocha
      *         ***PUT UR NAMES HERE!!***
      * Date: August 8th, 2023.
      * Purpose: PROJECT 3 PART II
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. UPDATE-STUDENT-FILE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-DATA-FILE
               ASSIGN "STUFILE.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS STUDENT-NUMBER
               FILE STATUS IS FILE-STATUS.
       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-DATA-FILE.
           01 STUDENT-RECORD.
               05 STUDENT-NUMBER   PIC 9(6).
               05 TUITION-OWED     PIC 9(4)V99.
               05 STUDENT-NAME     PIC X(40).
               05 PROGRAM-OF-STUDY PIC X(6).
               05 COURSE-CODE-1    PIC X(7).
               05 COURSE-AVG-1     PIC 9(3).
               05 COURSE-CODE-2    PIC X(7).
               05 COURSE-AVG-2     PIC 9(3).
               05 COURSE-CODE-3    PIC X(7).
               05 COURSE-AVG-3     PIC 9(3).
               05 COURSE-CODE-4    PIC X(7).
               05 COURSE-AVG-4     PIC 9(3).
               05 COURSE-CODE-5    PIC X(7).
               05 COURSE-AVG-5     PIC 9(3).

       WORKING-STORAGE SECTION.

       01 STUDENT-RECORD-WS.
           05 STUDENT-NUMBER-WS    PIC 9(6).
           05 TUITION-OWED-WS      PIC 9(4)V99.
           05 STUDENT-NAME-WS      PIC X(40).
           05 PROGRAM-OF-STUDY-WS  PIC X(6).
           05 COURSE-CODE-1-WS     PIC X(7).
           05 COURSE-AVG-1-WS      PIC 9(3).
           05 COURSE-CODE-2-WS     PIC X(7).
           05 COURSE-AVG-2-WS      PIC 9(3).
           05 COURSE-CODE-3-WS     PIC X(7).
           05 COURSE-AVG-3-WS      PIC 9(3).
           05 COURSE-CODE-4-WS     PIC X(7).
           05 COURSE-AVG-4-WS      PIC 9(3).
           05 COURSE-CODE-5-WS     PIC X(7).
           05 COURSE-AVG-5-WS      PIC 9(3).

       01 FILE-STATUS PIC X(2).

       01 DATA-FROM-SCREEN.
           05 STUDENT-ID-IN-WS PIC X(6) VALUE SPACES.

       01 FLAGS.
           05 VALID-INPUT-FLAG PIC X VALUE "N".
           05 EOF-FLAG PIC X(1) VALUE "X".
           05 UPDATE-FLAG PIC X(1) VALUE "X".

       SCREEN SECTION.
       01 DATA-ENTRY-SCREEN.
      *    SCREEN FOR INPUTING THE STUDENT NUMBER
           05 INPUT-SECTION.

           10 VALUE "INPUT STUDENT NUMBER" BLANK SCREEN
           LINE 1 COLUMN 1.
           10 VALUE "STUDENT ID: " LINE 5 COL 05.
           10 STUDENT-ID-IN PIC X(6) TO STUDENT-ID-IN-WS
               LINE 5 COL 17.
      *    SCREEN FOR DISPLAYING THE STUDENT RECORD
           05 DISPLAY-SECTION.
           10 STUDENT-NAME-D PIC X(40) FROM STUDENT-NAME-WS
               BLANK SCREEN LINE 1 COLUMN 1.
           10 VALUE "STUDENT #: " LINE 2 COLUMN 1.
           10 STUDENT-NUMBER-D PIC 9(6) FROM STUDENT-NUMBER-WS
               LINE 2 COLUMN 12.

           10 VALUE "PROGRAM OF STUDY: " LINE 3 COLUMN 1.
           10 VALUE "COURSES" LINE 5 COLUMN 1.

           10 COURSE-CODE-D LINE 7 COLUMN 1.
           10 VALUE "GRADE: " LINE 7 COLUMN 9.
           10 COURSE-AVG-1-D FROM COURSE-AVG-1-WS LINE 7 COLUMN 16.

           10 COURSE-CODE-2-D LINE 8 COLUMN 1.
           10 VALUE "GRADE: " LINE 8 COLUMN 9.
           10 COURSE-AVG-2-D FROM COURSE-AVG-2-WS LINE 8 COLUMN 16.

           10 COURSE-CODE-3-D LINE 9 COLUMN 1.
           10 VALUE "GRADE: " LINE 9 COLUMN 9.
           10 COURSE-AVG-3-D FROM COURSE-AVG-2-WS LINE 9 COLUMN 16.

           10 COURSE-CODE-4-D LINE 10 COLUMN 1.
           10 VALUE "GRADE: " LINE 10 COLUMN 9.
           10 COURSE-AVG-4-D FROM COURSE-AVG-2-WS LINE 10 COLUMN 16.

           10 COURSE-CODE-5-D LINE 11 COLUMN 1.
           10 VALUE "GRADE: " LINE 11 COLUMN 9.
           10 COURSE-AVG-5-D FROM COURSE-AVG-2-WS LINE 11 COLUMN 16.

           10 VALUE "Do you want to update this record? (Y/N)"
               LINE 13 COLUMN 1.
           10 UPDATE-IN PIC X TO UPDATE-FLAG LINE 13 COLUMN 42.
      *SCREEN FOR UPDATING THE STUDENT RECORD
           05 UPDATE-SECTION.
           10 VALUE "NAME: " LINE 1 COLUMN 1.
           10 STUDENT-NAME-U PIC X(40) TO STUDENT-NAME-WS
                LINE 1 COLUMN 7.
           10 VALUE "STUDENT #: " LINE 2 COLUMN 1.
           10 STUDENT-NUMBER-U PIC 9(6) TO STUDENT-NUMBER-WS
               LINE 2 COLUMN 12.

           10 VALUE "PROGRAM OF STUDY: " LINE 3 COLUMN 1.
           10 PROGRAM-OF-STUDY-U PIC X(6) TO STUDENT-NUMBER-WS.
           10 VALUE "COURSES" LINE 5 COLUMN 1.

           10 COURSE-CODE-1-U LINE 7 COLUMN 1.
           10 VALUE "GRADE: " LINE 7 COLUMN 9.
           10 COURSE-AVG-1-U PIC 9(3) TO COURSE-AVG-1-WS
               LINE 7 COLUMN 16.

           10 COURSE-CODE-2-U LINE 8 COLUMN 1.
           10 VALUE "GRADE: " LINE 8 COLUMN 9.
           10 COURSE-AVG-2-U PIC 9(3) TO COURSE-AVG-2-WS
               LINE 8 COLUMN 16.

           10 COURSE-CODE-3-U LINE 9 COLUMN 1.
           10 VALUE "GRADE: " LINE 9 COLUMN 9.
           10 COURSE-AVG-3-U PIC 9(3) TO COURSE-AVG-2-WS
               LINE 9 COLUMN 16.

           10 COURSE-CODE-4-U LINE 10 COLUMN 1.
           10 VALUE "GRADE: " LINE 10 COLUMN 9.
           10 COURSE-AVG-4-U PIC 9(3) TO COURSE-AVG-2-WS
               LINE 10 COLUMN 16.

           10 COURSE-CODE-5-U LINE 11 COLUMN 1.
           10 VALUE "GRADE: " LINE 11 COLUMN 9.
           10 COURSE-AVG-5-U PIC 9(3) TO COURSE-AVG-2-WS
               LINE 11 COLUMN 16.

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           MOVE "N" TO VALID-INPUT-FLAG.

           200-SEARCH-FOR-STUDENT.
           PERFORM 100-DISPLAY-INPUT-SECTION
               UNTIL VALID-INPUT-FLAG EQUALS "Y".
           PERFORM 100-DISPLAY-DISPLAY-SECTION
               UNTIL UPDATE-FLAG EQUALS "Y".
               PERFORM 100-DISPLAY-UPDATE-SECTION
               UNTIL UPDATE-FLAG EQUALS "N".
           STOP RUN.

       100-DISPLAY-INPUT-SECTION.
           DISPLAY INPUT-SECTION.
           ACCEPT STUDENT-ID-IN.

       100-DISPLAY-DISPLAY-SECTION.
           DISPLAY DISPLAY-SECTION.
           ACCEPT DISPLAY-SECTION.
           MOVE "Y" TO UPDATE-FLAG.

       100-DISPLAY-UPDATE-SECTION.
           DISPLAY UPDATE-SECTION.
           ACCEPT UPDATE-SECTION.

       200-SEARCH-FOR-STUDENT.
           OPEN I-O STUDENT-DATA-FILE.
           MOVE STUDENT-ID-IN-WS TO STUDENT-NUMBER
           START STUDENT-DATA-FILE
               KEY IS EQUAL STUDENT-NUMBER
               INVALID KEY DISPLAY "NO RECORD EXISTS..."
               NOT INVALID KEY
                   READ STUDENT-DATA-FILE NEXT RECORD
                   AT END MOVE "Y" TO EOF-FLAG

               END-READ
           END-START.

       300-GET-STUDENT-DATA.
           MOVE STUDENT-NUMBER   TO STUDENT-NUMBER-WS
           MOVE TUITION-OWED     TO TUITION-OWED-WS
           MOVE STUDENT-NAME     TO STUDENT-NAME-WS
           MOVE PROGRAM-OF-STUDY TO PROGRAM-OF-STUDY-WS
           MOVE COURSE-CODE-1    TO COURSE-CODE-1-WS
           MOVE COURSE-AVG-1     TO COURSE-AVG-1-WS
           MOVE COURSE-CODE-2    TO COURSE-CODE-2-WS
           MOVE COURSE-AVG-2     TO COURSE-AVG-3-WS
           MOVE COURSE-CODE-3    TO COURSE-CODE-3-WS
           MOVE COURSE-AVG-3     TO COURSE-AVG-3-WS
           MOVE COURSE-CODE-4    TO COURSE-CODE-3-WS
           MOVE COURSE-AVG-4     TO COURSE-AVG-3-WS
           MOVE COURSE-CODE-5    TO COURSE-CODE-3-WS
           MOVE COURSE-AVG-5     TO COURSE-AVG-3-WS.
           READ STUDENT-DATA-FILE NEXT RECORD
             AT END
                MOVE "Y" TO EOF-FLAG
             END-READ.

       END PROGRAM UPDATE-STUDENT-FILE.
