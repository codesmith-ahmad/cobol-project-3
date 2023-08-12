## TODO <a id="todo"></a>

- [x] Create `.txt` to `.dat` file converting subroutine (located at `000-CONVERT-TXT2DAT`) | _Test passed_
- [ ] Create main **screen section**, just the appearance (in charge by [Savi]())
- [x] Have **search** subroutine **done** & **tested**
- [x] Make screen section for displaying student info
- [x] Create **update** subroutine for handling tuition payments (in charge by [Stefan]())  
        Notes from prof: [click](#click)
- [ ] Test update subroutine, test units ready, called `TEST-UPDATE.cbl`
- [x] Put the program table code in a file with extension `.cpy`
- [ ] Make sur the average calculator module is called correctly (part-3)
- [ ] Put all the pieces together
- [ ] Test that output report is out 
- [ ] Function chart

### Git commands

git|Command
-|-
branch|`git branch (branch)` then `git switch (branch)`
pull|`git pull origin (branch)`
commit|`git add .` then `git commit -am "message"`
push|`git push -u origin (branch)`

<br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br>

<a id="click"></a>
There are two transactions that must be used to update records in the Indexed Sequential Student File   
        For Student Number 111119 process a payment of  50.00 against the tuition owed.    
        For Student Number 111111 process a payment of 500.00 against the tuition owed.
        Use PIC9(4)V99 as the picture structure for the payment field.

[top](#todo)
