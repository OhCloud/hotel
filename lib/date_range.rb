require 'date'
require 'pry'
require 'awesome_print'

require_relative "../lib/reservation.rb"
require_relative "../lib/hotel_manager.rb"

module Hotel
  
  class Date_Range
    attr_reader :start_date, :end_date
    
    def initialize(start_date, end_date)
      
      unless end_date > start_date
        raise ArgumentError, "please adjust dates - end date cannot start before start date"
      end
      
      @start_date = start_date
      @end_date = end_date
      
    end # end of initialize
    
    
    
    
    
    
    
    
  end # end of class
end # end of module
