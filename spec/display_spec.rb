# frozen_string_literal: true

require 'display'

describe Display do
  describe '#initialize' do
    it 'starts with the transactions array' do
      transactions = ['10-01-2012 || 10.00 || || 10.00']
      statement = Display.new(transactions)
      expect(statement.transactions).to eq transactions
    end
  end
end
