class Account

  def initialize
    @balance = 0
  end

  def get_balance
    return format_balance(@balance)
  end

  def deposit(amount)
    @balance += amount
    @transaction = "#{format_date} || #{format_amount(amount)} || || #{get_balance}"
    # @transactions_array << @deposit_made
  end

  def withdraw(amount)
    @balance -= amount
    @transaction = "#{format_date} || || #{format_amount(amount)} || #{get_balance}"
  end

  def print_statement
    return "date || credit || debit || balance\n#{@transaction}"
  end

  private

  def format_amount(amount)
    ("%.2f" % amount)
  end

  def format_balance(balance)
    ("%.2f" % @balance)
  end

  def format_date
    Time.now.strftime("%d/%m/%Y")
  end

end
