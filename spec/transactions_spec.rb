# frozen_string_literal: true

require 'transactions'

describe Transactions do
  describe '#transaction_event' do
    it 'pushes deposit of 10 into transactions array' do
      transaction = ['10-01-2012 || 10.00 || || 10.00']
      transactions = Transactions.new(transaction)
      expect(transactions.transactions).to eq transaction
    end
  end
end
