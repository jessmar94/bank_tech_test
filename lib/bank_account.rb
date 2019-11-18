class Account

  def initialize
    @balance = 0.00
  end

  def print_statement
    return "date || credit || debit || balance\n || || || 0.00"
  end

  def get_balance
    return @balance
  end

end
