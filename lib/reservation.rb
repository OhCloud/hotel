require 'date'
require 'pry'
require 'awesome_print'


require_relative "../lib/date_range.rb" 
require_relative "../lib/hotel_manager.rb"


module Hotel
  
  class Reservation
    attr_reader :room_id, :checkin_date, :checkout_date, :cost 
    
    def initialize(room_id, checkin_date, checkout_date, cost = 200)
      @room_id = room_id
      @checkin_date = checkin_date
      @checkout_date = checkout_date     
      @cost = cost 
    end
    
    
    
    
    
  end # end of class
end # end of module