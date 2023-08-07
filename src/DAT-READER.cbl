******************************************************************
      * Tectonics: Use this to read a .dat file by executing DA-READER-MODULE
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAT-READER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-DATA-FILE
             ASSIGN "STUFILE.dat"
             ORGANIZATION IS INDEXED
             ACCESS MODE IS  SEQUENTIAL
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
           01 FILE-STATUS  PIC X(2).
           01 EOF          PIC 9.
           01 COUNTER      PIC 9(3).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT STUDENT-DATA-FILE.
           PERFORM PROCESS-RECORDS UNTIL EOF = 1.
           CLOSE STUDENT-DATA-FILE.

       PROCESS-RECORDS.
           READ STUDENT-DATA-FILE AT END ADD 1 TO EOF END-READ.
           ADD 1 TO COUNTER.
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

       END PROGRAM DAT-READER.
