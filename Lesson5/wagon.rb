require_relative 'manufacturer.rb'

class Wagon
  include Manufacturer
  attr_reader :number
  
  def initialize(number, company)
    @number = 0
    @company = company
  end
end
