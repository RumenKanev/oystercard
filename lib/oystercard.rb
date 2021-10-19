class Oystercard
    MAXIMUM_BALANCE = 90
    TICKET_PRICE = 1
    attr_reader :balance, :entry_station

    def initialize
        @balance = 0
    end

    def in_journey?
        !!entry_station
    end

    def top_up(cash)
        if (cash + balance) > MAXIMUM_BALANCE
          fail "Maximum balance of 90 exceeded" 
        else
          @balance += cash
        end
    end

    def touch_in(station)
        fail "Insufficient balance to touch in"if @balance < TICKET_PRICE
        @entry_station = station
    end

    def touch_out
        deduct(TICKET_PRICE)
        @entry_station = nil
    end

    private 

    def deduct(cash)
        @balance -= cash
    end
    
end

