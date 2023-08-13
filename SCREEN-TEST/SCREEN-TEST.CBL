       IDENTIFICATION DIVISION.
       PROGRAM-ID. OVERLAY-SCREENS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SCREEN-NUMBER PIC 9 VALUE 1.
       01 USER-INPUT    PIC X(10).

       SCREEN SECTION.
       01 SCREEN-1.
          03 BLANK SCREEN.
          03 LINE 5 COLUMN 10 "SCREEN 1".
          03 LINE 10 COLUMN 10 "Press '1' to switch to Screen 2.".
          03 LINE 15 COLUMN 10 "User input: " ENTRY USER-INPUT.

       01 SCREEN-2.
          03 BLANK SCREEN.
          03 LINE 5 COLUMN 10 "SCREEN 2".
          03 LINE 10 COLUMN 10 "Press '2' to switch to Screen 1.".

       PROCEDURE DIVISION.
           PERFORM UNTIL USER-INPUT = "X"
               DISPLAY SCREEN-1 WHEN SCREEN-NUMBER = 1
               DISPLAY SCREEN-2 WHEN SCREEN-NUMBER = 2
               ACCEPT USER-INPUT
               IF USER-INPUT = "1" AND SCREEN-NUMBER = 1
                   MOVE 2 TO SCREEN-NUMBER
               ELSE IF USER-INPUT = "2" AND SCREEN-NUMBER = 2
                   MOVE 1 TO SCREEN-NUMBER
               END-IF
           END-PERFORM.
           STOP RUN.
