# attr_reader  and attr_writer
#
# attr_reader to access a variable and attr_writer to change it. if we write.
#
# ex:
# class Person
#   attr_reader :name
#   attr_writer :name
#
#   def initilize(name)
#     @name = name
#   end
# end
#

# attr_accessor
#
# if we want both read and write a particular variable
#
#   class Person
#   attr_reader :name
#   attr_accessor :job
#
#
#   def initialize(name, job)
#     @name = name
#     @job = job
#   end
# end
#
# shouldnt make anything readable or writable without good reason.
