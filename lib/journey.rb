class Journey

    PENALTY_FARE = 6
    FARE  = 1

    attr_reader :entry_station, :entry_station
  
    def initialize(entry_station: nil, exit_station: nil)
      @entry_station = entry_station
      @exit_station = exit_station
      @complete = false
    end
    
    def finish(station)
        @complete = true
        self
    end
  
    def complete?
      @complete
    end
  
   
    def fare
        if @complete == true
            FARE 
        else
        PENALTY_FARE
        end
     
    end

  end