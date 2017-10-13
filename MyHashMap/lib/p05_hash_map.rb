require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  include Enumerable

  def each(&block)

  end
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].include?(key)
  end

  def set(key, val)

    resize! if @count >= num_buckets
    list = @store[bucket(key)]
    if get(key) == nil
      list.append(key, val)
      @count += 1
    else
      list.update(key, val)
    end
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    @count -= 1 if @store[bucket(key)].remove(key)
  end

  def each
    @store.each do |bucket|
      bucket.each do |node|
        yield node.key, node.val
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    temp_store = @store
    @store = Array.new(num_buckets*2) { LinkedList.new }
    temp_store.each do |list|
      list.each do |node|
        self.set(node.key, node.val)
      end
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    key.hash % num_buckets
  end
end
