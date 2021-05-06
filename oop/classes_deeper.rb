=begin 
When we need to treat the data like  real object and make it move?
or if you want to handle thousands of different instances of it?
  viking name =,age,health,strength.
What about making an army   of vikings  that do stuff eat,sleep,stravel,attack

  we need classes to handle complex structures

  everything in ruby is an object and these objects are instances of some 
  type of class

  -Classes are useful to us when we want to give methods  to your data 
    mutiple instances of your data
  - Class meethods have access to other class methods and class variables
    but do not have access to instance methods or instance variables
    
  -instance methods can call other instance methods, instance variables,
    class methods, or class variables  
=end
#begin
p 1.class #=> Integer

class Viking 
  #Class Varaibles @@variable owned to the class itself
  @@starting_health = 100 #=> assume they start at the same health
  #away of offering getter and setter
  attr_accessor :name, :age, :health, :strength
                #params to be initialized
  def initialize(name,age,strength)

        #instance variable @variable_name part of setting up object state
    @name = name
    @age = age
    @health = @@starting_health
    @strength = strength
  end  

#we can define the class method by its name with "self" ( def self.class_method)
#or the name itself def Viking.class_method

  def self.create_warrior(name)
    age = rand * 20 + 15 #rando is integer random 0-1
    health = [age * 5, 120].min
    strength = [age /2 ,10].min
    Viking.new(name,age,strength)
  end 

  def self.random_name# useful to make random warrior
  ['loki','Seger','Lydia'].sample#=> sample picks random element
  end 

class << self #=> less common way to call class to itself
  def silver_to_gold(silver_coins)
      silver_coins/10
  end   

  def gold_to_silver(gold_coins)
      gold_coins * 10
  end   
end#=> class << self end
  #instance method individual method within class
  #if we have two Viking and one attacks
  def attack(enemy)
    
  end

=begin  
  def health #=>getter method to get that variable
      @health
  end
=end

=begin 
we can use setter method which is similar to the getter but with an 
equal sign and taking an arguement, setting the vairble itself
=end

=begin 
  def health=(new_health)
    @health = new_health
  end  
=end

=begin
Now that we have getter and setter(attr_accessor) we have two ways of calling instance varible
normally using @anme  or calling the method on the instance using "self"
which represents the object called
=end

  def take_damage(damage)
    self.health-=damage
    #or @health -= damage
    self.shout("Ouch!")
  end  

  def shout(string)
    puts string
  end

=begin 

  def sleep
      health += 1 unless>=99
  end
  
  Here ruby assumes health variable using #health= instead of accessing the one 
  that currrently  exists as @health. an edge case to look out for
    if start eliminating self
=end
def heal
    2.times{super}#or self.helth = [self.helth + 2, MAX_HEALTH].min
    "Ready for Battle!"
  end 

end 

#instantiating a (new)
#new is a class method that allows us to call on a class(array)
#creates a new instance of class to run special metthod initialize on
#this sets up the class to get ready to be used


p ragnar = Viking.new("Ragnar",25,15)
p oleg = Viking.new("Oleg",29,18)

p ragnar.attack(oleg) #=> 97
oleg.take_damage(10)
p oleg.inspect#=> only string show different

brek= Viking.create_warrior("Brek")
p brek

#random warrior
warrior1 = Viking.create_warrior(Viking.random_name)
p warrior1



