# frozen_string_literal: true

require 'statement_printer'

describe Statement do
  describe '#initialize' do
    it 'starts with the transactions array' do
      transactions = ['10-01-2012 || 10.00 || || 10.00']
      statement = Statement.new(transactions)
      expect(statement.transactions).to eq transactions
    end
  end
end
