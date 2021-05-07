class Programming_language

  def initialize(name,creator)
    @name= name
    @creator = creator
  end

  def description
    puts "I'm #{@name} and i was created by #{@creator}!"
  end

end

  ruby = Programming_language.new("ruby","yukihiro Matsumoto")
  ruby.description
#=> I'm ruby and i was created by yukihiro Matsumoto!


=begin 
A Ruby class is used to organize and model objects with 
similar attributes and methods. Outline of what a object should be made of
and wht it should be able to to

Basic classs syntax:

class NewClass
  #class stuff
end
 using CamelCase here for the class

-when we create the class we can initialize a method within the class
boots ups each object the class creates

class NewClass

  def initialize()
  end  
end  

-@ signify that a varible is an instance varible. This means that
the varible is attached to the instance of the class

class NewClass

  def initialize(name)
    @name= name
  end  
end  

-creating a variable or the instance of class, by calling (new) to the class name
variable= NewClass.new("anna")
#call this instantiation

=end
#http://ruby.bastardsbook.com/chapters/oops/ apply later