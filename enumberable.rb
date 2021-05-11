# Enumerables  https://ruby-doc.org/core-2.6.1/Enumerable.html
#
# a set of convenient built-in methods in ruby that are
# included as part of both array and hashes.
#
# there are some iteration patterns that come up several times
# transforming,searching for,and selecting subsets of elements in
# the collection.

p ' Using the selcet method'
# old school example
friends = %w[Sharon Leo Leila Brian Arun]
invited_list = []

friends.each do |friend|
  invited_list.push(friend) if friend != 'Brian'
end
p invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]

# instead we can use the select method to get the same results
# aka filter method
#
# best used when all we need to do is pull out elements based on certain
# criteria.
p friends.select { |friend| friend != 'Brian' } #=> ["Sharon", "Leo", "Leila", "Arun"]

puts 'using reject method'
# here we can directly tell ruby what to reject
friends.reject { |friend| friend == 'Brian' } #=> ["Sharon", "Leo", "Leila", "Arun"]}

puts 'using select to get response  from invitation'
# when using the hashes we can use the key-value pairs with logic.
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |_person, response| response == 'yes' }
#=> {"Sharon"=>"yes", "Arun"=>"yes"}

p ' Using the each method'
# each
#
# each is a OG of enumerable methods. can almsot do everthing yo need
#   but not always the most effcient tool.
#
# the each can iterate over an array and will yield each element to a
# code block where a task can be preformed.

# still using the friend array here wiith names
friends.each { |friend| puts 'Hello, ' + friend }
#
# The each method is calling the friends array here and after that
# we have a code block. the code block is run for each element in the friends array
#
# within the block we have block varible  called friend and that is the element
# the block is currenlty iterating over(any descriptive name).
# prints
#
# Hello, Sharon
# Hello, Leo
# Hello, Leila
# Hello, Brian
# Hello, Arun

p 'each method with more logic'
#
# generally for multi-line blocks syntax preferred is do ... end
my_array = [1, 2]
my_array.each do |num|
  num += num
  puts num.to_s
end

p 'each method with hashes'
my_hash = { 'one' => 1, 'two' => 2 }
my_hash.each { |key, value| puts "#{key} is #{value}" }
# one is 1
# two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }
# the pair is ["one", 1]
# the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}
# Note: that using the each will return to complete orginal array or hashes(key,value)
p friends.each { |friend| friend.upcase } #=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

p 'Using the each_with_index method'

#
# the each_with_index yeilds two block varibles
# -the first element varible is the element itself from the array
# -the second varible is the index of the current element within the array

fruits = %w[apple banana strawberry pineapple]
fruits.each_with_index { |fruit, index| puts "fruit: #{fruit} indx: #{index}" }
#
# fruit: apple indx: 0
# fruit: banana indx: 1
# fruit: strawberry indx: 2
# fruit: pineapple indx: 3

p 'using the collect method'

#
# we also can use  method called collect to select certain elements
# re-mapping orginal and modify them
# Note: it is the exact same as map

numbers = [1, 2, 3, 4, 5]
p numbers.collect { |num| num += num } #=> [2,4,6,8,10]

p 'Using the map method'

#
# map method transforms each element from an array according to whatever
# block you pass to it and returns the transformed elements. in a new array.
friends = %w[Sharon Leo Leila Brian Arun]
p friends.map { |friend| friend.upcase } #=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
p my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]

salaries = [1200, 1500, 1100, 1800]
p salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]

p 'using the reduce method'
#
# the reduce method aka the inject. It reduces an array or hash down to a single
# object.genranlly use to get a single output
# -first block varible accumulator
#   the result or value stored of the iteration , by defualt the first element
#   of the collection
#   #Note: we can set a defualt value for the accumulator
#   my_array.reduce(initial value){|acc|code}

# getting the sum of numbers array
my_numbers = [1, 2, 3, 4, 5]
p my_numbers.reduce { |sum, num| sum += num }

#
# create a default hash using Hash.new as an argument to become
# default value when accessing keys that do not exist
hundreds = Hash.new(100)
p hundreds['new'] #=>100 default value for accumulator
hundreds['new'] = 50 #=>set value now to 50
p hundreds['new'] #=>50

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]
votes.each_with_object(Hash.new(0)) do |vote, result|
  result[vote] += 1
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
#
# 1. iteration 0
#   results={}
#   result have a defult value as 0
#   result["Bob's Dirty Burger Shack"] = 0 and result["St. Mark's Bistro"] = 0
#
# 2. iteration 1
#   result["Bob's Dirty Burger Shack"] += 1
#   result = {“Bob’s Dirty Burger Shack” => 1}
#
# 3.Iteration 2
# The method runs result["St. Mark's Bistro"] += 1
# result = {“Bob’s Dirty Burger Shack” => 1, “St. Mark’s Bistro” => 1}
#
# 4. Iteration 3
# The method runs result["Bob's Dirty Burger Shack"] += 1
# result = {“Bob’s Dirty Burger Shack” => 2, “St. Mark’s Bistro” => 1}
#
# Note: even though we had several keys and values reduce only returns
# one object!

p 'using the bang method'

#
# if we are looking to modify arrays bang methods are destructive and make it possible
#   avoid using it, but there may be time when its needed
p friends = %w[Sharon Leo Leila Brian Arun]
friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
p friends #=> now original is permanetly uppercase
# Note use when appropriate

p ' Returning values of enumberabes '

# using bang method within local scope
friends = %w[Sharon Leo Leila Brian Arun]
invited_friends = friends.select { |friend| friend != 'Brian' }
p friends #=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
p invited_friends #=> ["Sharon", "Leo", "Leila", "Arun"]

# or give it a method as a re-usable option
friends = %w[Sharon Leo Leila Brian Arun]

def invited_friends(friends)
  friends.select { |friend| friend != 'Brian' }
end
friends #=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
p invited_friends(friends) #=> ["Sharon", "Leo", "Leila", "Arun"]
