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
      *     This would would work for a complete path to your file without spaces in the path name
      *     COPY  "C:\Users\saadawh\CopyLib\Copybook.DAT".
      * This works if you put the  Copybook.DAT file in same directory with .cbl file
            COPY  ".\Copybook.DAT".
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world".
            move 4 to counter-1.
            CALL 'testcallReplacing' USING BY CONTENT counter-1.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
