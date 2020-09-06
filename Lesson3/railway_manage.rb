#Управление железной дорогой
require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'station.rb'


station_1 = Station.new('Station1')
station_2 = Station.new('Station2')
station_between = Station.new('Between')

st1_to_st2 = Route.new(station_1, station_2)

st1_to_st2.add_additional_station(station_between)

train1 = Train.new(123, 'cargo', 5)
train2 = Train.new(456, 'passengers', 7)

train1.route(st1_to_st2)
train2.route(st1_to_st2)

p station_1.trains_list

# station_1.arrival(train1)
# station_1.arrival(train2)

p station_1.trains_list

station_1.show_trains_by_type

train1.current_station

train1.forward

train1.current_station

p station_1.trains_list

p station_2.trains_list







