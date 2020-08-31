# Программа магазин

puts "\tДобро пожаловать в магазин"
puts '*' * 80
puts

total_price_for_all_products = 0
car = {}

loop do

  print 'Пожалуйста введите название товара (для выхода введите <<stop>>): ' 
  product = gets.chomp.capitalize
  break if product == 'Stop'
    
  print 'Пожалуйста введите цену товара: '
  price = gets.to_f

  print 'Пожалуйста введите кол-во товара: '
  quantity = gets.to_i

  car[product] = {price: price, quantity: quantity}
  
  total_price_for_one_product = quantity * price
  puts "Кол-во товара #{product}: #{quantity}"
     
  puts "Общая стоимость товара #{product}: #{total_price_for_one_product}"
  puts
end

puts
puts format("%17s %20s %10s %10s", "Товары в корзине:", "Количесто товаров:", "Цена:", "Сумма:")

car.each do |key, value|
  sum = value[:quantity] * value[:price]
  puts format("%17s %20s %10s %10s", "#{key}", "#{value[:quantity]}", "#{value[:price]}", "#{sum}")
  total_price_for_all_products += sum
end 

puts
puts '*' * 80
puts format("%80s", "Итоговая сумма всех товаров в корзине: #{total_price_for_all_products}")
puts
