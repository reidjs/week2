class Array

  def quicksort(&prc)
    return if length < 2
    pivot = self[0]
    i = 1
    left = []
    right = []
    while i < length
      next if i + 1 == length
      left << self[i] if prc.call(self[i], self[i + 1]) > 0
      right << self[i] if prc.call(self[i], self[i + 1]) < 0
      i += 1
    end
  end

end

[4,3,7,4,8,4,3,2].quicksort { |a, b| a <=> b }
