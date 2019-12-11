# frozen_string_literal: true

require 'display'

describe Display do
  let (:transactions) { ['10-01-2012 || 10.00 || || 10.00'] }
  let (:display) { described_class.new(transactions) }
  let(:time_now) { '2019-11-27 20:49:08 +0000' }

  describe '#format_statement' do
    it 'formats the statement' do
      header = "date || credit || debit || balance\n"
      transaction = '10-01-2012 || 10.00 || || 10.00'
      expect(display.format_statement).to eq header + transaction
    end
  end

  describe '#format_money' do
    it 'formats input of 10 to 10.00' do
      expect(display.format_money(10)).to eq '10.00'
    end
  end

  describe '#format_date' do
    it 'formats date to 01/01/1010' do
      date = Time.now.strftime('%d/%m/%Y')
      expect(display.format_date).to eq date
    end
  end

  describe '#format_withdraw' do
    it 'formats the withdraw statement' do
      statement = "#{Time.now.strftime('%d/%m/%Y')} || || 10.00 || 20.00"
      expect(display.format_withdraw(10, 20)).to eq statement
    end
  end

  describe '#format_deposit' do
    it 'formats the deposit statement' do
      statement = "#{Time.now.strftime('%d/%m/%Y')} || 10.00 || || 10.00"
      expect(display.format_deposit(10, 10)).to eq statement
    end
  end
end
