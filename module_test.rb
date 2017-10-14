module Greetable
  def instance_say_hi
    p "Hello! I'm a #{@type}"
  end
  def class_say_hi
    p "Hello! I'm a #{@class_type}"
  end
end

class Human
  include Greetable
  extend Greetable
  @class_type = "hooman"
  def initialize
    @type = "human"
  end
  def say_hi
    p "No!"
  end
end

class Robot
  include Greetable
  extend Greetable
  @class_type = "roooobot"
  def initialize
    @type = "robut"
  end
end

bob = Human.new
bender = Robot.new

bob.instance_say_hi
bender.instance_say_hi
Human.class_say_hi
