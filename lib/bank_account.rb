class Account

  def initialize
    @balance = 0
  end

  def print_statement
    return "date || credit || debit || balance\n || || || #{"%.2f" % @balance}"
  end

  def get_balance
    return @balance
  end

end
