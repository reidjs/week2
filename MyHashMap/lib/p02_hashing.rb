class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.join.to_i
  end
end

class String
  def hash
    self.chars
    .map { |char| char.ord }
    .join
    .to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    keys = self.keys
    key_arr = keys.map do |key|
      key.to_s
    end
    chars = []
    key_arr.sort.each do |string|
      string.chars.each do |char|
        chars << char.ord
      end
    end
    chars.hash
  end
end
