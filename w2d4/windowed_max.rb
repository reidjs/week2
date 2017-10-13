#Time complexity: O(n^2) because of the loop within a loop
def slow_windowed_max_range(arr, w)
  current_max_range = nil
  arr.each_with_index do |el, i|
    indices = arr[i...i + w]
    range = indices.max - indices.min
    current_max_range = range if current_max_range.nil? ||
                                 current_max_range < range
  end
  current_max_range
end
class MyQueue
  def initialize
    @store = []
    @max = nil
    @min = nil
  end
  def enqueue(el)
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
    @store << el
  end
  def dequeue
    @store.shift
  end
  def show
    @store
  end
  def max
    @max
  end
  def min
    @min
  end
end

class MyStack
  def initialize
    @stack = []
    @max = nil
    @min = nil
  end
  def pop
    @stack.pop
  end
  def push(el)
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
    @stack << el
  end
  def show
    @stack
  end
end

class StackQueue
  def initialize
    @s1 = MyStack.new
    @s2 = MyStack.new
  end
  def enqueue
    @s2.push(@s1.pop) if !empty?
  end
  def empty?
    @s1.empty?
  end
  def dequeue
    @s2.pop
  end
  def size
    @s2.length
  end
end

# class MinMaxStackQueue
#   def initialize(stack)
#     @s1 = StackQueue.new(stack)
#   end
#
#   def enqueue
#   end
#
#   def dequeue
#   end
#
#   def max
#   end
#
#   def min
#   end
#
# end



def windowed_max_range(arr, w)
  start_idx = 0
  end_idx = w
  biggest_range = 0
  arr.each do |el|

  end
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
