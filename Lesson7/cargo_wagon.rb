class CargoWagon < Wagon
  attr_reader :total_volume
  attr_accessor :free_volume, :occupied_volume

  def initialize(total_volume, company)
    super(company)
    @total_volume = total_volume
    @type = 'Грузовой'
    @free_volume = @total_volume
    @occupied_volume = 0
  end

  def take_up_volume(take_up_volume)
    @free_volume = @total_volume - take_up_volume
    @occupied_volume = @total_volume - @free_volume
  end
end
