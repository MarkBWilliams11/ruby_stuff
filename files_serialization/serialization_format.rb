require 'yaml'
require 'json'
require 'msgpack'
# JSON,YAML,XML
#
# When saving or communicating some kind of information, We use serialization.
# serialization takes an object and converts to a string of bytes and vice versa.
#
# an object representing information about a user need to be sent over a
# network, it has to be serialized into a set of bytes.
# then at the other end, the receiver has to unserialize the object,
# converting it back into something that ruby can understand
#
# it can be done serveral ways. YAML, JSON, MessagePack

# YAML
#
# Is a recursive acronym that stands for "YAML aint Markup Language"
#
p YAML.load File.read('test.yaml')
#
# {"squad_name"=>"Mac", "members"=>{"Mac"=>{"rank"=>100, "skill"=>100},
# "Anna"=>{"rank"=>80, "skill"=>60}, "Bob"=>{"rank"=>70, "skill"=>50}},
# "maps"=>["tidi", "ryusho island", "tuyoshi castle"]}

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  # YAML Methods
  #=>making a ruby hash and turning into YAML string from built-in library
  def to_yaml
    YAML.dump({
                name: @name,
                age: @age,
                gender: @gender
              })
  end

  def self.from_yaml(string)
    data = YAML.load string
    p data
    new(data[:name], data[:age], data[:gender])
  end

  # JSON Methods

  def to_json(*_args)
    JSON.dump({
                name: @name,
                age: @age,
                gender: @gender
              })
  end

  def self.from_json(string)
    data = JSON.load string
    new(data['name'], data['age'], data['gender'])
  end

  # MessagePack Method
  def to_msgpack
    MessagePack.dump({
                       name: @name,
                       age: @age,
                       gender: @gender
                     })
  end

  def self.from_msgpack(string)
    data = MessagePack.load string
    new(data['name'], data['age'], data['gender'])
  end
end

person = Person.new 'Mac', 29, 'male'
p person.to_yaml

person = Person.from_yaml(person.to_yaml)
puts "Name #{person.name}"
puts "Age: #{person.age}"
puts "Gender: #{person.gender}"

# JSON
#
# JOSN is vbery similar to to YAML, it is meant to be a human= readable format that often
# serves as a configuration format. Javascriot object noation.
#
# alot of modern browsers use json
json_person = Person.new 'Anna', 27, 'female'
p json_person.to_json

json_person = Person.from_json(json_person.to_json)
puts "Name: #{json_person.name}"
puts "Age: #{json_person.age}"
puts "Gander #{json_person.gender}"

# messagepack
#
# MessgePack is not meant to be readable to humans. it is a binary format, whichh means
# that it represents its information as arbitary bytes. serialization often take up signficantly less
# space than their YAML and JSON counterparts.
#
# 1.dreate a standard hash and call to_msgpack on it. this returnsthe messagePack serialized version
#
# 2. Then unserialized hash with MesagePack.unpack

msg = { weight: 300, height: 50, depth: 20 }.to_msgpack
p msg

objec = MessagePack.unpack(msg)
p objec

mesagepack_person = Person.new 'Bob', 35, 'male'
p mesagepack_person.to_msgpack #=> "\x83\xA4name\xA3Bod\xA3age#\xA6gender\xA4male"

mesagepack_person = Person.from_msgpack(mesagepack_person.to_msgpack)
puts "Name: #{mesagepack_person.name}"
puts "Age: #{mesagepack_person.age}"
puts "Gander #{mesagepack_person.gender}"

# MessagePack should be used whhen we need to speed up communication
