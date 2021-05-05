#attr_reader  and attr_writer
=begin 
attr_reader to access a variable and attr_writer to change it. if we write.

ex:
class Person
  attr_reader :name
  attr_writer :name

  def initilize(name)
    @name = name
  end
end

=end

#attr_accessor
=begin 
if we want both read and write a particular variable

  class Person
  attr_reader :name
  attr_accessor :job
  
  
  def initialize(name, job)
    @name = name
    @job = job
  end
end
=end