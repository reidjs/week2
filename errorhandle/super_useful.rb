# PHASE 2
def convert_to_int(str)
  begin Integer(str)
  rescue ArgumentError
    puts "Cannot convert a letter to int"
    return nil
  end

end

class CoffeeError < StandardError
end
# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise CoffeeError.new
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
    puts "I don't want coffee."
    retry
  rescue StandardError
    puts "I don't like that fruit."
  end
end

class FriendshipError < StandardError
end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    begin
      if yrs_known < 5
        puts "Not a real friendship"
        raise FriendshipError.new
      end
    rescue => e
      puts e
      puts "Enter a new amount of years."
      yrs_known = gets.chomp.to_i
      retry if yrs_known < 5
    end

    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
