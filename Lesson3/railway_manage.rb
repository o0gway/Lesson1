#Управление железной дорогой
class Station
  
  def initialize(station_name)
    @station_name = station
  end

  def arrival
    #
  end

  def show_trains
    #
  end

  def show_trains_by_type
    #
  end

  def send_train
    #
  end
end

class Route

  def initialize(start_point, end_point)
    @routname = []
    @routname << start_point
    @routname << end_point
  end

  def add_additional_stations(station_name)
    @routname.insert(1, station_name)
  end

  def remove_additional_stations(station_name)
    @routname.delete(station_name)
  end
end

class Train
  attr_accessor :speed
  attr_reader :quantity_of_railway_carriages

  def initialize(number, type, quantity_of_railway_carriages)
    @number = number
    @type = type
    @quantity_of_railway_carriages = quantity_of_railway_carriages
  end

  def stop
    puts "Поезд оставновлен #{@speed = 0}"
  end

  def add_railway_carriages(add)
    @quantity_of_railway_carriages += add if @speed > 0
  end

  def add_route
    #
  end 

  def at_station
    #
  end
end
