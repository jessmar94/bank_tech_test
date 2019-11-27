# frozen_string_literal: true

require_relative 'display'
require_relative 'transactions'
# Account manages deposits, withdrawals and viewing the account statement.
class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  def show_balance
    format_amnt(@balance)
  end

  def deposit(amount)
    @balance += amount
    @deposit = "#{date} || #{format_amnt(amount)} || || #{show_balance}"
    Transactions.new(@transactions).transaction_event(deposit: @deposit)
    puts "Deposit successful. Your balance is now £#{show_balance}."
  end

  def withdraw(amount)
    if (@balance - amount).positive?
      @balance -= amount
      @withdraw = "#{date} || || #{format_amnt(amount)} || #{show_balance}"
      Transactions.new(@transactions).transaction_event(withdrawal: @withdraw)
      puts "Withdrawal successful. Your balance is now £#{show_balance}."
    else
      puts 'Sorry, you have insufficient funds in your account to withdraw.'
    end
  end

  def print_statement
    Display.new(@transactions).print
  end

  private

  def format_amnt(amount)
    Display.new(@transactions).format_money(amount)
  end

  def date
    Display.new(@transactions).format_date
  end
end
