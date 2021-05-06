#mixin
=begin 
we can mix together the behaviours of a class and module
mixins allow us to customize a class without having to rewite code
=end
module Action #=>our module
  def jump
    @distance = rand(4) + 2 #rand() random integer between 0 and number
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action #=>mixin to class of rabbit
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action #=>mixin to class of criket
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump

#Another Example
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")        # => Arf!
bob = HumanBeing.new
bob.speak("Hello!")         # => Hello!

#one other one
module Run
  def runFast
    puts "runs really fast"
  end  
  def runSlow
    puts "runs really slow"
  end  
end
class Fast
  include Run
   def initialize(name)
    @name
   end
end  
class Slow
  include Run
   def initialize(name)
    @name
   end
   
end  

p rabbit = Fast.new("rabbit")
p turtle = Fast.new("turtle")

rabbit.runFast
turtle.runSlow