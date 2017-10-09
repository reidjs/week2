#BROKEN
require 'byebug'
class Cache
  attr_accessor :primes
  def initialize
    @primes = [2, 3]
  end

  def prime_factors(n)
    return [n] if prime?(n)
    i = 0
    pf = []
    while n > 0
      prime = next_prime(i)
      if n % prime == 0
        n = n/prime
        pf << prime
        i = 0 #start over at 2
        byebug
      end
      i += 1
    end
    pf
  end

  def next_prime(n)
    return @primes[n] if !@primes[n].nil?
    i = @primes[-1] + 1
    while !prime?(i)
      i += 1
    end
    @primes << i
    i
  end

  def prime?(n)
    i = 2
    while i < n
      return false if n % i == 0
      i += 1
    end
    true
  end

end

x = Cache.new
p x.prime_factors(10)
