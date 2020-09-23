#Управление железной дорогой
require_relative 'train.rb'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'wagon.rb'
require_relative 'passenger_wagon.rb'
require_relative 'cargo_wagon.rb'
require 'byebug'

class Interface
    
  def initialize
    @stations = []
    @routes = []
  end

  puts
  puts '*' * 80
  puts "Программа управлением железной дорогой"
  puts '*' * 80

  def run
    loop do
      menu
      user_choice = gets.to_i

      case user_choice
      when 1
        create_station
      when 2
        create_train
      when 3
        manage_route
      when 4
        add_route_to_train
      when 5
        add_wagon
      when 6
        del_wagon
      when 7
        move_forward
        press_enter_to_continue
      when 8
        move_back
        press_enter_to_continue
      when 9
        show_trains_on_station
      when 10
        byebug
        find_train
        press_enter_to_continue
      when 0
        menu
      when 99
        break
      else
        puts "Такого действия не существует"
      end
    end
  end

  protected

  # Нет смысла обращаться к меню напрямую, оно все равно вызывается из другого метода и никогда напрямую
  def menu
    puts
    puts "1. Добавить станцию"
    puts "2. Добавить поезд"
    puts "3. Управление маштрутом"
    puts "4. Назначить маршрут поезду"
    puts "5. Добавить вагон к поезду"
    puts "6. Отцепить вагон от поезда"
    puts "7. Проехать на одну станцию вперед"
    puts "8. Проехать на одну станцию назад"
    puts "9. Вывести список станций, поездов и вагонов"
    puts "10. Найти поезд по его номеру"
    puts "99. Выйти из программы"
    puts
    print "Выберите один из вариантов действий: "
  end

  # Все следующие методы могут работать в секции private
  def create_station
    print 'Введите название станции: '
    name = gets.chomp.strip.upcase
    @stations << Station.new(name)
  rescue StandardError => error
    puts "Error: #{error.message}"
    retry
  end

  def select_station(message = 'Выберите станцию: ')
    show_stations
    print message
    number = gets.to_i
    @stations[number - 1]
  end

  def create_train
    puts
    puts "1. Пассажирский"
    puts "2. Грузовой"
    print 'Выберите тип поезда: '
    type = gets.to_i

    number = add_train_number

    if type == 1
      PassengerTrain.new(number, 'Passenger', add_manufacturer)
    elsif type == 2
      CargoTrain.new(number, 'Cargo', add_manufacturer)
    else
      menu
    end
    puts "Поезд #{number} успешно создан"
  rescue StandardError => error
    puts "Error: #{error.message}"
    retry
  end

  def add_train_number
    print "Введите номер поезда: "
    number = gets.strip.upcase
  end

  def add_manufacturer
    print "Введите производителя: "
    manufacturer = gets.strip
  end

  def manage_route
    puts '1. Добавить новый маршрут'
    puts '2. Изменить маршрут'
    puts '3. Вернуться назад'
    print 'Выберите дейсвтие: '
    user_choice = gets.to_i
    case user_choice
    when 1
      create_route
    when 2
      change_route
    when 3
      menu
    end 
  end
  
  def show_stations
    @stations.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name}"
    end
  end

  def create_route
    raise 'Для того чтобы создать маршрут, необходимо как минимум 2 соданные станции' if @stations.size < 2
    station1 = select_station('Выберите начальную станцию: ')
    station2 = select_station('Выберите конечную станцию: ')
    @routes << Route.new(station1, station2)
  rescue StandardError => error
    puts "Error: #{error.message}"
  end

  def change_route
    selected_route = select_route
    puts '1. Добавить станцию в маршрут'
    puts '2. Удалить станцию в маршруте'
    puts '3. Вернуться назад'
    print 'Выберите действие: '
    number = gets.to_i
    menu if number == 0
    case number
    when 1
      selected_station = select_station
      selected_route.add_additional_station(selected_station)
    when 2
      selected_station = select_station
      selected_route.remove_additional_station(selected_station)
    when 3
      menu
    end
  end

  def show_routes
    @routes.each.with_index(1) do |route, index|
      puts "#{index}. #{route.stations.first.name} --> #{route.stations.last.name}"
    end
  end

  def show_trains
    Train.trains.each_key.with_index(1) {|train, index| puts "#{index}. Номер поезда: #{train}"}
  end

  def add_route_to_train
    raise 'У вас нет ни одного созданного поезда или маршрута' if Train.trains.empty? || @routes.size.zero?
    selected_train = select_train # Выбираем поезд
    selected_route = select_route # Выбирем маршрут
    selected_train.route(selected_route)
  rescue => error
    puts "Error: #{error.message}"
  end

  def move_forward
    selected_train = select_train
    selected_train.forward
  end

  def move_back
    selected_train = select_train
    selected_train.back
  end

  def select_train
    show_trains
    print 'Выберите поезд: '
    number = gets.to_i
    select_train = Train.trains
    select_train = select_train.to_a
    select_train = select_train[number - 1][1]
  end

  def select_route
    show_routes
    print 'Выберите машрут: '
    route = gets.to_i
    select_route = @routes[route - 1]
  end

  def add_wagon
    selected_train = select_train
    quantity_wagons = selected_train.wagons.size + 1

    if selected_train.type == "Passenger"
      print 'Введите общее коливество мест в вагоне: '
      places = gets.to_i
      selected_train.wagons << PassengerWagon.new(places, add_manufacturer) 
      puts "Количество вагонов в поезде: #{selected_train.wagons.size}"
    elsif selected_train.type == "Cargo"
      print 'Введите общий объем вагона: '
      volume = gets.to_i
      selected_train.wagons << CargoWagon.new(volume, add_manufacturer) 
      puts "Количество вагонов в поезде: #{selected_train.wagons.size}"
    end
  end

  def del_wagon
    selected_train = select_train
    quantity_wagons = selected_train.wagons.size
   
    if quantity_wagons.zero?
       puts "У этого поезда нет вагонов" 
    else
      print "Удалить вагон? (Y/N) "
      answer = gets.chomp.downcase
      selected_train.wagons.pop if answer == 'y'
      puts "Количество вагонов в поезде: #{selected_train.wagons.size}"
    end
  end

  def show_trains_on_station
    begin
      raise 'У вас нет хотя бы одной созданной станции' if @stations.size.zero?
      puts '*' * 80
      puts
      @stations.each.with_index(1) do |station, index| 
        puts "#{index}. #{station.name}"
        puts 'Поездов на станции: '
        puts '-' * 80
        station.each_train do |train, index| 
          puts "#{index}. Номер поезда: #{train.number} / Тип поезда: #{train.type} / Количество вагонов: #{train.wagons.size}"
          puts 'Список вагонов у поезда: '
          train.each_wagon do |wagon, index| 
            print "#{index}. Номер вагона: #{wagon.number} / Тип вагона: #{wagon.type} / "
            if wagon.type == 'Пассажирский'
              print "Количество свободных / занятых мест в вагоне: #{wagon.free_places} / #{wagon.occupied_places}"
            else
              print "Свободный / занятый объем в вагоне: #{wagon.free_volume} / #{wagon.occupied_volume}"
            end
            puts
          end
        puts '-' * 80
        end
        puts
        puts '*' * 80
      end
      puts
      press_enter_to_continue
    rescue StandardError => error
      puts "Error: #{error.message}"
    end
  end

  def find_train
    print 'Введите номер поезда: '
    number = gets.strip.upcase
    Train.find(number)
  end

  def press_enter_to_continue
    print "Нажими любую клавишу, чтобы продложить..."
    gets
  end
end

Interface.new.run
