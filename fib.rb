#recursive to n
def fib(n) #warning: super slow
  return 0 if n == 0
  return 1 if n == 1


  fib(n-1) + fib(n-2)
end

# p fib(100)

#using a cache to store values (memoization)
class Cache
  attr_accessor :memo
  def initialize
    @memo = {}
  end
  def fib(n)
    return n if n < 2
    return @memo[n] if !@memo[n].nil?
    @memo[n] = fib(n-1) + fib(n-2)
    @memo[n]
  end
end

x = Cache.new
p x.fib(100)

def fib2(n)
  x = Cache.new
  x.fib(100)
end

p fib2(100)
