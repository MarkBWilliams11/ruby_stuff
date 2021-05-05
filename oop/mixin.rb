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