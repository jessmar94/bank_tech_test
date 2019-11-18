require 'bank_account'

describe Account do

  describe '#print_statement' do
    it 'prints a statement with a balance of 0 when no deposits or withdrawals made' do
      expect(subject.print_statement).to eq "date || credit || debit || balance\n || || || 0.00"
    end
  end

  describe '#get_balance' do
    it 'returns 0 when no money in the account' do
      expect(subject.get_balance).to eq 0.00
    end
  end

  describe '#deposit' do
    it 'updates balance to 10 when deposit 10' do
      subject.deposit(10)
      expect(subject.get_balance).to eq 10.00
    end
  end
end
