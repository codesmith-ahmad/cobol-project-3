      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      * Adding records to an indexed file using WRITE
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE
             ASSIGN "..\STUFILE.DAT"
             ORGANIZATION IS INDEXED
             ACCESS MODE IS RANDOM
             RECORD KEY IS STUDENT-NUMBER
             FILE STATUS IS STATUS-FILED.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-FILE.
       01 STUDENT-RECORD.
           05 STUDENT-NUMBER   PIC 9(7).
           05 STUDENT-NAME     PIC X(30).
           05 STUDENT-PHONE    PIC X(10).

       WORKING-STORAGE SECTION.
       01 STATUS-FILED PIC X(2).


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 100-INITIALIZE-RTN.
           PERFORM 200-PROCESS-RECORDS-RTN.
           PERFORM 300-TERMINATE-RTN.

            DISPLAY "wrote to file"
            STOP RUN.

       100-INITIALIZE-RTN.
           OPEN OUTPUT STUDENT-FILE.

       200-PROCESS-RECORDS-RTN.
           MOVE 0000001 TO STUDENT-NUMBER.
           MOVE "MY 1ST STUDENT" TO STUDENT-NAME.
           MOVE "6135689687" TO STUDENT-PHONE.
           PERFORM 301-WRITE-RTN.

           MOVE 0000001 TO STUDENT-NUMBER.
           MOVE "MY 1ST STUDENT" TO STUDENT-NAME.
           MOVE "6135689687" TO STUDENT-PHONE.
           PERFORM 301-WRITE-RTN.

       300-TERMINATE-RTN.
           CLOSE STUDENT-FILE.

       301-WRITE-RTN.
           DISPLAY STUDENT-RECORD.
           WRITE STUDENT-RECORD
            INVALID KEY
               DISPLAY "INVALID KEY"
               DISPLAY "STATUS-FIELD IS ", STATUS-FILED
           END-WRITE.
           DISPLAY "STATUS-FIELD IS ", STATUS-FILED.

       END PROGRAM YOUR-PROGRAM-NAME.
