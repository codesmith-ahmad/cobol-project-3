******************************************************************
      * Author:    Stefan Stivicic
      *            Andre Azevedo de Rocha
      *            Ahmad Al-Jabbouri
      * Date: 2023 August 5th
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUDENT-REPORT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *    List of programs.
            SELECT PROGRAM-FILE ASSIGN TO "../PROGRAM.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
      *    Raw input data to be processed.
            SELECT STUDENT-FILE ASSIGN TO "../STUFILE.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
      *    Processed output student report.
            SELECT OUTPUT-FILE  ASSIGN TO "../OUTPUT.txt"
                ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD PROGRAM-FILE.
       01 PROGRAM-RECORD.
           05 PROGRAM-CODE     PIC X(6).
           05 PROGRAM-NAME     PIC X(20).

       FD STUDENT-FILE.
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

       FD OUTPUT-FILE.
       01 STUDENT-OUTPUT-FILE.
           05 STUDENT-NAME-OUT PIC X(40).
           05 FILLER           PIC X(3) VALUE SPACES.
           05 STUDENT-AVG-OUT  PIC ZZZZZ99.
           05 FILLER           PIC A(4) VALUE SPACES.
           05 PROGRAM-NAME-OUT PIC X(20).
           05 FILLER           PIC X(4) VALUE SPACES.
           05 TUITION-OWED-OUT PIC Z,ZZ9.99.

       WORKING-STORAGE SECTION.

       01 MODULES.
           05 TEST-MODULE PIC X(13) VALUE "TEST-MODULE".
           05 FILE-CONVERTER-MODULE PIC X(50) VALUE "MODULE-1".

       01 PROGRAM-TABLE.
           05 PROGRAM-TABLE-ENTRY OCCURS 20 TIMES INDEXED T-ENTRY.
               10 PROGRAM-TABLE-CODE PIC X(6).
               10 PROGRAM-TABLE-NAME PIC X(20).

       01 COLUMN-HEADER.
           05 FILLER PIC X(40) VALUE "NAME".
           05 FILLER PIC X(3).
           05 FILLER PIC X(7) VALUE "AVERAGE".
           05 FILLER PIC X(4).
           05 FILLER PIC X(20) VALUE "PROGRAM".
           05 FILLER PIC X(4).
           05 FILLER PIC X(12) VALUE "TUITION OWED".

       01 TEMP-VALUES.
           05 STUDENT-AVG PIC 9(3)V9.
           05 CACHE       PIC X(108).
           05 FILE-STATUS PIC X(2).

       01 COUNTERS.
           05 READ-COUNTER PIC 99.
           05 WRITE-COUNTER PIC 99.

       01 FLAGS.
           05 EOF-STU PIC X VALUE "N".
           05 EOF-PROG PIC X VALUE "N".
           05 SEARCH-FLAG PIC X VALUE "N".
           05 EOF-TABLE PIC X VALUE "N".

       PROCEDURE DIVISION.
       100-MAIN.
           CALL TEST-MODULE USING STUDENT-RECORD.
           PERFORM 201-OPEN-FILES.
           PERFORM 202-GENERATE-RECORDS.
           PERFORM 203-CLOSE-FILES.
           STOP RUN.

       201-OPEN-FILES.
           OPEN INPUT PROGRAM-FILE.
           OPEN INPUT STUDENT-FILE.
           OPEN OUTPUT OUTPUT-FILE.

       202-GENERATE-RECORDS.
           PERFORM 301-GENERATE-HEADER.
           PERFORM 302-READ-PROGRAM-TABLE.
           PERFORM 304-READ-STUDENT-FILE UNTIL EOF-STU = 'Y'.
           DISPLAY "READ COUNT: " READ-COUNTER.
           DISPLAY "WRITE COUNT: " WRITE-COUNTER.

       203-CLOSE-FILES.
           CLOSE PROGRAM-FILE
           CLOSE STUDENT-FILE
           CLOSE OUTPUT-FILE.

       301-GENERATE-HEADER.
           MOVE COLUMN-HEADER TO STUDENT-OUTPUT-FILE.
           WRITE STUDENT-OUTPUT-FILE.

       302-READ-PROGRAM-TABLE.
           PERFORM 401-LOAD-PROGRAM-TABLE UNTIL EOF-PROG = 'Y'
               OR T-ENTRY > 20.

       303-WRITE-STUDENT.
           MOVE STUDENT-NAME TO STUDENT-NAME-OUT.
           MOVE TUITION-OWED TO TUITION-OWED-OUT.
           PERFORM 402-GET-STUDENT-AVERAGE.
           MOVE 'N' TO SEARCH-FLAG.
           PERFORM 403-SEARCH.
           WRITE STUDENT-OUTPUT-FILE.

       304-READ-STUDENT-FILE.
           READ STUDENT-FILE
               AT END
                       MOVE 'Y' TO EOF-STU
               NOT AT END
                   CALL FILE-CONVERTER-MODULE USING STUDENT-RECORD
                   ADD 1 TO READ-COUNTER
                   PERFORM 303-WRITE-STUDENT
                   ADD 1 TO WRITE-COUNTER
           END-READ.


       401-LOAD-PROGRAM-TABLE.
      *     DISPLAY " PREREAD PROGRAM-NAME = " PROGRAM-NAME.
           READ PROGRAM-FILE
           AT END
               MOVE 'Y' TO EOF-PROG
           NOT AT END
      *     DISPLAY "POSTREAD PROGRAM-NAME = " PROGRAM-NAME
      *    This test shows READ statement already knows where to fit the record segments; just describe the file, then read
               MOVE PROGRAM-RECORD TO PROGRAM-TABLE-ENTRY(T-ENTRY)
               ADD 1 TO T-ENTRY.
      *     DISPLAY "AT 401: " CACHE.

       402-GET-STUDENT-AVERAGE.
           MOVE 0 TO STUDENT-AVG.
           ADD COURSE-AVG-1 COURSE-AVG-2 COURSE-AVG-3 COURSE-AVG-4
               COURSE-AVG-5 TO STUDENT-AVG.
           DIVIDE STUDENT-AVG BY 5 GIVING STUDENT-AVG-OUT ROUNDED.

       403-SEARCH.
           PERFORM VARYING T-ENTRY FROM 1 BY 1
                   UNTIL SEARCH-FLAG = 'Y'
                   OR T-ENTRY > 20
                   IF PROGRAM-OF-STUDY = PROGRAM-TABLE-CODE(T-ENTRY)
                   MOVE PROGRAM-TABLE-NAME(T-ENTRY) TO PROGRAM-NAME-OUT
                   MOVE 'Y' TO SEARCH-FLAG
                   DISPLAY "FOUND !"
                   END-IF
               END-PERFORM.

       END PROGRAM STUDENT-REPORT.
