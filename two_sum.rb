#O(n^2)
#brute force
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      next if j <= i
      return true if el1 + el2 == target_sum
    end
  end
  false
end

#sorting
def sorta_two_sum?(arr, target_sum)
  return arr[0] + arr[1] == target_sum if arr.length <= 2
  i = 0
  sorted = arr.sort
  while i < arr.length
    mid_idx = sorted.length / 2
    left = arr[0..mid_idx]
    right = arr[mid_idx..-1]
    case arr[i] + arr[mid_idx] <=> target_sum
    when -1
      two_sum?(left,target_sum)
    when 0
      return true
    when 1
      two_sum?(right,target_sum)
    end
    i+= 1
  end


  false
end

#O(nlogn)
def two_sum?(arr, target_sum)
  return arr[0] + arr[1] == target_sum if arr.length <= 2
  # prc = Proc.new {|a, b| a + b <=> target_sum }
  # prc.call()
  sorted = arr.sort
  first_el = arr.first
  last_el = arr.last
  if first_el + last_el > target_sum
    arr.pop
    return two_sum?(arr, target_sum)
  elsif first_el + last_el < target_sum
    arr.shift
    return two_sum?(arr, target_sum)
  else
    return true
  end

end


#Time complexity: O(n)
def linear_two_sum?(arr,target_sum)
  h = Hash.new
  arr.each do |ele|
    h[ele] = true
  end
  h.each do |k,v|
    return true if !h[target_sum - k].nil? && target_sum - k != k
  end

  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
