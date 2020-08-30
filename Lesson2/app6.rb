# Программа магазин

puts "\tДобро пожаловать в магазин"
puts '*' * 80
puts

total_price_for_all_products = 0
car = {}

loop do

  print 'Пожалуйста введите название товара: ' 
  product = gets.chomp.capitalize
  if product == 'Stop'
    puts
    puts '*' * 80
    puts "Итоговая сумма всех товаров в корзине: #{total_price_for_all_products}"
    puts
  break
  end

  print 'Пожалуйста введите цену товара: '
  price = gets.to_f

  print 'Пожалуйста введите кол-во товара: '
  pcs = gets.to_i

  car[product] = {price => pcs}
  total_pcs_for_googs = car[product][price]

  puts "Кол-во товара #{product}: #{total_pcs_for_googs}"
  
  
  price_for_one_product = car[product].keys
  total_price_for_one_product = price_for_one_product[0] * total_pcs_for_googs

  puts "Общая стоимость товара #{product}: #{total_price_for_one_product}"
  puts
  total_price_for_all_products += total_price_for_one_product
end
