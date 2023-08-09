      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      * Reading an indexed file sequentially as we did before
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE
             ASSIGN "..\STUFILE.DAT"
             ORGANIZATION IS INDEXED
             ACCESS MODE IS  SEQUENTIAL
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
       01 WS-EOF       PIC X.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 100-INITIALIZE-RTN.
           PERFORM 200-PROCESS-RECORDS-RTN UNTIL WS-EOF = "Y".
           PERFORM 300-TERMINATE-RTN.


            STOP RUN.

       100-INITIALIZE-RTN.
           OPEN INPUT STUDENT-FILE.
           READ STUDENT-FILE
             AT END MOVE "Y" TO WS-EOF
           END-READ.

       200-PROCESS-RECORDS-RTN.
           DISPLAY "STUDENT NUMBER IS  " ,STUDENT-NUMBER.
           DISPLAY "STUDENT-NAME  " , STUDENT-NAME.
           DISPLAY "STUDENT-PHONE  " , STUDENT-PHONE.
           PERFORM 301-READ-RTN.




       300-TERMINATE-RTN.
           CLOSE STUDENT-FILE.

       301-READ-RTN.
           READ STUDENT-FILE
             AT END MOVE "Y" TO WS-EOF
           END-READ.


       END PROGRAM YOUR-PROGRAM-NAME.
