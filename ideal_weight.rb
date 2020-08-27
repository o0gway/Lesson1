print "Привет, давай знакомится! "
user_name = gets.capitalize.chomp

print "Введите пожалуйста свой рост! "
user_height = gets.to_i

ideal_user_weight = (user_height - 110) * 1.15

print "Уважаемый #{user_name} ваш идеальный вес: #{ideal_user_weight}"
puts

if ideal_user_weight < 0
  puts "Ваш вес уже оптимальный"
end
