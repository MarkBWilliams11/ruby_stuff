#module
=begin 
a toolbox that contains a set of methods and constants
modules  cant create  instances and cant have subclasses.
they are just used to store things

module ModuleName
  #things
end

ex:

module Circle

  PI = 3.141592653589793 #=> constant(ALL_CAPS undersore if more than onne word)
  def Circle.area(radius)
    PI * radius**2
  end
  
  def Circle.circumference(radius)
    2 * PI * radius
  end
end

Note: the main purpose of a module is to sperate methods and constants 
into named spaces
namespacing - Math::PI / Cirlce::PI two differene things and
we use namespacing so ruby does not confuse these thing.

:: scope operator (we are looking for a specific bit of code)
module::constants


=end
p Math::PI #=> built-in ruby module and contstant