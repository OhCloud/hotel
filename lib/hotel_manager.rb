require 'date'
require 'pry'
require 'awesome_print'

require_relative "../lib/date_range.rb"
require_relative "../lib/hotel_manager.rb"

module Hotel 
  class Hotel_Manager
    attr_reader :all_rooms, :available_rooms, :reservations,:block_reservations
    
    def initialize(hotel_size)
      if hotel_size > 20 
        raise ArgumentError, "sorry charlie, cant do it, 20 rooms max ayyye."
      else
        @all_rooms = [*1..hotel_size]
      end
      @available_rooms = available_rooms
      @reservations = reservations
      @block_reservations = block_reservations
      
    end
    
    # def room_count 
    #   room_count = 20
    #   room_count.times do |i|
    #     @all_rooms << Hotel::Rooms.new(room_id: i+1, cost: 200)
    #   end
    # end
    
    def date_of_reservation(date)
      #come back
    end
    
    def add_reservation(room, checkin_date, checkout_date)
      if !@all_rooms.include?(room)
        raise ArgumentError, "room no, not there"
      end
      
      
    end
    
    
    
    
    
    
    
  end # end of class
end # end of module
