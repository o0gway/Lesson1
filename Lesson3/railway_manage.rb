#Управление железной дорогой
class Station
  attr_reader :station_name, :show_trains

  def initialize(station_name)
    @station_name = station_name
    @show_trains = []
  end

  def arrival(train)
    @show_trains << train 
  end

  def send_train(train)
    @show_trains.delete(train)
  end

  def show_trains_by_type
    self.show_trains.each do |train|
      if train.inspect.include?('cargo')
        puts "Номера грузовых поездов:"
        puts train.instance_variable_get(:@number)
      else
        puts "Номера пассажирских поездов:"
        puts train.instance_variable_get(:@number)
      end
    end
  end
end

class Route
  attr_reader :route_list

  def initialize(start_point, end_point)
    @route_list = []
    @route_list << start_point
    @route_list << end_point
  end

  def add_additional_station(station_name)
    @route_list.insert(1, station_name)
  end

  def remove_additional_station(station_name)
    @route_list.delete(station_name)
  end
end

class Train
  attr_accessor :speed
  attr_reader :quantity_of_railway_carriages

  def initialize(number, type, quantity_of_railway_carriages)
    @number = number
    @type = type
    @quantity_of_railway_carriages = quantity_of_railway_carriages
    @current_station = 0
  end

  def stop
    @speed = 0
  end

  def add_railway_carriages(add)
    @quantity_of_railway_carriages += add if @speed == 0
  end

  def route(route_name)
    @route = route_name.route_list
  end 

  def current_station
    puts "Предыдущая станция: #{self.back_station}" if @route.index(@route[@current_station]) != 0
    puts "Текущая станция: #{@route[@current_station]}"
    puts "Следующая станция: #{self.next_station}" if @route.index(@route[@current_station]) != -1
  end

  def forward
    puts "Поезд проехал одну станцию вперед"
    @current_station += 1
  end

  def back
    puts "Поезд проехал одну станцию назад"
    @current_station -= 1
  end

  def next_station
    @route[@current_station + 1]
  end

  def back_station
    @route[@current_station - 1]
  end
end

station_1 = Station.new('Station1')
station_2 = Station.new('Station2')

st1_to_st2 = Route.new(station_1.station_name, station_2.station_name)

train1 = Train.new(123, 'cargo', 5)
train2 = Train.new(456, 'passengers', 7)

train1.route(st1_to_st2)
train2.route(st1_to_st2)

p station_1.show_trains

station_1.arrival(train1)
station_1.arrival(train2)

p station_1.show_trains

station_1.show_trains_by_type

train1.current_station

train1.forward


train1.current_station

st1_to_st2.add_additional_station('Between')

train1.current_station