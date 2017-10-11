#doesnt work 
def b10_from_b2(n)

end

def int_to_digit_arr(num)
  digits = []
  while num >= 10
    digit = num % 10
    num = num / 10
    p "#{digit}, #{num}"
    digits.unshift(digit)
  end
  digits.unshift(num)
  digits
end

def int_to_dig_base(num, base)
  digits = []
  while num >= base
    digit = num % base
    num = num / base
    digits.unshift(digit)
  end
  digits.unshift(num)
  digits
end
