       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST-MODULE.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       LINKAGE SECTION.
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

       PROCEDURE DIVISION USING STUDENT-RECORD.

           DISPLAY "ACCESSED TEST-MODULE!!!".
           DISPLAY STUDENT-RECORD.

       GOBACK.
