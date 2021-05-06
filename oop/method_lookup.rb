=begin 
Ruby has a distinct lookup path  that it follows each time a method is called


below is an example of a lookup chain when working with  both mixins and class
inheritance
=end
module Speak  
  def speak(sound)
    puts "#{sound} "
  end  
end


class Dog
  include Speak
end  

class Human
  include Speak
end
puts "---GoodDog ancestors---"
puts Dog.ancestors

puts "---HumanBeing ancestors---"
puts Human.ancestors

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
end  class Slow
  include Run
   def initialize(name)
    @name
   end
   
end  

p rabbit = Fast.new("rabbit")
p turtle = Fast.new("turtle")

rabbit.runFast
turtle.runSlow