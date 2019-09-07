require 'date'
require 'pry'
require 'awesome_print'

require_relative "../lib/date_range.rb"
require_relative "../lib/hotel_manager.rb"

module Hotel 
  class Hotel_Manager
    attr_reader :reservation_id , :all_rooms, :available_rooms, :block_reservations
    
    def initialize
      @reservation_id = reservation_id
      @all_rooms = []
      @available_rooms = available_rooms
      @block_reservations = block_reservations
    end
    
    def room_count 
      room_count = 20
      room_count.times do |i|
        @all_rooms << Hotel::Rooms.new(room_id: i+1, cost: 200)
      end
    end
    
  end # end of class
end # end of module
