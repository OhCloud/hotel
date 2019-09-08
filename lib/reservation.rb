require 'date'
require 'pry'
require 'awesome_print'


require_relative "../lib/date_range.rb" 
require_relative "../lib/hotel_manager.rb"


module Hotel
  
  class Reservation < Date_Range
    attr_reader :room_id, :checkin_date, :checkout_date, :cost 
    
    def initialize(room_id, checkin_date, checkout_date, cost = 200)
      @room_id = room_id
      @checkin_date = checkin_date
      @checkout_date = checkout_date     
      @cost = cost 
    end
    
    def cost_of_stay
      return length_of_stay * @cost
    end
    
  end # end of class
end # end of module