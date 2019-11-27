# frozen_string_literal: true

require 'transactions'

describe Transactions do
  describe '#transaction_event' do
    it 'pushes deposit of 10 into transactions array' do
      transactions = Transactions.new([])
      transactions.transaction_event(deposit: 10)
      expect(transactions.transactions).to eq [10]
    end
  end
end
