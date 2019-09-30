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
        raise ArgumentError, "So Sorry, there are only 20 rooms available at Adas Hotel."
      else
        @all_rooms = [*1..hotel_size]
      end
      @available_rooms = []
      @reservations = []
      @block_reservations = []
    end
    
    def date_of_reservation(date)
      @reservations.select do |reservation|
        reservation.date_range_contains?(date)
      end
    end
    
    def add_reservation(room, checkin_date, checkout_date)
      if !@all_rooms.include?(room)
        raise ArgumentError, "So sorry but this room does not exist"
      end
      
      if !room_avail?(checkin_date, checkout_date).include?(room)
        raise ArgumentError, "So sorry, this room is not available"
      end
      reservation = Hotel::Reservation.new(room, checkin_date, checkout_date)
      @reservations << reservation
      return reservation
    end
    
    def room_avail?(checkin_date, checkout_date)
      date_range = Date_Range.new(checkin_date, checkout_date)
      
      avail_rooms = @all_rooms
      
      block_overlaps = @block_reservations.select do |block|
        block.overlaps?(date_range)
      end
      
      rooms_blocked = block_overlaps.reduce([]) do |list, block|
        list += block.rooms 
      end
      
      avail_rooms -= rooms_blocked
      
      rooms_that_overlap = @reservations.select do |reservation|
        reservation.overlaps?(date_range)
      end 
      
      rooms_reserved = rooms_that_overlap.map do |reservation|
        reservation.room_id
      end
      
      avail_rooms -= rooms_reserved
      
      if avail_rooms.empty? 
        raise ArgumentError, "Please feel free to check anyone of our other locations as rooms are not currently available" 
      end
      return avail_rooms
    end
    
    def create_block_room(checkin_date, checkout_date, cost, room_range) 
      rooms = room_avail?(checkin_date, checkout_date)
      
      if rooms.length < room_range.length 
        raise ArgumentError, "So sorry, there are not enough rooms available"
      end
      
      block = Block.new(checkin_date, checkout_date, cost, room_range)
      
      @block_reservations << block
      return block
    end
    
    def reserve_from_block(block)
      room = block.reserve_room
      reservation = Reservation.new(room, block.checkin_date, block.checkout_date, block.discounted_rate)
      
      @reservations << reservation
      
      return reservation
    end
    
  end # end of class
end # end of module
