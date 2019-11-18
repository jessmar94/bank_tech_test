class Account

  def initialize
    @balance = 0
  end

  def get_balance
    return ("%.2f" % @balance)
  end

  def deposit(amount)
    @balance += amount
    credit = ("%.2f" % amount)
    return @deposit_made = "#{Time.now.strftime("%d/%m/%Y")} || #{credit} || || #{get_balance}"
  end

  def print_statement
    return "date || credit || debit || balance\n#{@deposit_made}"
  end

end
