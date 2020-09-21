class PassengerWagon < Wagon 
  attr_reader :total_of_places
  attr_accessor :free_places, :occupied_places

  def initialize(total_of_places, company)
    super(company)
    @total_of_places = total_of_places
    @type = 'Пассажирский'
    @free_places = @total_of_places
    @occupied_places = 0
  end

  def take_the_place_of
    @free_places = total_of_places - 1
    @occupied_places = @total_of_places - @free_places
  end
end
