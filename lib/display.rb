# frozen_string_literal: true

# Display class formats money and date and prints the statement
class Display
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def format_statement
    statement = "date || credit || debit || balance\n"
    @transactions.each do |transaction|
      statement += transaction + "\n"
    end
    statement.chomp("\n")
  end

  def format_money(amount)
    ('%.2f' % amount)
  end

  def format_date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_withdraw(amount, balance)
    "#{format_date} || || #{format_money(amount)} || #{format_money(balance)}"
  end

  def format_deposit(amount, balance)
     "#{format_date} || #{format_money(amount)} || || #{format_money(balance)}"
  end
end
