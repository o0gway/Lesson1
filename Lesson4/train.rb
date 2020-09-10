class Train
  attr_accessor :speed, :wagons
  attr_reader :number, :type 

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
  end

  def stop
    @speed = 0
  end

  def stoped?
    @speed == 0
  end  

  def route(route)
    @route = route.stations
    @current_station = 0
    @route[@current_station].arrival(self)
  end 

  def current_station
    puts "Предыдущая станция: #{self.back_station.station_name}" if first_station? 
    puts "Текущая станция: #{@route[@current_station].station_name}"
    puts "Следующая станция: #{self.next_station.station_name}" if last_station?
  end

  def forward
    @route[@current_station].send_train(self)
    @route[@current_station + 1].arrival(self)
    puts "Поезд проехал одну станцию вперед"
    @current_station += 1
  end

  def back
    @route[@current_station].send_train(self)
    @route[@current_station - 1].arrival(self)
    puts "Поезд проехал одну станцию назад"
    @current_station -= 1
  end

  def next_station
    @route[@current_station + 1]
  end

  def back_station
    @route[@current_station - 1]
  end

  def last_station?
    @route.index(@route.stations[@current_station]) != -1 && @route[@current_station + 1] != nil
  end

  def first_station?
    @route.index(@route[@current_station]) != 0 && @route[@current_station - 1] != nil
  end
end
