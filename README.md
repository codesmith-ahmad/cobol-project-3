# Feel free to put some notes here

The base code is in `src`.

## First time set up

1. Open your terminal
2. Enter this command:
`git clone https://github.com/CavalierAhmad/cobol-project-3`
3. Remember where you put it so you can navigate to it

## Commands

#### New branch

`git branch [name]`
`git checkout [name]`

#### Commit

`git commit -am "message"`

#### Push

`git push -u origin main` (first time only, then just `git push`)

#### Pull
 
`git pull origin main` (first time only, then just `git pull`)

## Checklist

- [x] Convert STUFILE.txt to Indexed Sequential file.
- [ ] Update STUFILE on-line [transactions](#transactions) using a **screen section**
- [ ] Design the layout of the interactive Screen Section for user input and output.
- [ ] Implement logic to search the Indexed Sequential file for the entered student number, display if found
- [ ] Implement the logic to update the Indexed Sequential Student File with the modified data.
- [ ] Design the structure for the Program Table in a COPY member and implement the logic to include it.
- [ ] Migrate student average subprogram to external file, use CALL to invoke
- [ ] Function chart

## Project 3 Transactions <a id="transactions"></a>

There are two transactions that must be used to update records in the Indexed Sequential Student File   
For Student Number 411119 process a payment of  50.00 against the tuition owed.    
For Student Number 111111 process a payment of 500.00 against the tuition owed.    

Use PIC9(5)V99 as the picture structure for the payment field.
