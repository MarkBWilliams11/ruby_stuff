require 'json'

# mixin
module BasicSerializable
  # should point to a class; change to different
  # class (MessagePack,JSON,YAML) o get a diferernt serialization
  @@serializer = JSON

  def serialize
  obj = {}
  instance_variables.map do |var|
    obj[var] = instance_variable_get(var)
  end
  @@serializer.dump obj
end

  def unserialize(string)
    obj = @@serializer.parse(string)
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
  end

end

#applying serialzer to a class




class Person
  include BasicSerializable
  attr_accessor :name, :age, :gender


  def initialize(name,age,gender)
    @name =  name
    @age = age 
    @gender = gender
  end
  
end

# Overwrite method
class People
  include BasicSerializable

  attr_accessor :persons

  def initialize
    @persons = []
  end

  def serialize
    obj = @persons.map do |person|
      person.serialize
    end

    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse string
    @persons = []
    obj.each do |person_string|
      person = Person.new "", 0, ""
      person.unserialize(person_string)
      @persons << person
    end
  end

  def <<(person)
    @persons << person
  end
end


#





people= Person.new "Mac", 29, "male"
p people.serialize

people.unserialize(people.serialize)
puts "Name: #{people.name}"
puts "Age: #{people.age}"
puts "Gender: #{people.gender}" 



