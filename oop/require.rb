require 'date'
# require
#
# Some modules like Math are present in interpreter. Other methods
# have to explicty be brought in. we do this with require 'modulename'
#   #Genarally on line 1 or frist line

puts Date.today

# include
#
# We can also use the include method to include methods and
# use those methods
#
# class Angle
#   include Math
#   attr_accessor :radians
#
#   def initialize(radians)
#     @radians = radians
#   end
#
#   def cosine
#     cos(@radians)
#   end
# end
#
# acute = Angle.new(1)
# acute.cosine
