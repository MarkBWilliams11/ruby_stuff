class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username
  end
  
  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

#scope
=begin 
The scope of a varible is the context in which its visible 
to the program.

-Golbal Varibles are available everywhere
  can be declared two ways, by defining the variable outside th method or class
  if want global variable from inside a method or class use $ 


-Class Varibles are only available to the particular instance of a class
    belong to the class itself uses @@


Note:this applies for methods aswell
=end

#ex using the global varible with @@
class MyClass
  @@my_variable = "Hello!"
  def self.self_display
  @@my_variable
  end
end

puts "#{MyClass.self_display}" #=> Hello!
#Note: global varible "$" can be changed from anywhere. generally not the best idea


=begin 
genrally it good to createvaribles with limited scope that can only be 
changed from a few places. like instance varibles belong to a [particular object] 
=end

class Person
  def initialize(name,age,profession)
    @name = name
    @age = age
    @profession = profession
  end
end

#ex: people count

class Person
  # Set your class variable to 0 
  @@people_count =0
  
  def initialize(name)
    @name = name
    # Increment your class variable 
    @@people_count+=1
  end
  
  def self.number_of_instances
    # Return your class variable on line 13
    @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"