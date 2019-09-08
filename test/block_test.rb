require_relative 'test_helper.rb'

require 'date'
require 'pry'
require 'awesome_print'

describe "Block Class" do
  describe "Block Class Initializer" do
    before do
      @hotel = Hotel::Hotel_Manager.new(10)
      @checkin_date = Date.new(2019, 12, 14)
      @checkout_date = Date.new(2019, 12, 16)
      @block = Hotel::Block.new(@checkin_date, @checkout_date, 100, [1, 2, 3])
    end
    
    it "is an instance of a block of rooms" do
      expect(@block).must_be_kind_of Hotel::Block
    end
    
    it "will remove block room from available room in hotel" do
      expect(@hotel.available_rooms).wont_include 2
    end
    
    it "will raise an Argument Error if block requested is more than 5" do 
      expect{block = Hotel::Block.new(@checkin_date, @checkout_date, 100, [4, 5, 6, 7, 8, 9])}.must_raise ArgumentError
    end
    
  end #end of block class initializer
  
  describe "available rooms" do
    before do
      @hotel = Hotel::Hotel_Manager.new(5)
      checkin_date = Date.new(2019, 12, 14)
      checkout_date = Date.new(2019, 12, 16)
      @block = Hotel::Block.new(checkin_date, checkout_date, 100, [1, 2, 3])
    end
    
    it "will return true if rooms are available" do
      expect(@block.available?).must_equal true
    end
    
    it "it will return false if rooms are not available" do
      expect(!@block.available?).must_equal false
    end
  end # end of avail rooms block
  
  describe "reserve room" do
    before do
      @hotel = Hotel::Hotel_Manager.new(3)
      checkin_date = Date.new(2019, 12, 14)
      checkout_date = Date.new(2019, 12, 16)
      @block = Hotel::Block.new(checkin_date, checkout_date, 100, [1, 2, 3])
      @block.reserve_room 
      @block.reserve_room 
      @block.reserve_room 
    end
    
    it "will raise an Argument Error if there is no available room" do 
      expect{@block.reserve_room}.must_raise ArgumentError
    end
    
    it "will remove room from list of available rooms" do
      expect(@hotel.available_rooms).wont_include 2
    end
    
  end #end of describe block
  
end #end of module