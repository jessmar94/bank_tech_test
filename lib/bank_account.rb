class Account

  def initialize
    @balance = 0
    @transactions_array = []
  end

  def get_balance
    return format_balance(@balance)
  end

  def deposit(amount)
    @balance += amount
    @deposit_made = "#{format_date} || #{format_amount(amount)} || || #{get_balance}"
    transaction_event(deposit: @deposit_made)
  end

  def withdraw(amount)
    @balance -= amount
    @withdrawal_made = "#{format_date} || || #{format_amount(amount)} || #{get_balance}"
    transaction_event(withdrawal: @withdrawal_made)
  end

  def print_statement
    p "date || credit || debit || balance"
    @transactions_array.each do | txn |
      p txn
    end
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

  def transaction_event(deposit: nil, withdrawal: nil)
    if deposit
      return @transactions_array.unshift(@deposit_made)
    elsif withdrawal
      return @transactions_array.unshift(@withdrawal_made)
    end
  end

end
