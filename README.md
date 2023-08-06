Our main program is called STUDENT-REPORT.

**Summary**:

I added a `CALL` to `FILE-CONVERTER-MODULE` right after the READ statement so that it sends the record that has just been read to the module, but the problem is 304 is not a loop, so only a single entry shows up in the .dat file.

Instead, what i think we should do is pass the responsability of reading STUFILE.txt to the module, which reads it several times to convert the whole thing to .dat, then go back to the main program which will then read the .dat instead of the .txt

- How to create indexed sequential file (.dat)
- How to use CALL and modules