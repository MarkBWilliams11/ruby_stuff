# Hasheds
#
# A more advanced collection of data that ususally offers
# key => value. both can be integer or string. Symbols are commonly used
# to represent the keys :symbol => "value" we surround our has with {}
my_hash = {
  # key        =>        #value
  'a random word' => 'ahoy',
  "Dorothy's math test score" => 94,
  'an array' => [1, 2, 3],
  'an empty hash within a hash' => {}
}

# create new hash
create_new = {}
p create_new #=>{}

# accessing values
outfit = {
  'head' => 'hat',
  'top' => 'shirt',
  'bottom' => 'pants',
  'feet' => 'shoes'
}
p outfit['head'] #=> hat
# Note: trying to access a key that doesnt exist will return nil
p outfit['hair'] #=> nil

# fetch method raises error if key doesnt exist
# good way to check
# p outfit.fetch("hair") #=> returns error message

# can return default value instead of an error if key not found
p outfit.fetch('hair', 'not found') #=> "not found"
p outfit

puts 'adding and changing data'

# adding key-vaule pair
#
# calling the key and setting the value
outfit['hair'] = 'bald'
p outfit

puts 'changing an existing key value'
# changing the key
outfit['hair'] = 'none'
p outfit

puts 'removing data'

# delete
#
# provides returning the value of the key-value pair that was deleted
p outfit.delete('hair') #=> "none"
p outfit

puts ' useful methods for hashes'

puts 'using keys and values to retrieve all'
# keys,values methods
#
# keys() and values() methods retrieves all returns all the keys and the values of
# the hash.both methods return an array
p outfit.keys
p outfit.values

# because its now an array we can do something intesting
p outfit.keys.each { |key| puts key }
#
# head
# top
# bottom
# feet
# ["head", "top", "bottom", "feet"]

puts 'Merging two hashes'

# merging brings two hashes together
hash1 = { 'a' => 100,
          'b' => 200 }
hash2 = { 'b' => 250,
          'c' => 400 }
p hash1.merge(hash2) #=> {"a"=>100, "b"=>250, "c"=>400}
# Note: When hashes have the same key the second hash overwrties first hash key values

puts 'Symbols as hash keys'
#
# Symbols are mainly uses and ofer much cleaner syntax when defining hashes

# 'Rocket' syntax
american_cars = {
  chevrolet: 'Corvette',
  ford: 'Mustang',
  dodge: 'Ram'
}
# 'Symbols' syntax
japanese_cars = {
  honda: 'Accord',
  toyota: 'Corolla',
  nissan: 'Altima'
}

p american_cars[:ford]    #=> "Mustang"
p japanese_cars[:honda]   #=> "Accord"
# Note: both syntax offers a way of accesing the value of the hash

puts 'iterating over an array'
# iterating over an array
american_cars.each do |key, value| #=> added key and value pair
  puts "Car make: #{key}, Car model: #{value}"
end

puts ' optional parameter'
#
# Using the optinal  parameter we can get data dynamically

# optional_parameters

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end

greeting('Bob')
# greeting("Bob", {age: 62, city: "New York City"})
greeting('Bob', age: 62, city: 'New York City') # works without brackets

# Common hash methods

puts 'using the has_key? method'
# has_key? checks if hash contains a specific key returns boolean value
names = { 'bob' => 29, 'mary' => 30 }
p names
p names.has_key?('bob') #=> true
p names.has_key?('joe') #=> false

puts 'using the select method'

# select method allows us to pass a block and will return a key-value pairs that evalute to true
p names.select { |k, _v| k == 'bob' } #=> "bob"=>29
p names.select { |_k, v| v == 30 } #=> "mary"=>30
p names.select { |k, v| (v == 30) || (k == 'bob') } #=> "bob=>29", mary"=>29

puts ' using has_value? method'

# has_value method checks if a hash contains a specific value return boolean value
p names.has_value?(30) #=>true
p names.has_value?('something') #=>false

p ' converting hash into in array'
#
# to_a is a method  thatb returns an array version of the hash when called.
p names.to_a #=> [["bob", 29], ["mary", 30]]
p names #=> does not change orignal

puts ' using select to get immdiate family members names '

family = {  uncles: %w[bob joe steve],
            sisters: %w[jane jill beth],
            brothers: %w[frank rob david],
            aunts: %w[mary sally susan] }
# selecting our array key-value pairs using based on our symbols and condition
im_fam = family.select do |key, _value|
  (key == :sisters) || (key == :brothers)
end
# converting the key values here to a single array of elements
im_arr = im_fam.values.flatten

p im_arr #=>["jane", "jill", "beth", "frank", "rob", "david"]

p 'printing all keys with values from a hash'

family.each do |k, v|
  puts "Family member identifier #{k}, Family member name: #{v} "
end
