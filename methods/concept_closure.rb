=begin 
A proc is an encapsulation of a block of code, which can be stroed in a local varible
passed to a method or a proc, and can be called. proc is an essential concept in ruby 
and a core of its functional programming features

pro arguemnts can take default values and they can take block arguments aswell
=end

adder = proc {|a|
proc {|b| a + b}
}
#if we call the function we can get another function
 add3 = adder.call(3)
#the function remebers a =3
#closure function is a function which remembers the context it was created in
#anything inside the return function is fair game
p [1,2,3].map(&add3)

#small counter example 
class Counter
  attr_reader :count
  def initialize(count = 0)
    @count = count
  end
  def increment(n = 1)
    @count += 1
  end
end
c = Counter.new
p c.increment #=>1
p c.increment #=> 2

#Closure concept for counter
counter = proc {
  count = 0
  {
    increment: proc { |n = 1| count += n }
  }
}
c = counter.call
p c[:increment].call #=>1
p c[:increment].call #=>2


#we can even remeber classes
class Adder
  def initialize(n)
    @n = n
  end
  def to_proc
    proc { |v| @n + v }
  end
end
p [1, 2, 3].map(&Adder.new(5)) # => [6, 7, 8]

#instead using our proc-like methods
class Adder
  def initialize(n)
    @n = n
  end
  def to_proc
    proc { |v| @n + v }
  end
  
  def call(v)
    self.to_proc.call(v)
  end
  
  alias_method :===, :call
  
  class << self
    def call(n)
      new(n)
    end
    
    alias_method :[], :call
  end
end
[1, 2, 3].map(&Adder[15])# => [16, 17, 18]
[1, 2, 3].map(&Adder.(7))# => [8, 9, 10]