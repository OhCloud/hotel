require 'date'

require_relative 'test_helper.rb'

describe "Room class" do
  
  describe "Room class initialize" do
    before do
      @rooms = Hotel::Rooms.new(room_id: 12, cost: 200,)
    end
    
    it "is an instance of room" do
      expect(@rooms).must_be_kind_of Hotel::Rooms
    end
    
    
    
    
    
    
    
    
    
  end # end of class
  
end # end of module