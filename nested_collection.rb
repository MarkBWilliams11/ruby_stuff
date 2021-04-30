#nested collection
=begin 
Nested array or nested hashes store more complex data 
=end
p "Nested array"
#Nested array 
=begin 
an array that conttains another array,or it may be refered to as a 
multidimensional array. useful for storing groups of similar data or 
positional data.
=end

test_scores =[[50, 75,88], [50, 84, 70], [70,100,99]]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

p " accessing the elements in an array"

#acessing elements 
=begin 
every element in an array has an index. 
array[x][y]
x - is the index  of the nested element
y - is the index inside of the nested element
=end

p teacher_mailboxes[0][3] #=> "Davis"
p teacher_mailboxes[1][0] #=> "Jones"
#can also use negative to get form the end
p teacher_mailboxes[2][-1]#=> "Young"
=begin 
Note: when trying to access an index of nonexistent nested element we will
get NoMethodError,because the nil does not have a [] method.However,just
like a regular array, trying to access a nonexistent index iinside of an
existing  nested element will return nil
=end

# teacher_mailboxes[3][0]#=> NoMethodError
# teacher_mailboxes[0][4]#=> nil

p " using dig method"

#dig Method
=begin 
useful for accessing nested data structures. can find nil aswell
obj.dig(*identifiers)
=end

p teacher_mailboxes.dig(3, 0)#=> nil
p teacher_mailboxes.dig(0, -1)#=> "Davis"

p "Creating new nested arrays"

=begin 
an array can be created by explicitly Array.new

array = Array.new(3)       #=> [nil, nil, nil]

#Note: that the second argument populates the array with references
to the same object. Therefore, it is only recommended 
in cases when you need to instantiate arrays with natively
immutable objects such as Symbols, numbers, true or false.

To create an array with separate objects a block can be passed instead. 
This method is safe to use with mutable objects such as hashes,
strings or other arrays 

Array.new(4) {Hash.new}    #=> [{}, {}, {}, {}]

=end
p ary = Array.new    #=> []
p Array.new(3)       #=> [nil, nil, nil]
p Array.new(3, true) #=> [true, true, true]

#This is a quick way to build up multi-dimensional arrays:
empty_table = Array.new(3) {Array.new(3)}
#=> [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

immutable = Array.new(3) { Array.new(2) }
#=> [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
#=> 1000
p immutable
#=> [[1000, nil], [nil, nil], [nil, nil]]

p "Adding and removing Elements"

#adding
=begin 
Using push or << shovel we can add elements, if we want add an elelemtn to 
a specific nested array, we need the index of that array
=end
p test_scores
p test_scores << [100, 99, 98, 97] #=> adds to the end
#pushing to a an element in a nested array using index
p test_scores[1].push(50) #=>[90, 80, 95, 50]
p test_scores

#removing an elemtn with pop
p test_scores[1].pop(50)
p test_scores

p "iterating over nested arrays"
=begin 
Helpful to think of nested array as haing rows and columns.
each row is the nested element
and 
each column is the index of the nested element

=end
teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row:#{row_index} = #{row}"
end
#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]

#nest anther enermable method to iterate over individual elements
teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end


=begin 
For somthing more in the wild you might see flatten befoer iteration
=end
teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end

#using test_score array here to determine any arrays have scores
#are all the scores over 80?
test_scores =[[50, 75,88], [50, 84, 70], [70,100,99]]
result = test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end
p result #=> false

p "Nested Hashes"

=begin 
Nested hashes are very common way to store complex associated data.
=end

vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}

p "Accessing hash data"

=begin
hash[:x][:y],
:x - is the key of the hash
:y - is the key of the nested hash
=end
p vehicles[:alice][:year]#=> 2019
p vehicles[:blake][:make]#=> "Volkswagen"
p vehicles[:caleb][:model]#=> "Accord"
=begin 
Note: similar to arrays when trying to acces nonexistent keys NoMethodError
or nil
=end
p "adding and revmoving data"

vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
#=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
p vehicles

p"adding new key to nested hash"
=begin 
to add the new key /value pair  to a neste hash,  we need to speficy the
key of the nested hash right before naming the new key
=end
vehicles[:dave][:color] = "red"#=> "red"
p vehicles

p "deleting a hash by the key"
vehicles.delete(:caleb)
p vehicles

p "deleting the hash key/value pairs in nested hash"
=begin 
To delete one of the key/value paris inside of a nested hash, we need to specify the
key of the hash
=end
vehicles[:dave].delete(:color)
#=> "red"
p vehicles
p"Methods with nest collection"

#say we want the owner of vehicles greater than or equal to 2020
p vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact
#=> [:blake, :dave]
=begin 
Note: that collection and map will returnt he array or hash with a nil value
so we use the compact method at the end to remove the nil
=end

#However ruby 2.7 combine the two methods above together
#we get the same result
p vehicles.filter_map{|name, data| name if data[:year] >= 2020}
#=>[:blake, :dave]

