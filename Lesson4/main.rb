#Управление железной дорогой
require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'wagon.rb'

puts "Программа управлением железной дорогой"
puts '*' * 80

stations

loop do
  print "Выберите один из вариантов действий: "
  user_choice = gets.to_i
  puts
  puts "1. Добавить станцию"
  puts "2. Добавить поезд"
  puts "3. Добавить маштрут"
  puts "4. Назначать маршрут поезду"
  puts "5. Добавить вагоны к поезду"
  puts "6. Отцепить вагон от поезда"
  puts "7. Проехать на одну станцию вперед"
  puts "8. Проехать на одну станцию назад"
  puts "9. Просматривать список станций и список поездов на станции"
  puts "0. Выйти из программы"

  case user_choice
  when 1
    #
  when 2
    #
  when 3
    #
  when 4
    #
  when 5
    #
  when 6
    #   
  when 7
    #
  when 8
    #
  when 9
    #                   
  when 0
    break
  else
    puts "Введен не верный ответ!"
  end
end