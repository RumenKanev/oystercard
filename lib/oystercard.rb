class Oystercard
    MAXIMUM_BALANCE = 90
    attr_reader :balance

    def initialize
        @balance = 0
    end

    def top_up(cash)
        if (cash + balance) > MAXIMUM_BALANCE
          fail "Maximum balance of 90 exceeded" 
        else
          @balance += cash
        end
    end
end

