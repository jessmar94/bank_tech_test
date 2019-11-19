# frozen_string_literal: true

require 'bank_account'

describe Account do
  describe '#print_statement' do
    it 'prints table columns when no money in or out of Account' do
      result = 'date || credit || debit || balance'
      expect(subject.print_statement).to eq result
    end

    it 'prints balance: 1000 when deposit of 1000 made' do
      subject.deposit(1000)
      result = "#{Time.now.strftime('%d/%m/%Y')} || 1000.00 || || 1000.00"
      expect(subject.print_statement).to include result
    end

    it 'prints balance: 3000 when deposit of 1000 & 2000 made' do
      two_deposits
      result = "#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || || 3000.00"
      expect(subject.print_statement).to include result
    end

    it 'prints balance: 10 when withdrawal of 10 made' do
      deposit_20_withdraw_10
      result = "#{Time.now.strftime('%d/%m/%Y')} || || 10.00 || 10.00"
      expect(subject.print_statement).to include result
    end

    it 'prints balance: 2500 when w: 500, d: 2000, d: 1000' do
      deposit_withdraw
      result = "#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 2500.00"
      expect(subject.print_statement).to include result
    end
  end

  describe '#show_balance' do
    it 'returns 0 when no money in the account' do
      expect(subject.show_balance).to eq '0.00'
    end
  end

  describe '#deposit' do
    it 'updates balance to 10 when deposit 10' do
      subject.deposit(10)
      expect(subject.show_balance).to eq '10.00'
    end
  end

  describe '#withdraw' do
    it 'updates balance to 10 when withdraw 10' do
      deposit_20_withdraw_10
      expect(subject.show_balance).to eq '10.00'
    end
    it 'returns nil when withdraw 10 but balance is 0' do
      expect(subject.withdraw(10)).to eq nil
    end
  end
end
