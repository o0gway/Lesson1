#Массив заполненный гласными буквами русского алфавита

alphabet = ('а'..'я').to_a

vowels = /[аеёиоуыэюя]/

alphabet_with_vowels = {}

alphabet.each.with_index(1) do |letter, index| 
  alphabet_with_vowels[index] = letter if letter =~ vowels
end

alphabet_with_vowels.each { |index, letter| puts "#{index}: #{letter}" }
