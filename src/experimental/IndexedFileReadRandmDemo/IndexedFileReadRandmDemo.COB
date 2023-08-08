      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      * Reading records from an indexed file randomly using the record key
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE
             ASSIGN "..\STUFILE.DAT"
             ORGANIZATION IS INDEXED
             ACCESS MODE IS  RANDOM
             RECORD KEY IS STUDENT-NUMBER
             ALTERNATE key IS STUDENT-NAME
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
       01 WS-EOF       PIC X.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 100-INITIALIZE-RTN.

           PERFORM 300-TERMINATE-RTN.


            STOP RUN.

       100-INITIALIZE-RTN.
          OPEN I-O STUDENT-FILE.
          MOVE 0000001 TO STUDENT-NUMBER.
          READ STUDENT-FILE
             INVALID KEY
               DISPLAY "NO RECORD EXIST FOR STUDENT NUMBER ",
               STUDENT-NUMBER
              NOT INVALID KEY
               DISPLAY "STUDENT RECORD FOUND"
               PERFORM 200-PRINT-STUDENT-RECORD
           END-READ.

       200-PRINT-STUDENT-RECORD.
           DISPLAY "STUDENT NUMBER IS  " ,STUDENT-NUMBER.
           DISPLAY "STUDENT-NAME  " , STUDENT-NAME.
           DISPLAY "STUDENT-PHONE  " , STUDENT-PHONE.





       300-TERMINATE-RTN.
           CLOSE STUDENT-FILE.




       END PROGRAM YOUR-PROGRAM-NAME.
