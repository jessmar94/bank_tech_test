require 'transactions'

describe Transaction do

  describe '#transaction_event' do
    it 'pushes deposit of 10 into transactions array' do
      transaction = Transaction.new(["10-01-2012 || 10.00 || || 10.00"])
      expect(transaction.transactions).to eq ["10-01-2012 || 10.00 || || 10.00"]
    end
  end
end
