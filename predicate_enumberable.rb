# predicate enumberables https://ruby-doc.org/core-2.6.1/Enumerable.html
#
# a predicate method is indicated by a (?) at the end of it.
# it will return a boolean value true or false

p 'using include? method'

# include? method
#
# the include method works by checking if the particular element exists in an array

numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number|
  result = true if number == element
end
p result # => true

element = 3
result = false

numbers.each do |number|
  result = true if number == element
end
p result #=> false

# to simplify this same as above

numbers = [5, 6, 7, 8]

p numbers.include?(6) #=> true
p numbers.include?(3) #=> false

# Antoher example
friends = %w[Sharon Leo Leila Brian Arun]

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian') #=> false

p 'using any? method'

# any? method
#
# if any elemnt in array or hash match the condition within the block

# ex see if numbers +are greater than 500 or less 20+
numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  result = true if number > 500
end
p result #=> true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  result = true if number < 20
end
p result #=> false

# we can simplify this
numbers = [21, 42, 303, 499, 550, 811]

p numbers.any? { |number| number > 500 } #=> true
p numbers.any? { |number| number < 20 } #=> false

p 'using all method'

# all method
#
# if all the elements in the array or hash match the condition set within the block.

fruits = %w[apple banana strawberry pineapple]
matches = []
result = false

fruits.each do |fruit|
  matches.push(fruit) if fruit.length > 3

  result = fruits.length == matches.length
end
p result #=> true

fruits = %w[apple banana strawberry pineapple]
matches = []
result = false

fruits.each do |fruit|
  matches.push(fruit) if fruit.length > 6

  result = fruits.length == matches.length
end
p result #=> false

# we can simplify this
fruits = %w[apple banana strawberry pineapple]

p fruits.all? { |fruit| fruit.length > 3 } #=> true
p fruits.all? { |fruit| fruit.length > 6 } #=> false

#
# Note: when debugging  eith all? method will return true by defult unless the block returns
# false or nil.so if all? is called on an empty array or hash it will return true.

p 'using the none? method'

# none? method
#
# it will return true if none of the elements
# match the conditionn within the set block
fruits = %w[apple banana strawberry pineapple]
matches = []
result = false

fruits.each do |fruit|
  matches.push(fruit) if fruit.length > 10

  result = matches.length == 0
end
p result #=> true

fruits = %w[apple banana strawberry pineapple]
matches = []
result = false

fruits.each do |fruit|
  matches.push(fruit) if fruit.length > 6

  result = matches.length == 0
end
p result #=> false

# we can simplfy this
fruits = %w[apple banana strawberry pineapple]

p fruits.none? { |fruit| fruit.length > 10 } #=> true
p fruits.none? { |fruit| fruit.length > 6 } #=> false

p 'using the one method'

# using the one method
#
# check exeactly on element if matches code block condition
p ['a', 1, {}].one? { |obj| obj.is_a?(Hash) } # true

# can also check if array has exeaclty one truthy value
['a'].one? # true
[].one? # false
[nil].one? # false
