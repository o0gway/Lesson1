# Массив состоящий из чисел Фибоначчи

fib_number = [0, 1]

while (next_number = fib_number.last(2).sum) <= 100
  fib_number << next_number
end


# if fib_number[-1] > 100
#   fib_number.delete_at(-1)
# end

#fib_number.delete_if {|item| item > 100}

p fib_number 

