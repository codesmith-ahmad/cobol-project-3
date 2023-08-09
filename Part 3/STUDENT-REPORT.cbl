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
      *    Raw input data to be converted to .dat.
            SELECT STUDENT-FILE ASSIGN TO "../STUFILE.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
      *    Processed output student report.
            SELECT OUTPUT-FILE  ASSIGN TO "../OUTPUT.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
      *    Indexed file converted from .txt
            SELECT INDEXED-FILE ASSIGN TO "../STUFILE.dat"
                ORGANIZATION IS INDEXED
                ACCESS MODE IS SEQUENTIAL
                RECORD KEY IS I-STUDENT-NUMBER
                FILE STATUS IS FILE-STATUS.

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

           FD INDEXED-FILE.
           01 INDEXED-RECORD.
               05 I-STUDENT-NUMBER   PIC 9(6).
               05 I-TUITION-OWED     PIC 9(4)V99.
               05 I-STUDENT-NAME     PIC X(40).
               05 I-PROGRAM-OF-STUDY PIC X(6).
               05 I-COURSE-CODE-1    PIC X(7).
               05 I-COURSE-AVG-1     PIC 9(3).
               05 I-COURSE-CODE-2    PIC X(7).
               05 I-COURSE-AVG-2     PIC 9(3).
               05 I-COURSE-CODE-3    PIC X(7).
               05 I-COURSE-AVG-3     PIC 9(3).
               05 I-COURSE-CODE-4    PIC X(7).
               05 I-COURSE-AVG-4     PIC 9(3).
               05 I-COURSE-CODE-5    PIC X(7).
               05 I-COURSE-AVG-5     PIC 9(3).

       WORKING-STORAGE SECTION.

           01 FILE-STATUS PIC X(2).
           01 CACHE       PIC X(110).

           01 COLUMN-HEADER.
               05 FILLER PIC X(40) VALUE "NAME".
               05 FILLER PIC X(3).
               05 FILLER PIC X(7)  VALUE "AVERAGE".
               05 FILLER PIC X(4).
               05 FILLER PIC X(20) VALUE "PROGRAM".
               05 FILLER PIC X(4).
               05 FILLER PIC X(12) VALUE "TUITION OWED".

           01 TEMP-VALUES.
               05 STUDENT-AVG PIC 9(3)V9.

           01 COUNTERS.
               05 READ-COUNTER PIC 99.
               05 WRITE-COUNTER PIC 99.
               05 TMP-COUNTER PIC 99.

           01 FLAGS.
               05 EOF-STU PIC X VALUE "N".
               05 EOF-PROG PIC X VALUE "N".
               05 SEARCH-FLAG PIC X VALUE "N".
               05 EOF-TABLE PIC X VALUE "N".
               05 EOF PIC 9 VALUE 0.

           COPY "../PROGRAM-TABLE.cpy".

       PROCEDURE DIVISION.
       100-MAIN.
           PERFORM 201-OPEN-FILES.
           PERFORM 202-GENERATE-RECORDS.

      *    FOR TESTING PURPOSES ONLY, FIGURE OUT WHERE TO PUT IT LATER
           PERFORM 000-CONVERT-TXT2DAT.
           DISPLAY "***********BEGIN TESTING**************".
           PERFORM 001-TEST-CONVERT-TXT2DAT.
           DISPLAY "***********END TESTING**************".

           PERFORM 203-CLOSE-FILES.
           STOP RUN.

       201-OPEN-FILES.
           OPEN INPUT  PROGRAM-FILE.
           OPEN INPUT  STUDENT-FILE.
           OPEN OUTPUT OUTPUT-FILE.
           OPEN OUTPUT INDEXED-FILE.

       202-GENERATE-RECORDS.
           PERFORM 301-GENERATE-HEADER.
           PERFORM 302-READ-PROGRAM-TABLE.
           PERFORM 304-PROCESS-AND-COUNT.
           PERFORM 305-DISPLAY-STATS.

       203-CLOSE-FILES.
           CLOSE PROGRAM-FILE.
           CLOSE STUDENT-FILE.
           CLOSE  OUTPUT-FILE.
           CLOSE INDEXED-FILE.

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
           ADD 1 TO WRITE-COUNTER.

       304-PROCESS-AND-COUNT.
           PERFORM UNTIL EOF-STU = 'Y'
               READ STUDENT-FILE INTO CACHE
                       AT END MOVE 'Y' TO EOF-STU
                   NOT AT END PERFORM 303-WRITE-STUDENT
               END-READ
               DISPLAY CACHE
               ADD 1 TO READ-COUNTER
           END-PERFORM.
           MOVE 'N' TO EOF-STU.
      *    Reset file for later use
           CLOSE STUDENT-FILE. OPEN INPUT STUDENT-FILE.


       305-DISPLAY-STATS.
           DISPLAY "READ COUNT: " READ-COUNTER.
           DISPLAY "WRITE COUNT: " WRITE-COUNTER.


       401-LOAD-PROGRAM-TABLE.
           READ PROGRAM-FILE
           AT END
               MOVE 'Y' TO EOF-PROG
           NOT AT END
               MOVE PROGRAM-RECORD TO PROGRAM-TABLE-ENTRY(T-ENTRY)
               ADD 1 TO T-ENTRY.

       402-GET-STUDENT-AVERAGE.
           MOVE COURSE-AVG-1 TO COURSE-AVERAGES(1)
           MOVE COURSE-AVG-2 TO COURSE-AVERAGES(2)
           MOVE COURSE-AVG-3 TO COURSE-AVERAGES(3)
           MOVE COURSE-AVG-4 TO COURSE-AVERAGES(4)
           MOVE COURSE-AVG-5 TO COURSE-AVERAGES(5)
           CALL 'CALC-AVERAGE' USING STUDENT-AVG
           MOVE STUDENT-AVG TO STUDENT-AVG-OUT.

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

       000-CONVERT-TXT2DAT.
           DISPLAY "ACCESSED 000".
           MOVE 0 TO EOF READ-COUNTER WRITE-COUNTER.
           PERFORM UNTIL EOF = 1
               READ STUDENT-FILE AT END ADD 1 TO EOF NOT AT END
                   ADD 1 TO READ-COUNTER
                   DISPLAY "<<< STUFILE.txt: " STUDENT-RECORD
      -                                   " (reading #" READ-COUNTER ")"
                   PERFORM POPULATE-INDEXED-RECORD
                   WRITE INDEXED-RECORD
                       INVALID KEY
                           DISPLAY "INVALID KEY: " STUDENT-NUMBER
                       NOT INVALID KEY
                           ADD 1 TO WRITE-COUNTER
                           DISPLAY "KEY OK"
                           DISPLAY ">>> STUFILE.dat: " INDEXED-RECORD
      -                                  " (writing #" WRITE-COUNTER ")"
                   END-WRITE
               END-READ
           END-PERFORM.
           DISPLAY "ADDED " WRITE-COUNTER " RECORDS".

       001-TEST-CONVERT-TXT2DAT.
      *    FILE IS SET AS OUTPUT. NEED TO RESET AS INPUT FOR READING
           CLOSE INDEXED-FILE. OPEN INPUT INDEXED-FILE.
           MOVE 0 TO EOF READ-COUNTER.
           PERFORM UNTIL EOF=1
               READ INDEXED-FILE AT END ADD 1 TO EOF NOT AT END
               ADD 1 TO READ-COUNTER
               PERFORM DISPLAY-RECORD
               DISPLAY "COUNTED " READ-COUNTER " RECORDS"
           END-PERFORM.

       POPULATE-INDEXED-RECORD.
           MOVE STUDENT-NUMBER   TO I-STUDENT-NUMBER
           MOVE TUITION-OWED     TO I-TUITION-OWED
           MOVE STUDENT-NAME     TO I-STUDENT-NAME
           MOVE PROGRAM-OF-STUDY TO I-PROGRAM-OF-STUDY
           MOVE COURSE-CODE-1    TO I-COURSE-CODE-1
           MOVE COURSE-AVG-1     TO I-COURSE-AVG-1
           MOVE COURSE-CODE-2    TO I-COURSE-CODE-2
           MOVE COURSE-AVG-2     TO I-COURSE-AVG-2
           MOVE COURSE-CODE-3    TO I-COURSE-CODE-3
           MOVE COURSE-AVG-3     TO I-COURSE-AVG-3
           MOVE COURSE-CODE-4    TO I-COURSE-CODE-4
           MOVE COURSE-AVG-4     TO I-COURSE-AVG-4
           MOVE COURSE-CODE-5    TO I-COURSE-CODE-5
           MOVE COURSE-AVG-5     TO I-COURSE-AVG-5.

       DISPLAY-RECORD.
           DISPLAY I-STUDENT-NUMBER
           DISPLAY I-TUITION-OWED
           DISPLAY I-STUDENT-NAME
           DISPLAY I-PROGRAM-OF-STUDY
           DISPLAY I-COURSE-CODE-1
           DISPLAY I-COURSE-AVG-1
           DISPLAY I-COURSE-CODE-2
           DISPLAY I-COURSE-AVG-2
           DISPLAY I-COURSE-CODE-3
           DISPLAY I-COURSE-AVG-3
           DISPLAY I-COURSE-CODE-4
           DISPLAY I-COURSE-AVG-4
           DISPLAY I-COURSE-CODE-5
           DISPLAY I-COURSE-AVG-5.

       END PROGRAM STUDENT-REPORT.
