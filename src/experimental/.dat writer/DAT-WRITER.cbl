       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAT-WRITER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TXT-FILE ASSIGN TO "../../STUFILE.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT DAT-FILE ASSIGN TO "../../STUFILE.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS F1
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD TXT-FILE.
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

       FD DAT-FILE.
           01 OUTBOUND.
               05 F1   PIC 9(6).
               05 F2     PIC 9(4)V99.
               05 F3     PIC X(40).
               05 F4 PIC X(6).
               05 F5    PIC X(7).
               05 F6    PIC 9(3).
               05 F7    PIC X(7).
               05 F8     PIC 9(3).
               05 F9   PIC X(7).
               05 F10    PIC 9(3).
               05 F11    PIC X(7).
               05 F12     PIC 9(3).
               05 F13    PIC X(7).
               05 F14     PIC 9(3).

       WORKING-STORAGE SECTION.
           01 FILE-STATUS PIC X(2).
           01 COUNTER     PIC 9(3).

       PROCEDURE DIVISION.

       OPEN INPUT TXT-FILE OUTPUT DAT-FILE.

       MOVE 0 TO F1. MOVE 9999.99 TO F2.
       MOVE "-------------------NAME1----------------" TO F3.
       MOVE "YYYYYY" TO F4.
       MOVE "XXXXXXX" TO F5 MOVE 999 TO F6.
       MOVE "XXXXXXX" TO F7 MOVE 999 TO F8.
       MOVE "XXXXXXX" TO F9 MOVE 999 TO F10.
       MOVE "XXXXXXX" TO F11 MOVE 999 TO F12.
       MOVE "XXXXXXX" TO F13 MOVE 999 TO F14.
       ADD 1 TO COUNTER.
       DISPLAY ">> STUFILE.dat: " OUTBOUND.
       WRITE OUTBOUND.

       MOVE 1 TO F1. MOVE 9999.99 TO F2.
       MOVE "-------------------NAME2----------------" TO F3.
       MOVE "YYYYYY" TO F4.
       MOVE "XXXXXXX" TO F5 MOVE 999 TO F6.
       MOVE "XXXXXXX" TO F7 MOVE 999 TO F8.
       MOVE "XXXXXXX" TO F9 MOVE 999 TO F10.
       MOVE "XXXXXXX" TO F11 MOVE 999 TO F12.
       MOVE "XXXXXXX" TO F13 MOVE 999 TO F14.
       ADD 1 TO COUNTER.
       DISPLAY ">> STUFILE.dat: " OUTBOUND.
       WRITE OUTBOUND.

       MOVE 2 TO F1. MOVE 9999.99 TO F2.
       MOVE "-------------------NAME3----------------" TO F3.
       MOVE "YYYYYY" TO F4.
       MOVE "XXXXXXX" TO F5 MOVE 999 TO F6.
       MOVE "XXXXXXX" TO F7 MOVE 999 TO F8.
       MOVE "XXXXXXX" TO F9 MOVE 999 TO F10.
       MOVE "XXXXXXX" TO F11 MOVE 999 TO F12.
       MOVE "XXXXXXX" TO F13 MOVE 999 TO F14.
       ADD 1 TO COUNTER.
       DISPLAY ">> STUFILE.dat: " OUTBOUND.
       WRITE OUTBOUND
               INVALID KEY DISPLAY "INVALID KEY"
           NOT INVALID KEY DISPLAY "OK"         END-WRITE.

       DISPLAY "TOTAL INSERTED: " COUNTER.

       CLOSE DAT-FILE.
       CLOSE TXT-FILE.

       END PROGRAM DAT-WRITER.
