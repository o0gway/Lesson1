print "Пожалуйста введите a: "
a = gets.chomp.to_f

print "Пожалуйста введите b: "
b = gets.chomp.to_f

print "Пожалуйста введите c: "
c = gets.chomp.to_f
 
d = b ** 2 - (4 * a * c)

if d >= 0
  result_d = Math.sqrt(d)
  x1 = (-b + result_d) / (2 * a)
  x2 = (-b - result_d) / (2 * a)
end

if d < 0
  puts "Корней нет"
elsif d == 0
  puts "Дискриминант равен #{d}, корни равны и их значение #{x1}"
elsif d > 0
  puts "Дискриминант равен #{d}, первый корень равен #{x1}, второй корень равен #{x2}"
end
