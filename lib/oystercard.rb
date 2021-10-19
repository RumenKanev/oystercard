class Oystercard
    MAXIMUM_BALANCE = 90
    TICKET_PRICE = 1
    attr_reader :balance, :in_journey
    alias :in_journey? :in_journey

    def initialize
        @balance = 0
        @in_journey = false
    end

    def top_up(cash)
        if (cash + balance) > MAXIMUM_BALANCE
          fail "Maximum balance of 90 exceeded" 
        else
          @balance += cash
        end
    end

    def deduct(cash)
        @balance -= cash
    end

    def touch_in
        fail "Insufficient balance to touch in"if @balance < TICKET_PRICE
        @in_journey = true
    end

    def touch_out
        @in_journey = false
    end
    
end

