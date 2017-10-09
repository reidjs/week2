require 'byebug'
#generate n values then return sum

def fib_sum(n)
  #generate up to n recursive
  fib = [0, 1]
  i = 2
  while i < n
    fib << fib[i - 2] + fib[i - 1]
    i += 1
  end
  p fib
  # sum = 0
  accumulator = fib.first
  while !fib.empty?
    accumulator += fib.pop
  end
  #iterate and sum through the stack
  return accumulator
end

p fib_sum(10)
