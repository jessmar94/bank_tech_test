# frozen_string_literal: true

require 'bank_account'

# allow(Time).to_receive(:now) { Time.now(2012, 01, 12)}


describe Account do
  describe '#print_statement' do
    it 'prints date: date, credit: 10, debit, balance:10 when deposit of 10 made' do
      subject.deposit(10)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || 10.00 || || 10.00"
      expect(subject.print_statement).to eq expected_return
    end

    it 'prints debit: 10, balance: -10 when withdrawal of 10 made' do
      subject.withdraw(10)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || 10.00 || -10.00"
      expect(subject.print_statement).to eq expected_return
    end

    it 'prints credit: 1000, balance: 1000 when deposit of 1000 made' do
      subject.deposit(1000)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || 1000.00 || || 1000.00"
      expect(subject.print_statement).to eq expected_return
    end

    it 'prints c: 2000, b: 3000, c: 1000, b: 1000 if d: 1000 & 2000 made' do
      subject.deposit(1000)
      subject.deposit(2000)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || || 3000.00\n#{Time.now.strftime('%d/%m/%Y')} || 1000.00 || || 1000.00"
      expect(subject.print_statement).to eq expected_return
    end

    it 'prints d:500, b:2500, c:2000, b:3000, c:1000, b:1000 if w:500 d:1000 d:2000 made' do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 2500.00\n#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || || 3000.00\n#{Time.now.strftime('%d/%m/%Y')} || 1000.00 || || 1000.00"
      expect(subject.print_statement).to eq expected_return
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
    it 'updates balance to -10 when withdraw 10' do
      subject.withdraw(10)
      expect(subject.show_balance).to eq '-10.00'
    end
  end
end
