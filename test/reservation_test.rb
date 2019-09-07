require_relative 'test_helper.rb'

require 'date'
require 'pry'
require 'awesome_print'


describe "Reservation class" do
  
  describe "Reservation Initialize" do
    
    it "it creates an instance of reservation" do
      checkin_date = Date.new(2019, 12, 14)
      checkout_date = Date.new(2019, 12, 16)
      reservation = Hotel::Reservation.new(1, checkin_date, checkout_date, 200)
      expect(reservation).must_be_kind_of Hotel::Reservation
    end
  end
  
  describe "cost of stay" do
    
    it "it calculates the total amount of the reservation" do
      checkin_date = Date.new(2019, 12, 14)
      checkout_date = Date.new(2019, 12, 16)
      reservation = Hotel::Reservation.new(1, checkin_date, checkout_date, 200)
      expect(reservation.cost_of_stay).must_equal 400
    end
  end
end