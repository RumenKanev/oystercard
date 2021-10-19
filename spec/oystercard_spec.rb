require 'oystercard'

describe Oystercard do

  describe "#balance" do 
    it "has a balance of zero" do 
      expect(subject.balance).to eq (0)
    end
  end
  describe "#top-up" do 
    it "cheks for top up" do 
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    it "can top up the balance" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
    it "raises an error" do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end
  describe "#deduct" do 
    it "checks for deduct" do 
      expect(subject).to respond_to(:deduct).with(1).argument
    end
    it "deducts money from balance" do 
      subject.top_up(20)  
      expect{subject.deduct 1 }.to change{subject.balance}.by -1
    end
  end
  describe "#in journey" do 
      
    context "touch in" do 
        it 'is initially not in a journey' do
            expect(subject).not_to be_in_journey
          end
        it "can touch in" do
            subject.top_up(1)
            subject.touch_in
            expect(subject).to be_in_journey
            end
          
          it 'raise an error' do
            expect{ subject.touch_in }.to raise_error "Insufficient balance to touch in"
          end
    end
    context "touch out" do 
        it "can touch out" do
            subject.top_up(1)
            subject.touch_in
            subject.touch_out
            expect(subject).not_to be_in_journey
          end
    
    end
   
  end

end