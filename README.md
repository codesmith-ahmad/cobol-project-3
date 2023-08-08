Use `STUFILE.dat` for your tests. The converter program is located at `000-CONVERT-TXT2DAT`. It doesn't affect the code, it should be isolated from the rest until we got everything in order.

## TODO

- [x] Convert STUFILE.txt to Indexed Sequential file.
- [ ] Update STUFILE on-line [transactions](#transactions) using a **screen section**
- [ ] Design the layout of the interactive Screen Section for user input and output.
- [ ] Implement logic to search the Indexed Sequential file for the entered student number, display if found
- [ ] Implement the logic to update the Indexed Sequential Student File with the modified data.
- [ ] Design the structure for the Program Table in a COPY member and implement the logic to include it.
- [ ] Migrate student average subprogram to external file, use CALL to invoke
- [ ] Function chart

## Git commands

git|Command
-|-
branch|`git branch (branch)` then `git checkout (branch)`
pull|`git pull origin (branch)`
commit|`git add .` then `git commit -am "message"`
push|`git push -u origin (branch)`

[there's a git GUI in windows](git.png)

<br></br>
#### Project 3 Transactions <a id="transactions"></a>

There are two transactions that must be used to update records in the Indexed Sequential Student File   
For Student Number 411119 process a payment of  50.00 against the tuition owed.    
For Student Number 111111 process a payment of 500.00 against the tuition owed.    

Use PIC9(5)V99 as the picture structure for the payment field.

- How to create indexed sequential file
- How to read indexed sequential file
- How to use CALL and modules