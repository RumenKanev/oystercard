require 'oystercard'

describe Oystercard do

  describe '#balance' do 
    it "has a balance of zero" do 
      expect(subject.balance).to eq (0)
    end
  end

end