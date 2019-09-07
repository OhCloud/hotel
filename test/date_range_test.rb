require_relative 'test_helper.rb'

require 'date'
require 'pry'
require 'awesome_print'


describe "Date_Range class" do
  
  describe "Date_Range Initialize" do
    
    it "it is an instance of date_range class" do
      start_date = Date.new(2019, 12, 14)
      end_date = Date.new(2019, 12, 16)
      @sample_date = Hotel::Date_Range.new(start_date, end_date)
      expect(@sample_date).must_be_kind_of Hotel::Date_Range
    end
    
    it "will raise an Argument Error if end date happens before start date" do
      end_date = Date.new(2019, 12, 14)
      start_date = Date.new(2019, 12, 16)
      expect {
        Hotel::Date_Range.new(start_date, end_date)
      }.must_raise ArgumentError
    end
  end # end of ln 10
end # end of ln 8
