require_relative 'manufacturer'
require_relative 'instance_counter'

# class Train
class Train
  include Manufacturer
  include InstanceCounter

  attr_accessor :speed, :wagons
  attr_reader :type, :number, :company

  @@trains = {}
  NUMBER_FORMAT = /^[A-Z1-9]{3}-?[A-Z1-9]{2}$/.freeze

  def initialize(options = {})
    @number = options[:number]
    validate!
    @type = options[:type]
    @company = options[:company]
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

  def each_wagon
    if @wagons.size.zero?
      puts 'у поезда нет созданных вагонов'
    else
      wagons.each.with_index(1) { |wagon, index| yield wagon, index }
    end
  end

  def validate!
    raise 'Номер не может быть пустым!' if number == ''
    raise 'Не правильный формат номера!' if number !~ NUMBER_FORMAT
    raise 'Название производителя не может быть пустым!' if company == ''
  end

  def stop
    @speed = 0
  end

  def stoped?
    speed.zero?
  end

  def route(route)
    @route = route.stations
    @current_station = 0
    @route[@current_station].arrival(self)
  end

  def current_station
    puts "Предыдущая станция: #{back_station.station_name}" if first_station?
    puts "Текущая станция: #{@route[@current_station].station_name}"
    puts "Следующая станция: #{next_station.station_name}" if last_station?
  end

  def forward
    @route[@current_station].send_train(self)
    @route[@current_station + 1].arrival(self)
    puts 'Поезд проехал одну станцию вперед'
    @current_station += 1
  end

  def back
    @route[@current_station].send_train(self)
    @route[@current_station - 1].arrival(self)
    puts 'Поезд проехал одну станцию назад'
    @current_station -= 1
  end

  def next_station
    @route[@current_station + 1]
  end

  def back_station
    @route[@current_station - 1]
  end

  private

  # Uses only this class
  def last_station?
    @route.index(@route.stations[@current_station]) != -1 && !@route[@current_station + 1].nil?
  end

  def first_station?
    @route.index(@route[@current_station]) != 0 && !@route[@current_station - 1].nil?
  end
end
