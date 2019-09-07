require_relative 'test_helper.rb'

require 'pry'
require 'awesome_print'

describe "Hotel Manager class" do
  
  describe "Hotel Manager Initializer" do
    before do
      # @all_rooms = Hotel::Hotel_Manager.new(@room_id: 4,
      #   @cost: 200)
    end
    
    it "is an instance of room" do
      expect(@all_rooms).must_be_kind_of Hotel::Hotel_Manager
    end
    
    it "can give me a list of all of the rooms in the hotel" do
      expect(@all_rooms.length).must_equal 20
    end
  end
end
