******************************************************************
      *THIS FILE IS FOR TESTING STEFAN'S UPDATE FUNCTION
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST-UPDATE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      * Change names
           SELECT DATA-FILE
             ASSIGN "../STUFILE.dat"
             ORGANIZATION IS INDEXED
             ACCESS MODE IS RANDOM
             RECORD KEY IS STUDENT-NUMBER
             FILE STATUS IS FILE-STATUS.
           SELECT COPY-FILE
             ASSIGN "../COPY.txt"
             ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.
       FD DATA-FILE.
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

       FD COPY-FILE.
           01 OUTBOUND-RECORD PIC X(110).

       WORKING-STORAGE SECTION.
           01 FILE-STATUS  PIC X(2).
           01 EOF          PIC 9.
           01 COUNTER      PIC 9(2).
           01 CACHE1       PIC X(110).
           01 CACHE2       PIC X(110).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM CLONE-FILE.
           PERFORM PUT-YOUR-UPDATING-CODE-HERE.
           PERFORM COMPARE-FILES.
           CLOSE DATA-FILE.

       CLONE-FILE.
           OPEN I-O DATA-FILE OUTPUT COPY-FILE.
           PERFORM UNTIL EOF = 1
               READ DATA-FILE INTO CACHE1 AT END ADD 1 TO EOF END-READ
               MOVE CACHE1 TO OUTBOUND-RECORD
               WRITE OUTBOUND-RECORD END-WRITE
           END-PERFORM.
           CLOSE DATA-FILE COPY-FILE. MOVE 0 TO EOF.

       PUT-YOUR-UPDATING-CODE-HERE.
           MOVE 111111 TO STUDENT-NUMBER
           MOVE "STEFAN STIVICIC " TO STUDENT-NAME
           REWRITE STUDENT-RECORD
            INVALID KEY DISPLAY "INVALID KEY AFTER UPDATE"
            NOT INVALID KEY DISPLAY "UPDATE IS DONE"
           END-REWRITE.

       COMPARE-FILES.
           OPEN INPUT DATA-FILE INPUT COPY-FILE.
           PERFORM UNTIL EOF = 1
               READ COPY-FILE INTO CACHE1 END-READ
               READ DATA-FILE INTO CACHE2 AT END ADD 1 TO EOF END-READ
               ADD 1 TO COUNTER
               DISPLAY "BEFORE UPDATE: " CACHE1
               DISPLAY " AFTER UPDATE: " CACHE2
           END-PERFORM.
           DISPLAY " ".
           DISPLAY "TOTAL RECORDS: " COUNTER.





      *    USE AT YOUR LEISURE.
       DISPLAY-LINE-BY-LINE.
           DISPLAY "READ " COUNTER ": " STUDENT-RECORD.
           DISPLAY "RECORD " COUNTER ": {".
           DISPLAY "   STUDENT-NUMBER   " STUDENT-NUMBER.
           DISPLAY "   TUITION-OWED     " TUITION-OWED.
           DISPLAY "   STUDENT-NAME     " STUDENT-NAME.
           DISPLAY "   PROGRAM-OF-STUDY " PROGRAM-OF-STUDY.
           DISPLAY "   COURSE-CODE-1    " COURSE-CODE-1.
           DISPLAY "   COURSE-AVG-1     " COURSE-AVG-1.
           DISPLAY "   COURSE-CODE-2    " COURSE-CODE-2.
           DISPLAY "   COURSE-AVG-2     " COURSE-AVG-2.
           DISPLAY "   COURSE-CODE-3    " COURSE-CODE-3.
           DISPLAY "   COURSE-AVG-3     " COURSE-AVG-3.
           DISPLAY "   COURSE-CODE-4    " COURSE-CODE-4.
           DISPLAY "   COURSE-AVG-4     " COURSE-AVG-4.
           DISPLAY "   COURSE-CODE-5    " COURSE-CODE-5.
           DISPLAY "   COURSE-AVG-5     " COURSE-AVG-5.
           DISPLAY "}".

       END PROGRAM TEST-UPDATE.
