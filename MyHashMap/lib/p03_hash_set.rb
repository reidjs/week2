require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count >= num_buckets
      resize!
      # should probably set @count = 0
    end
    if !(self[key].include?(key))
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    return true if self[key].include?(key)
    false
  end

  def remove(key)
    if !(self[key].delete(key).nil?)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def []=(num, value)
    @store[num.hash % num_buckets] = value
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_array = @store
    @store = Array.new(num_buckets*2) { Array.new }
    temp_array.flatten.each do |el|
      self.insert(el)
    end
  end
end
