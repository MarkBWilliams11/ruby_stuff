# inheritance
#
# The process by which one class takes on the attirbutes and methods of
# another, and used to express and is a relationship(related to the class)

class ApplicationError
  def display_error
    puts 'Error! Error!'
  end
end

class SuperBadError < ApplicationError
end
# NOTE: we did not define display_error in SuperBadError, still had access to method due to inheritance
err = SuperBadError.new
err.display_error

#
#
# Syntax:
# class DerivedClass < BaseClass
#   #things
# end
# - the derive class is the new class.
# - the base class is the class from which that new class inherits
# -  "<" as inherits from
#
class Application
  def initialize(name)
    @name = name
  end
end

class MyApp < Application
end
