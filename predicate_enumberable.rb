#predicate enumberables https://ruby-doc.org/core-2.6.1/Enumerable.html
=begin 
a predicate method is indicated by a (?) at the end of it.
it will return a boolean value true or false
=end

p "using include? method"

#include? method
=begin 
the include method works by checking if the particular element exists in an array
=end

numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number|
  if number == element
    result = true
  end
end
p result # => true

element = 3
result = false

numbers.each do |number|
  if number == element
    result = true
  end
end
p result #=> false

#to simplify this same as above

numbers = [5, 6, 7, 8]

p numbers.include?(6) #=> true
p numbers.include?(3) #=> false

#Antoher example 
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian')#=> false

p "using any? method"

#any? method
=begin 
if any elemnt in array or hash match the condition within the block
=end

#ex see if numbers +are greater than 500 or less 20+
numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number > 500
    result = true
  end
end
p result #=> true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number < 20
    result = true
  end
end
p result #=> false

#we can simplify this 
numbers = [21, 42, 303, 499, 550, 811]

p numbers.any? { |number| number > 500 }#=> true
p numbers.any? { |number| number < 20 }#=> false

p "using all method"

#all method
=begin 
if all the elements in the array or hash match the condition set within the block.
=end

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 3
    matches.push(fruit)
  end

  result = fruits.length == matches.length
end
p result #=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end

  result = fruits.length == matches.length
end
p result #=> false

#we can simplify this
fruits = ["apple", "banana", "strawberry", "pineapple"]

p fruits.all? { |fruit| fruit.length > 3 }#=> true
p fruits.all? { |fruit| fruit.length > 6 }#=> false

=begin 
Note: when debugging  eith all? method will return true by defult unless the block returns
false or nil.so if all? is called on an empty array or hash it will return true.
=end

p "using the none? method"

#none? method
=begin 
it will return true if none of the elements 
match the conditionn within the set block
=end
fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 10
    matches.push(fruit)
  end

  result = matches.length == 0
end
p result #=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end

  result = matches.length == 0
end
p result #=> false

#we can simplfy this
fruits = ["apple", "banana", "strawberry", "pineapple"]

p fruits.none? { |fruit| fruit.length > 10 }#=> true
p fruits.none? { |fruit| fruit.length > 6 }#=> false

p "using the one method"

#using the one method
=begin 
check exeactly on element if matches code block condition
=end
p ["a", 1, {}].one? { |obj| obj.kind_of?(Hash) }# true

#can also check if array has exeaclty one truthy value
["a"].one?# true
[].one?# false
[nil].one?# false