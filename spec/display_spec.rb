# frozen_string_literal: true
require 'display'
# Display class formats money and date and prints the statement
describe Display do

  let (:transactions) { ['10-01-2012 || 10.00 || || 10.00'] }
  let (:display) { described_class.new(transactions)}

  describe '#initialize' do
    it 'starts with the transactions array' do
      expect(display.transactions).to eq transactions
    end
  end

  describe '#format_money' do
    it 'formats input of 10 to 10.00' do
      expect(display.format_money(10)).to eq '10.00'
    end
  end
end
