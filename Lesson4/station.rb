class Station
  attr_reader :station_name, :trains_list

  def initialize(station_name)
    @station_name = station_name
    @trains_list = []
  end

  def arrival(train)
    @trains_list << train 
  end

  def send_train(train)
    @trains_list.delete(train)
  end
end