require 'bank_account'

describe Account do

  describe '#print_statement' do
    it 'prints date: date, credit: 10, debit, balance:10 when deposit of 10 made' do
      subject.deposit(10)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || 10.00 || || 10.00"
      expect(subject.print_statement).to eq expected_return
    end

    it 'prints date: date, credit:, debit: 10, balance: -10 when withdrawal of 10 made' do
      subject.withdraw(10)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || || 10.00 || -10.00"
      expect(subject.print_statement).to eq expected_return
    end

    it 'prints date: date, credit: 1000, debit:, balance: 1000 when deposit of 1000 made' do
      subject.deposit(1000)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00"
      expect(subject.print_statement).to eq expected_return
    end

    it 'prints date: date, credit: 2000, debit:, balance: 3000, date: date, credit: 1000, debit:, balance: 1000 when deposit of 1000 & 2000 made' do
      subject.deposit(1000)
      subject.deposit(2000)
      expected_return = "date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || 2000.00 || || 3000.00\n#{Time.now.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00"
      expect(subject.print_statement).to eq expected_return
    end
  end

  describe '#get_balance' do
    it 'returns 0 when no money in the account' do
      expect(subject.get_balance).to eq "0.00"
    end
  end

  describe '#deposit' do
    it 'updates balance to 10 when deposit 10' do
      subject.deposit(10)
      expect(subject.get_balance).to eq "10.00"
    end
  end

  describe '#withdraw' do
    it 'updates balance to -10 when withdraw 10' do
      subject.withdraw(10)
      expect(subject.get_balance).to eq "-10.00"
    end
  end
end
