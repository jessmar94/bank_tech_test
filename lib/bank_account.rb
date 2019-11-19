# frozen_string_literal: true

require_relative 'statement_printer'
require_relative 'transactions'

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
    @deposit = "#{format_date} || #{format_amnt(amount)} || || #{show_balance}"
    Transaction.new(@transactions).transaction_event(deposit: @deposit)
    puts "Deposit successful. Your balance is now £#{show_balance}."
  end

  def withdraw(amount)
    if @balance - amount > 0
      @balance -= amount
      @withdraw = "#{format_date} || || #{format_amnt(amount)} || #{show_balance}"
      Transaction.new(@transactions).transaction_event(withdrawal: @withdraw)
      puts "Withdrawal successful. Your balance is now £#{show_balance}."
    else
      puts "Sorry, you have insufficient funds in your account to withdraw."
    end
  end

  def print_statement
    Statement.new(@transactions).print
  end

  private

  def format_amnt(amount)
    ('%.2f' % amount)
  end

  def format_date
    Time.now.strftime('%d/%m/%Y')
  end

end
