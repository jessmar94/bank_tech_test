## Summary
Interact with my code via a REPL like IRB to print a bank statement. (This doesn't need a command line interface that takes input from STDIN.)
The statement prints the date of the deposit or withdrawal, the amount deposited or withdrawn and the update balance.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

This project is composed of 3 classes - Account, Statement and Transactions. The Account class controls the user's ability to make deposits, withdrawals and to view their account statement.

This project has 11 passing tests.

## Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Approach
I first decided to put together some of the key user stories:
```
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
```
I then mocked out some of the key inputs and outputs to help form a basis from which to write my tests and I thought about edge cases.
```
INPUT         | OUTPUT
              | date || credit || debit || balance\nTime.now || || || 0

deposit(1000) | date || credit || debit || balance\nTime.now || 1000.00 || || 1000.00

withdraw(10)  | date || credit || debit || balance\nTime.now ||  || 10.00 || 10.00

deposit(1000), deposit(2000)  | date || credit || debit || balance\nTime.now || 2000.00 || || 3000.00\nTime.now || 1000.00 || || 1000.00

deposit(1000), deposit(2000), withdraw(500)  | date || credit || debit || balance\nTime.now || || 500.00 || 2500.00\nTime.now || 2000.00 || || 3000.00\nTime.now || 1000.00 || || 1000.00
```
Edge Cases:
- Unable to withdraw if they have insufficient funds
balance(0), withdraw(10)   | Error message

## How to Install and Run
```bash
> git clone https://github.com/jessmar94/bank_tech_test.git
> cd bank_tech_test 
> bundle install
> run the below commands in a REPL like IRB
```
```
2.6.0 :001 > require './lib/bank_account'
 => true
2.6.0 :002 > account = Account.new
 => #<Account:0x00007fdb0a9c1700 @balance=0, @transactions=[]>
2.6.0 :003 > account.deposit(1000)
Deposit successful. Your balance is now £1000.00.
 => nil
2.6.0 :004 > account.deposit(2000)
Deposit successful. Your balance is now £3000.00.
 => nil
2.6.0 :005 > account.withdraw(500)
Withdrawal successful. Your balance is now £2500.00.
 => nil
2.6.0 :006 > puts account.print_statement
date || credit || debit || balance
19/11/2019 || || 500.00 || 2500.00
19/11/2019 || 2000.00 || || 3000.00
19/11/2019 || 1000.00 || || 1000.00
```

## How to Test
```bash
> rspec # Run the tests to ensure it works
> rubocop # Check code quality
```
