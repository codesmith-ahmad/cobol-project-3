## TODO

- [x] Create `.txt` to `.dat` file converting subroutine (located at `000-CONVERT-TXT2DAT`) | _Test passed_
- [ ] Create **screen section** (in charge by [Savi]())
- [ ] Create and test **search** subroutine [match key and display] (in charge by [Cam]())
- [ ] Search function should display correctly on screen section [update screen section]
- [ ] Create **update** subroutine [delete and insert, file may need to be sorted] (in charge by [Stefan]())  
        Notes from prof: There are two transactions that must be used to update records in the Indexed Sequential Student File   
        For Student Number 111119 process a payment of  50.00 against the tuition owed.    
        For Student Number 111111 process a payment of 500.00 against the tuition owed.
      Use PIC9(5)V99 as the picture structure for the payment field.
- [ ] Test update subroutine, test units ready [Before vs after]
- [x] Data Division which declares the structure of the Program Table must be removed from the program code. Place (save) that code in an external file. In the Report Program, you must use the COPY command in your source code to access that code 
- [x] Migrate student average subprogram to external file, use CALL to invoke
- [ ] Confirm part-3 is done and merge (in charge by [Ahmad]())
- [ ] Merge subroutines
- [ ] Test to make sure output report is intact and updates when we do a transaction (substract from tuition)
- [ ] Documentation

### Git commands

git|Command
-|-
branch|`git branch (branch)` then `git checkout (branch)`
pull|`git pull origin (branch)`
commit|`git add .` then `git commit -am "message"`
push|`git push -u origin (branch)`

[there's a git GUI in windows](git.png)

- How to create indexed sequential file
- How to read indexed sequential file
- How to use CALL and modules
