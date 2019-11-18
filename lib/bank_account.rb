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
    if @balance == 0 || @balance < amount
      puts "Sorry you can't withdraw more than your balance. Your current balance is #{get_balance}."
    else
      @balance -= amount
      @withdrawal_made = "#{format_date} || || #{format_amount(amount)} || #{get_balance}"
      transaction_event(withdrawal: @withdrawal_made)
    end 
  end

  def print_statement
    statement =  "date || credit || debit || balance\n"
    @transactions_array.each do | txn |
      statement += txn + "\n"
    end
    return statement.chomp("\n")
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
      return @transactions_array.unshift(deposit)
    elsif withdrawal
      return @transactions_array.unshift(withdrawal)
    end
  end

end
