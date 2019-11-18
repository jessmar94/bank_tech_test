# frozen_string_literal: true

class Account
  def initialize
    @balance = 0
    @transactions_array = []
  end

  def show_balance
    format_amnt(@balance)
  end

  def deposit(amount)
    @balance += amount
    @deposit = "#{format_date} || #{format_amnt(amount)} || || #{show_balance}"
    transaction_event(deposit: @deposit)
  end

  def withdraw(amount)
    @balance -= amount
    @withdraw = "#{format_date} || || #{format_amnt(amount)} || #{show_balance}"
    transaction_event(withdrawal: @withdraw)
  end

  def print_statement
    statement = "date || credit || debit || balance\n"
    @transactions_array.each do |txn|
      statement += txn + "\n"
    end
    statement.chomp("\n")
  end

  private

  def format_amnt(amount)
    ('%.2f' % amount)
  end

  def format_date
    Time.now.strftime('%d/%m/%Y')
  end

  def transaction_event(deposit: nil, withdrawal: nil)
    if deposit
      @transactions_array.unshift(deposit)
    elsif withdrawal
      @transactions_array.unshift(withdrawal)
    end
  end
end
