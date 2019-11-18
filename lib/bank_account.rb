class Account

  def initialize
    @balance = 0
  end

  def get_balance
    return @balance
  end

  def deposit(amount)
    @balance += amount 
  end

  def print_statement
    return "date || credit || debit || balance\n || || || #{("%.2f" % @balance)}"
  end

end
