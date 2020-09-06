class Train
  attr_accessor :speed
  attr_reader :quantity_of_railway_carriages, :number, :type

  def initialize(number, type, quantity_of_railway_carriages)
    @number = number
    @type = type
    @quantity_of_railway_carriages = quantity_of_railway_carriages    
  end

  def cargo?
    self.type == 'cargo'
  end
  
  def stop
    @speed = 0
  end

  def stoped?
    @speed == 0
  end  

  def add_railway_carriages(add)
    @quantity_of_railway_carriages += add if stoped?
  end

  def route(route_name)
    @route = route_name.trains
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
    @route.index(@route[@current_station]) != -1 && @route[@current_station + 1] != nil
  end

  def first_station?
    @route.index(@route[@current_station]) != 0 && @route[@current_station - 1] != nil
  end
end