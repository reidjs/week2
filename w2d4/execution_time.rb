#Time complexity: O(n^2)
#Mem complexity: ?
def my_min(list)
  list.each_with_index do |el1, i|
    return el1 if list[i+1..-1].all? { |el2| el2 >= el1 }
  end
end

#Time: O(n)
#Space: O(n)
def my_min_optimized(list)
  smallest = nil
  list.each do |el|
    smallest = el if smallest.nil? || el < smallest
  end
  smallest
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5Î
# p my_min_optimized(list)  # =>  -5Î


def lcs(list)
  return [[]] if list.empty?
  x = list.pop
  y = lcs(list)
  y + y.map {|arr| arr << x}

end

list = [0,1]
p lcs(list) # => 8

   # possible sub-sums
  #  [5]           # => 5
  #  [5, 3]        # => 8 --> we want this one
  #  [5, 3, -7]    # => 1
  #  [3]           # => 3
  #  [3, -7]       # => -4
  #  [-7]          # => -7
