

module Hotel
  
  class Reservation
    attr_reader :room_id, :start_date, :end_date, :cost 
    
    def initialize(room_id, start_date, end_date, cost = 200)
      @room_id = room_id
      @start_date = start_date
      @end_date = end_date
      @cost = cost
      
    end
    
  end
  
end