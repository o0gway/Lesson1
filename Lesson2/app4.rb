#Массив заполненный гласными буквами русского алфавита

alphabet = ('а'..'я').to_a



alphabet.each_with_index do |v, i| 
  puts "#{i + 1}: #{v}" if v =~ /[аеёиоуыэюя]/  
end