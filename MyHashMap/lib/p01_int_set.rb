class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket = num % num_buckets
    @store[bucket]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= num_buckets
    if !include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket = num % num_buckets
    @store[bucket]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store
    new_in_set = ResizingIntSet.new(num_buckets*2)
    # @store_t = Array.new(num_buckets * 2) { Array.new }
    temp_store.each do |bucket|
      bucket.each do |el|
        new_in_set.insert(el)
      end
    end
    @store = new_in_set.store
    # @store += Array.new(num_buckets) { Array.new }
  end
end
