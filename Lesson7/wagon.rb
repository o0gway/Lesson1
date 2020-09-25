require_relative 'manufacturer.rb'

class Wagon
  include Manufacturer
  attr_reader :number, :type, :total
  attr_accessor :free, :occupied
  
  def initialize(total, company, type)
    @total = total
    @number = rand(100..999)
    @company = company
    @free = @total
    @occupied = 0
  end


end
