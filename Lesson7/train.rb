require_relative 'manufacturer.rb'
require_relative 'instance_counter.rb'

class Train
  include Manufacturer
  include InstanceCounter
  attr_accessor :speed, :wagons
  attr_reader :type, :number, :company
  @@trains = {}
  NUMBER_FORMAT = /^[A-Z1-9]{3}-?[A-Z1-9]{2}/

  def initialize(number, type, company)
    @number = number
    validate!
    @type = type
    @company = company
    validate!
    @wagons = []
    @@trains[number] = self
    register_instance
  end

  def self.trains
    @@trains
  end

  def self.find(number) 
    if @@trains[number]
      puts 'Поезд найден'
    else
      puts 'Поезд не найден'
    end 
  end

  # def valid?
  #   validate!
  #   true
  # rescue StandardError => error
  #   false
  # end

  def validate!
    raise 'Номер не может быть пустым!' if number == ''
    raise 'Не правильный формат номера!' if number !~ NUMBER_FORMAT
    raise 'Название производителя не может быть пустым!' if company == ''     
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

  private 

  # Используются только в этом классе
  def last_station?
    @route.index(@route.stations[@current_station]) != -1 && @route[@current_station + 1] != nil
  end

  def first_station?
    @route.index(@route[@current_station]) != 0 && @route[@current_station - 1] != nil
  end
end
