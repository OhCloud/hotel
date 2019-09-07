require_relative 'test_helper.rb'

require 'date'
require 'pry'
require 'awesome_print'

describe "Hotel Manager class" do
  
  describe "Hotel Manager Initializer" do
    before do
      @all_rooms = Hotel::Hotel_Manager.new()
    end
    
    it "is an instance of room" do
      expect(@all_rooms).must_be_kind_of Hotel::Hotel_Manager
    end
    
    it "can give me a list of all of the rooms in the hotel" do
      expect(@all_rooms.room_count).must_equal 20
    end
    
    
  end # end of class
end # end of module
