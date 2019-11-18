class Statement

  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def print
    statement = "date || credit || debit || balance\n"
    @transactions.each do |txn|
      statement += txn + "\n"
    end
    statement.chomp("\n")
  end
end
