      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 COUNTER-1 PIC 99.
      *     This would would work for a complete path to your file without spaces in the path name
      *     COPY  "C:\Users\saadawh\CopyLib\Copybook.DAT".
      * This works if you put the  Copybook.DAT file in same directory with .cbl file
            COPY  ".\Copybook.DAT"
            REPLACING   COUNTER-1 BY COUNTER-2.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           move 4 to counter-1.
           COPY ".\Copybook.dat".
           DISPLAY "Hello world".

           CALL 'TESTCALL' USING BY CONTENT counter-1.

           STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
