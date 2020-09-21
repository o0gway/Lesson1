require_relative 'manufacturer.rb'

class Wagon
  include Manufacturer
  attr_reader :number, :type
  
  def initialize(company)
    @number = rand(100..999)
    @company = company
  end
end
