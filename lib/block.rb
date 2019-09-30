require 'date'
require 'pry'
require 'awesome_print'

require_relative "../lib/date_range.rb"
require_relative "../lib/hotel_manager.rb"


module Hotel 
  class Block < Date_Range
    attr_reader :rooms_requested, :available_rooms, :discounted_rate, :reserved_rooms
    
    def initialize(checkin_date, checkout_date, discounted_rate, rooms_requested)
      if rooms_requested.length > 5
        raise ArgumentError, "So sorry, blocks can not conatin more than 5 rooms"
      else
        @rooms_requested = rooms_requested
      end
      @available_rooms = rooms_requested.dup 
      @discounted_rate = discounted_rate
      @reserved_rooms = []
      
      super(checkin_date, checkout_date) 
    end
    
    def available?
      if @available_rooms.empty? == false
        return true
      end
    end
    
    def reserve_room
      if !available? 
        raise ArgumentError, "There is no available room"
      end
      reserved_room = @available_rooms.pop
      @reserved_rooms << reserved_room
      return reserved_room
    end
    
  end #end of block
end #end of module