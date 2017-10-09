#convert between arbitrary bases
def num_to_digit_array(num, base)
  digits = []
  while num >= base
    digit = num % base
    num = num / base
    digits.unshift(digit)
  end
  digits.unshift(num)
  digits
end

#enter binary num in the form [0,1,0,0,1] etc
def binary_to_base_n(binaryarr, base)
  val = 0
  pow = 0
  while !binaryarr.empty?
    val += binaryarr.pop * 2**pow
    pow += 1
  end
  t = []
  num_to_digit_array(val, base).each do |dig|
    if dig > 9
      t << (('a'..'z').to_a[dig-10])
    else
      t << (dig)
    end
  end
  t.join
end

def num_from_base_to_other_base(num, base, newbase)
  binary_digits = num_to_digit_array(num, 2)
  p binary_to_base_n(binary_digits, newbase)


end
num_from_base_to_other_base(256, 10, 8)
# def base_n_to_binary(num, base)
#   digits = num_to_digit_array(num, base)
#
#   power = 0
#   digits.reverse.each do |digit|
#     num_to_digit_array(digit * base**power, 2)
#   end
# end
