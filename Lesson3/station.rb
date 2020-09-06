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

  def show_trains_by_type
    self.trains_list.each do |train|
      if train.cargo?
        puts "Номера грузовых поездов:"
        puts train.number
      else
        puts "Номера пассажирских поездов:"
        puts train.number
      end
    end
  end 
end