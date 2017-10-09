#only works on sorted array
def bsearch(arr, target, cache = 0)
  p arr
  return nil if arr.empty?
  return nil if arr.length == 1 && arr[0] != target
  if arr.length.even?
    mid = arr.length / 2
  else
    mid = arr.length / 2
  end
  return mid + cache if arr[mid] == target

  if target > arr[mid]
    bsearch(arr[mid..-1], target, cache+=mid)
  else
    bsearch(arr[0...mid], target)
  end

end

p bsearch([2,2,3,4,7,9], 9)
