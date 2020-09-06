class Route
  attr_reader :stations, :start_point, :end_point

  def initialize(start_point, end_point)
    @stations = [start_point, end_point]
  end

  def add_additional_station(station_name)
    @stations.insert(1, station_name)
  end

  def remove_additional_station(station_name)
    @stations.delete(station_name)
  end
end