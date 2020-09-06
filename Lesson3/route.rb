class Route
  attr_reader :trains, :start_point, :end_point

  def initialize(start_point, end_point)
    @trains = []
    @trains << start_point
    @trains << end_point
  end

  def add_additional_station(station_name)
    @trains.insert(1, station_name)
  end

  def remove_additional_station(station_name)
    @trains.delete(station_name)
  end
end