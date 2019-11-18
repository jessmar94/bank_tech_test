require 'bank_account' 

describe Account do

  describe '#print_statement' do
    it 'prints a statement with a balance of 0 when no deposits or withdrawals made' do
      expect(subject.print_statement).to eq "date || credit || debit || balance\n || || || 0.00"
    end
  end
end
