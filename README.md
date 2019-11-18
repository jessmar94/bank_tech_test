## Requirements
You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

Deposit = Credit (+)
Withdraw = Debit (-)

As a user,
So I know how much money I have,
I want to be able to check my balance.

As a user,
So I can put money into my account,
I want to be able to make a deposit.

As a user,
So I can take money out of my account,
I want to be able to make a withdrawal.

As a user,
So I have an overview of my account,
I want to be able to print my account statement with all my deposits and withdrawals.

INPUT         | OUTPUT
deposit(0)    | print_statement --> date || credit || debit || balance\nTime.now || || || 0

withdraw(0)   | print_statement --> date || credit || debit || balance\nTime.now || || || 0

deposit(10)    | print_statement --> date || credit || debit || balance\nTime.now || 10.00 || || 10.00

withdraw(10)    | print_statement --> date || credit || debit || balance\nTime.now ||  || 10.00 || 10.00

deposit(1000)    | print_statement --> date || credit || debit || balance\nTime.now || 1000.00 || || 1000.00

deposit(1000), deposit(2000)    | print_statement --> date || credit || debit || balance\nTime.now || 2000.00 || || 3000.00\nTime.now || 1000.00 || || 1000.00

deposit(1000), deposit(2000), withdraw(500)    | print_statement --> date || credit || debit || balance\nTime.now || || 500.00 || 2500.00\nTime.now || 2000.00 || || 3000.00\nTime.now || 1000.00 || || 1000.00
