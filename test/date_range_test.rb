require_relative 'test_helper.rb'

require 'date'
require 'pry'
require 'awesome_print'


describe "Date_Range class" do
  
  describe "Date_Range Initialize" do
    
    it "it is an instance of date_range class" do
      checkin_date = Date.new(2019, 12, 14)
      checkout_date = Date.new(2019, 12, 16)
      @sample_date = Hotel::Date_Range.new(checkin_date, checkout_date)
      expect(@sample_date).must_be_kind_of Hotel::Date_Range
    end
    
    it "will raise an Argument Error if end date happens before start date" do
      checkout_date = Date.new(2019, 12, 14)
      checkin_date = Date.new(2019, 12, 16)
      expect {
        Hotel::Date_Range.new(checkin_date, checkout_date)
      }.must_raise ArgumentError
    end
  end
  
  describe "overlaps of date ranges" do
    
    it "will return true if date ranges overlap" do
      current_range = Hotel::Date_Range.new(Date.new(2019, 12, 14), Date.new(2019, 12, 16))
      new_date_range = Hotel::Date_Range.new(Date.new(2019, 12, 15), Date.new(2019, 12, 17))
      expect(current_range.overlaps?(new_date_range)).must_equal true
    end
    
    it "will return false if date ranges do not overlap" do
      current_range = Hotel::Date_Range.new(Date.new(2019, 12, 14), Date.new(2019, 12, 16))
      new_date_range = Hotel::Date_Range.new(Date.new(2018, 12, 15), Date.new(2018, 12, 17))
      expect(current_range.overlaps?(new_date_range)).must_equal false
    end
  end
  
  describe "date range contains date" do
    
    it "will return true if date is in date range" do
      date = Date.new(2019, 12, 16)
      date_range = Hotel::Date_Range.new(Date.new(2019, 12, 15), Date.new(2019, 12, 17))
      expect(date_range.date_range_contains?(date)).must_equal true
    end
    
    it "will return false if date is same as checkout date" do
      date = Date.new(2019, 12, 17)
      date_range = Hotel::Date_Range.new(Date.new(2019, 12, 15), Date.new(2019, 12, 17))
      expect(date_range.date_range_contains?(date)).must_equal false
    end
    
    it "will return false if date is not in date range" do
      date = Date.new(2019, 12, 16)
      date_range = Hotel::Date_Range.new(Date.new(2018, 12, 15), Date.new(2018, 12, 17))
      expect(date_range.date_range_contains?(date)).must_equal false
    end
  end
  
end # end of ln 8
