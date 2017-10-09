#broken 
class Array

  def my_sort_by(&prc)
    self.each_index do |i|
      next if i + 1 == length
      sort_val = prc.call(self[i], self[i+1])
      if sort_val > 0
        self[i], self[j] = self[j], self[i]
      elsif sort_val < 0
        self[j], self[i] = self[i], self[j]
      end
    end
  end

end
