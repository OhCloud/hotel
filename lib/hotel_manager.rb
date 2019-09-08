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
        raise ArgumentError, "room doesnt exist"
      end
      
      if !room_avail?(checkin_date, checkout_date).include?(room)
        raise ArgumentError, "room is not available"
      end
      reservation = Hotel::Reservation.new(room, checkin_date, checkout_date)
      @reservations << reservation
      return reservation
    end
    
    def room_avail?(checkin_date, checkout_date)
      #create date range
      #create array of avail_rooms
      #array for overlaps
      date_range = Date_Range.new(checkin_date, checkout_date)
      
      avail_rooms = @all_rooms
      
      # block_overlaps = @block_reservations.select do |block|
      #   block.overlaps?(date_range)
      # end
      
      # rooms_blocked = block_overlaps.reduce([]) do |list, block|
      #   list += block.rooms 
      # end
      
      # avail_rooms -= rooms_blocked
      
      rooms_that_overlap = @reservations.select do |reservation|
        reservation.overlaps?(date_range)
      end 
      
      rooms_reserved = rooms_that_overlap.map do |reservation|
        reservation.room_id
      end
      
      avail_rooms -= rooms_reserved
      
      if avail_rooms.empty? 
        raise ArgumentError, "error, error, no available rooms!" 
      end
      return avail_rooms
    end
    
    
    
    
    
  end # end of class
end # end of module
