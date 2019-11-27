# frozen_string_literal: true
require 'display'

describe Display do

  let (:transactions) { ['10-01-2012 || 10.00 || || 10.00'] }
  let (:display) { described_class.new(transactions)}
  let(:time_now) { '2019-11-27 20:49:08 +0000' }

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

  describe '#format_date' do
    it 'formats date to 01/01/1010' do
      expect(display.format_date).to eq '27/11/2019'
    end
  end
end
