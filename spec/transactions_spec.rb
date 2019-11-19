# frozen_string_literal: true

require 'transactions'

describe Transactions do
  describe '#transaction_event' do
    it 'pushes deposit of 10 into transactions array' do
      transactions = Transactions.new(['10-01-2012 || 10.00 || || 10.00'])
      expect(transactions.transactions).to eq ['10-01-2012 || 10.00 || || 10.00']
    end
  end
end
