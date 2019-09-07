require 'date'
require 'pry'
require 'awesome_print'

require_relative "../lib/reservation.rb"
require_relative "../lib/hotel_manager.rb"

module Hotel
  
  class Date_Range
    attr_reader :checkin_date, :checkout_date
    
    def initialize(checkin_date, checkout_date)
      unless checkout_date > checkin_date
        raise ArgumentError, "please adjust dates - end date cannot start before start date"
      end
      @checkin_date = checkin_date
      @checkout_date = checkout_date
    end # end of initialize
    
    def overlaps?(new_date_range)
      if new_date_range.checkout_date <= @checkin_date || new_date_range.checkin_date >= @checkout_date
        return false
      else
        return true
      end
    end
    
    def length_of_stay
      return @checkout_date - @checkin_date
    end
    
    def date_range_contains?(date)
      if date >= @checkin_date &&
        date < @checkout_date 
        return true
      else
        return false
      end
    end
    
  end # end of class
end # end of module
