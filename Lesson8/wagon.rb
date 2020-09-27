require_relative 'manufacturer.rb'

class Wagon
  include Manufacturer
  attr_reader :number, :type, :total
  attr_accessor :free, :occupied
  
  def initialize(options = {})
    @total = options[:total]
    @number = rand(100..999)
    @company = options[:company]
    @type = options[:type]
    @free = @total
    @occupied = 0
  end


end
