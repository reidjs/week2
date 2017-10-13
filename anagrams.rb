#Time complexity: O(n*n!)
#Space complexity: O(n!)
def first_anagram(string)
  result = []
  string.chars.permutation.each do |perm|
    result << perm.join
  end
  result
end

def anagram?(s1, s2)
  first_anagram(s1).include?(s2)
end

# p first_anagram("elvis")
# p anagram?("elvis", "lives")

#Time complexity: O(n^2) because of the index method
#Space:
def second_anagram(s1, s2)
  s1 = s1.chars
  s2 = s2.chars
  until s1.empty?
    letter_idx = s2.index(s1[0])
    return false if letter_idx.nil?
    s1.shift
    s2.delete_at(letter_idx)
  end
  s1 == s2
end

# p second_anagram("elsdfsdfdsfvis", "a")

#Time complexity: O(nlogn)
def third_anagram(s1,s2)
  s1.chars.sort == s2.chars.sort
end

# p third_anagram("elvis","livesss")

def fourth_anagram(s1,s2)
  char_hash = Hash.new(0)
  s1.chars.each do |char|
    char_hash[char]+= 1
  end

  s2.chars.each do |char|
    char_hash[char]-= 1
  end

  char_hash.each { |_, v| return false if v != 0 }

  true
end

p fourth_anagram("elvis","lives")
