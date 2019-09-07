require 'date'
require 'pry'
require 'awesome_print'

require_relative "../lib/reservation.rb"
require_relative "../lib/hotel_manager.rb"

module Hotel
  
  class Rooms
    attr_reader :room_id, :cost 
    
    def initialize(room_id:, cost:)
      
      @room_id = room_id
      @cost = cost
      
    end
    
    
    
  end # end of class
  
end # end of module

