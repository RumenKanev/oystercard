require 'oystercard'

describe Oystercard do
    let(:entry_station){ double :station }
    let(:exit_station) { double :station }
    let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

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
  describe "#in journey" do  
  
    context "touch in" do 
         it 'is initially not in a journey' do
            expect(subject).not_to be_in_journey
          end
         it "can touch in" do
            subject.top_up(1)
            subject.touch_in(entry_station)
            expect(subject).to be_in_journey
            end
          it 'raise an error' do
            expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient balance to touch in"
          end
          it 'stores the entry station' do
            subject.top_up(1)
            subject.touch_in(entry_station)
            expect(subject.entry_station).to eq entry_station
          end
    end
    context "touch out" do 
        it "can touch out" do
            subject.top_up(1)
            subject.touch_in(entry_station)
            subject.touch_out(exit_station)
            expect(subject).not_to be_in_journey
        end
        it "charge customer" do 
            ticket_price = Oystercard::TICKET_PRICE
            subject.top_up(1)
            subject.touch_in(entry_station)
            expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-ticket_price)
        end
        it 'stores exit station' do
            subject.top_up(1)
            subject.touch_in(entry_station)
            subject.touch_out(exit_station)
            expect(subject.exit_station).to eq exit_station
          end
    end
  end
  describe "#complete journeys" do 
        it 'has an empty list of journeys by default' do
            expect(subject.journeys).to be_empty
        end
        it 'stores a journey' do
            subject.top_up(1)
            subject.touch_in(entry_station)
            subject.touch_out(exit_station)
            expect(subject.journeys).to include journey
        end
    end
end