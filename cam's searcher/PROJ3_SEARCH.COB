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
           SELECT STUDENT-RECORD-FILE
               ASSIGN TO ".\STUFILE.txt"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
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
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           SEARCH-FILE-BY-KEY.
               PERFORM ACCEPT-USER-KEY.
               PERFORM INITIALIZE-FILE.
               PERFORM FIND-MATCH UNTIL EOF-FLAG = 'Y'.
               PERFORM CLOSE-FILE.
               STOP RUN.

           ACCEPT-USER-KEY.
               DISPLAY "ENTER STUDENT NUMBER: "
               ACCEPT USER-KEY.

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
                           MOVE 'Y' TO EOF-FLAG
                       END-IF
                   END-READ.

           CLOSE-FILE.
               CLOSE STUDENT-RECORD-FILE.

       END PROGRAM PROJECT-3-SEARCH.
