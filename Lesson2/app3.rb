# Массив состоящий из чисел Фибоначчи

fib_number = [0, 1]

while fib_number[-1] <= 100
  fib_number << (fib_number[-1] + fib_number[-2])
end


if fib_number[-1] > 100
  fib_number.delete_at(-1)
end

#fib_number.delete_if {|item| item > 100}

p fib_number 

