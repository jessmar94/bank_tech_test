class Transaction

  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def transaction_event(deposit: nil, withdrawal: nil)
    if deposit
      @transactions.unshift(deposit)
    elsif withdrawal
      @transactions.unshift(withdrawal)
    end
  end

end
