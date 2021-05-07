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
class Person #Viking class will inhert from the class
  def initialize(name,age,strength,dead)
    @name = name
    @age = age
    @strength = strength
    @dead = false
  end
end

    #now Vikings has access to the characteritics and behaviours of Person class
class Viking < Person
  #Class Varaibles @@variable owned to the class itself
  @@starting_health = 120 #=> assume they start at the same health
  #away of offering getter and setter & 
  attr_accessor :name, :age, :health, :strength,:dead
                #params to be initialized stes us up to use them
  def initialize(name,age,strength,dead, weapon)
#inheriting attr from the person (parent or superclass)
    super(name,age,strength,dead)
        #instance variable @variable_name part of setting up object state
    #@name = name
    #@age = age
    @health = @@starting_health
    #@strength = strength
    @wepaon = weapon 
  
  end  



#we can define the class method by its name with "self" ( def self.class_method)
#or the name itself def Viking.class_method

  def self.create_warrior(name)
    age = rand * 20 + 15 #rando is integer random 0-1
    health = [age * 5, 120].min
    strength = [age /2 ,10].min
    weapon =["Sword","Axe","Club"].sample
    dead= false
    Viking.new(name,age,strength,dead,weapon)
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
    if enemy.dead
      puts "#{enemy.name} is already dead"
      return false
    end
    damage =(rand * 10 + 10).round(0) #=> random number 
    enemy.take_damage(damage) #=> eneny takes damage using random damge
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



#scope
=begin 
Scope is the formal term that represents when can/cannot access a variable
or method. unless brought in the scope can not recognize it

New scope is created when you first define a variable.That varible
is then accessible by anything within scope untilo scope exit.
=end  
def launch_longships(longships) 
    #new scope
launch_longships = 0 #< we can use launch_ships here cause its within a new scope

longships.each {|longship|
  #new scope
  longship_name = "#{longship.owner.name}'s Reaver"

  longship.launch
  launched_ships+=1
  puts "#{longship_name} successfully launched"

}
#Now we exited the loop no long have access to longship or longship_name
#launched_ships is within scope
puts "We launched #{launched_ships} ships!"
end


protected # similar privacy to private, but lets the methods inside other instances of the samae class

=begin
Now that we have getter and setter(attr_accessor) we have two ways of calling instance varible
normally using @name  or calling the method on the instance using "self"
which represents the object called
=end

  def take_damage(damage)
    self.health-=damage
    #or @health -= damage
    self.shout("Ouch! #{self.name} took #{damage} and has #{self.health} left" )
    die if self.health<=0

  end  

  def shout(string)
    puts string
  end


  private #only accessiable by other methods in class
          #can access attr_accessor
  def die
    puts "#{self.name} has been killed "
    self.dead= true 
  end  
  

end #=>Viking class end

#instantiating a (new)
#new is a class method that allows us to call on a class(array)
#creates a new instance of class to run special metthod initialize on
#this sets up the class to get ready to be used


#p ragnar = Viking.new("Ragnar",25,15,"Axe")
#p oleg = Viking.new("Oleg",29,18,"Bow")

#p ragnar.attack(oleg) #=> 97
#oleg.take_damage(10)
#p oleg.inspect#=> only string show different

#brek= Viking.create_warrior("Brek")
#p brek

#random warrior
warrior1 = Viking.create_warrior(Viking.random_name)
p warrior1
warrior2 = Viking.create_warrior(Viking.random_name)
p warrior2

#warrior1.die
p 10.times{ warrior1.attack(warrior2)}



