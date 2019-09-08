require_relative 'test_helper.rb'

require 'date'
require 'pry'
require 'awesome_print'

describe "Hotel Manager class" do
  
  describe "Hotel Manager Initializer" do
    before do
      @hotel = Hotel::Hotel_Manager.new(3)
    end
    
    it "is an instance of room" do
      expect(@hotel).must_be_kind_of Hotel::Hotel_Manager
    end
    
    it "can give me a list of all of the rooms in the hotel" do
      expect(@hotel.all_rooms.length).must_equal 3
    end
  end # end of describe hotel
  
  describe "hotel manager add reservation" do
    before do
      @hotel = Hotel::Hotel_Manager.new(3)
      @checkin_date = Date.new(2019, 12, 14)
      @checkout_date = Date.new(2019, 12, 16)
    end
    
    it "will check to see If a room exist" do
      expect{@hotel.add_reservation(4, @checkin_date, @checkout_date)}.must_raise ArgumentError
    end
    
    it "will create a new reservation"do
    @hotel.add_reservation(1, @checkin_date, @checkout_date)
    expect(@hotel.reservations.length).must_equal 1
  end
end

describe "hotel manager check available room" do
  before do
    @hotel = Hotel::Hotel_Manager.new(3)
    
    @checkin_date = Date.new(2019, 12, 14)
    @checkout_date = Date.new(2019, 12, 16)
    
    @reservation_1 = @hotel.add_reservation(1, @checkin_date, @checkout_date)
    
    @checkin_date_2 = Date.new(2019, 12, 14)
    @checkout_date_2 = Date.new(2019, 12, 16)
    
    @reservation_2 = @hotel.add_reservation(2, @checkin_date, @checkout_date)
  end
  
  it "will check if room is available " do
    available_rooms = @hotel.room_avail?(@checkin_date, @checkout_date)
    expect(available_rooms.length).must_equal 1
    expect(available_rooms).wont_include 1
  end
  
  it "will return a list of available rooms" do
    available_rooms = @hotel.room_avail?(@checkin_date, @checkout_date)
    expect(available_rooms).must_be_kind_of Array
  end
  
  it "will raise an error if rooms are not available" do
    @reservation_3 = @hotel.add_reservation(3, @checkin_date, @checkout_date)
    expect{@hotel.room_avail?(@checkin_date, @checkout_date)}.must_raise ArgumentError
  end
end

describe "date of reservation" do
  before do 
    @hotel = Hotel::Hotel_Manager.new(3)
    
    @checkin_date = Date.new(2019, 12, 14)
    @checkout_date = Date.new(2019, 12, 16)
    
    @reservation_1 = @hotel.add_reservation(1, @checkin_date, @checkout_date)
    
    @checkin_date_2 = Date.new(2019, 12, 14)
    @checkout_date_2 = Date.new(2019, 12, 16)
    
    @reservation_2 = @hotel.add_reservation(2, @checkin_date, @checkout_date)
  end
  
  it "will return an array of dates of reservations" do
    array_dates = @hotel.date_of_reservation(@checkin_date)
    expect(array_dates).must_be_kind_of Array
    expect(array_dates[0]).must_be_kind_of Hotel::Reservation 
    expect(array_dates[0].checkin_date).must_equal @checkin_date
  end
  
  it "will ensure rooms are not double booked" do
    expect(@reservation_1.room_id).wont_equal @reservation_2.room_id
  end
  
  it "will allow you to reserve room on same day others check out date" do
    checkin_date = Date.new(2019, 12, 16)
    checkout_date = Date.new(2019, 12, 18)
    reservation = @hotel.add_reservation(1, checkin_date, checkout_date)
    expect(reservation).must_be_kind_of Hotel::Reservation
  end
end

end # end of module