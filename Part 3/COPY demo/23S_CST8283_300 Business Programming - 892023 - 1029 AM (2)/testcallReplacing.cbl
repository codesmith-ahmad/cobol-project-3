      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. testcallReplacing.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 COUNTER-1 PIC 999.  *> if we don't replace the COUNTER-1 NAME
                              *> at the copy, we'll have a compilation
                              *> error.

       LINKAGE SECTION.
      *  COPY  "C:\Users\saadawh\CopyLib\Copybook.DAT".
         COPY  ".\Copybook.DAT" REPLACING COUNTER-1
                BY COUNTER-2.
       PROCEDURE DIVISION USING COUNTER-2.
       MAIN-PROCEDURE.
            DISPLAY "Hello world from called program.".
            DISPLAY " and value of counter-2 is:  " counter-2.
            EXIT PROGRAM.
       END PROGRAM testcallReplacing.
