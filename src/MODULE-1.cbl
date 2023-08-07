       IDENTIFICATION DIVISION.
       PROGRAM-ID. MODULE-1.

       ENVIRONMENT DIVISION. INPUT-OUTPUT SECTION. FILE-CONTROL.
      *    .dat output converted from raw .txt
           SELECT INDEXED-FILE ASSIGN TO "./STUFILE.dat"
                ORGANIZATION IS INDEXED
                ACCESS MODE IS SEQUENTIAL
                RECORD KEY IS OUT-STUDENT-NUMBER
                ALTERNATE KEY IS OUT-STUDENT-NAME WITH DUPLICATES
                FILE STATUS IS FILE-STATUS.

       DATA DIVISION.

           FILE SECTION.
           FD INDEXED-FILE EXTERNAL.
           01 OUTBOUND.
               05 OUT-STUDENT-NUMBER   PIC 9(6).
               05 OUT-TUITION-OWED     PIC 9(4)V99.
               05 OUT-STUDENT-NAME     PIC X(40).
               05 OUT-PROGRAM-OF-STUDY PIC X(6).
               05 OUT-COURSE-CODE-1    PIC X(7).
               05 OUT-COURSE-AVG-1     PIC 9(3).
               05 OUT-COURSE-CODE-2    PIC X(7).
               05 OUT-COURSE-AVG-2     PIC 9(3).
               05 OUT-COURSE-CODE-3    PIC X(7).
               05 OUT-COURSE-AVG-3     PIC 9(3).
               05 OUT-COURSE-CODE-4    PIC X(7).
               05 OUT-COURSE-AVG-4     PIC 9(3).
               05 OUT-COURSE-CODE-5    PIC X(7).
               05 OUT-COURSE-AVG-5     PIC 9(3).

           WORKING-STORAGE SECTION.
           01 FILE-STATUS PIC X(2).

           LINKAGE SECTION.
           01 INBOUND.
               05 IN-STUDENT-NUMBER   PIC 9(6).
               05 IN-TUITION-OWED     PIC 9(4)V99.
               05 IN-STUDENT-NAME     PIC X(40).
               05 IN-PROGRAM-OF-STUDY PIC X(6).
               05 IN-COURSE-CODE-1    PIC X(7).
               05 IN-COURSE-AVG-1     PIC 9(3).
               05 IN-COURSE-CODE-2    PIC X(7).
               05 IN-COURSE-AVG-2     PIC 9(3).
               05 IN-COURSE-CODE-3    PIC X(7).
               05 IN-COURSE-AVG-3     PIC 9(3).
               05 IN-COURSE-CODE-4    PIC X(7).
               05 IN-COURSE-AVG-4     PIC 9(3).
               05 IN-COURSE-CODE-5    PIC X(7).
               05 IN-COURSE-AVG-5     PIC 9(3).

       PROCEDURE DIVISION USING INBOUND.

           DISPLAY "RECEIVED STUDENT " IN-STUDENT-NUMBER " : "
               IN-PROGRAM-OF-STUDY.
           OPEN OUTPUT INDEXED-FILE.
           MOVE INBOUND TO OUTBOUND.
           DISPLAY "ABOUT TO WRITE THIS RECORD TO .dat:" OUTBOUND.
           WRITE OUTBOUND
            INVALID KEY DISPLAY "INVALID KEY. FILE STATUS: " FILE-STATUS
            NOT INVALID KEY DISPLAY "STATUS: " FILE-STATUS
           CLOSE INDEXED-FILE.

       GOBACK.
