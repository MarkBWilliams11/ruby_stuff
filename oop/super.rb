# superclass
# We can directly access the attribues or methods of parent or super class
# with super keyword
# Syntax:
#
# class DerivedClass < Base
#   def some_method
#     super(args)
#     #something
#     end
#   end
# end
#
class Creature
  def initialize(name)
    @name = name
  end

  def fight
    'Punch to the chops!'
  end
end

# Add your code below!
class Dragon < Creature
  def fight
    puts 'Instead of breathing fire...'
    super
  end
end

berry = Dragon.new('berry')
p berry.fight

# Note that any given ruby class can only have one superclass.
#
# example below will say superclass mismatch becase we try to use to different superclasses
#
# class Creature
#   def initialize(name)
#     @name = name
#   end
# end
#
# class Person
#   def initialize(name)
#     @name = name
#   end
# end
#
# class Dragon < Creature; end
# class Dragon < Person; end
