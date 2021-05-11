# Loops
#
# loops in ruby are simply blocks of code that are continually repeated until a
# certain condition is met. if you find that you need to repeat an action
# more than once,probably need a loop
# (ctrl + c to stop aswell)

# loop
#
# infinite loop that will keep going unless requested to stop by
# the beak command,break is used with a condition
#
# Note:break  does not exit the program,just exits the loop the exection will
# continue after the loop
p 'basic loop:'
i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10 # breaks out of iteration
end

# using the next keyword to continue on to the next iteration
p ' using next in the loop '
# iteration gets us the even numbers
i = 0
loop do
  i += 2
  if i == 4
    next # skip rest of the code in this iteration
  end

  puts i
  break if i == 10
end

p 'While loop:'
# while stament
# while statement repeats a block of code as long
#   as a condition is true
#
#   while condition == true do
#     #something done
#   end

# countdown example:
x = gets.chomp.to_i
while x >= 0
  puts x
  x -= 1 # or X-=1 < refactored
end
puts 'Done!'

# print k incrementing
k = 0
while k < 10
  puts "k is #{k}"
  k += 1
end

# ex: puts "I'm looping" 7 times
condition = 0
while condition <= 6
  puts "I'm Looping"
  condition += 1
end

# until loop
# until Statement repeat a block of code as long as
# condition if false
#
#
# until condition == false do
#   #something done
# end
#
# Note: becareful of infinite loops. if we have a condition here that
# always evaluate to true the loop will never end
#
p 'Until loop:'

u = 0
until u >= 10
  puts "u is #{u}"
  u += 1
end

# Ranges
#
# We can use range to define an inteval
# (1..5)
# ('a'..'d')

# for Loop
#
# is used to iterate through a collection of elements or
# information such as an array or range
#
# for keyword followed by a variable then the in keyword followed by a collection of elements
p 'for loop'
(0..5).each do |enemies|
  puts "#{enemies} Zombies incoming"
end

# countdown
p 'countdown with gets.chop'
x = gets.chomp.to_i

(1..x).each do |i|
  puts i
end

puts 'Done!'

p 'countdown with array'
x = [1, 2, 3, 4, 5]
x.each do |i|
  puts i
end
puts 'done'

# times loop
#
# loops a specified number of times, and also allows access to the
# number begin iterated through.
p 'using times loop'
3.times do
  puts 'looping'
end
# accessing the number being iterated
p 'using times loop'

3.times do |number|
  puts "looping #{number}"
end

p 'using upto'
# upto loop
#
# method to iterate from a strating number an go up
4.upto(6) { |num| puts "#{num}, " }
p 'using  downto'
# downto loop
#
# method to iterate from a strating number an go down
10.downto(6) { |num| puts "#{num}, " }

# do/while loop
#
# do while loop the condition check is at the end of the loop.
p 'using the do/while loop'
loop do
  puts 'do you want to do that again?'
  answer = gets.chomp
  break if answer != 'Y'
end

# iterators
#
# iterators are methods that naturally loop over a given set of data and allow us
# to operate on each element collection.

# each method
#
# loops through our array inorder and begins executing the codewithin the block{}
# we assign the variable with the: |varible|
names = %w[bob joe steven lisa zoey susan]
names.each { |name| puts name }

# Recursion
#
# another way to create a loop in ruby. recursion is the act of calling a method
# within itself
p 'using recursion'
def doubler(start)
  puts start * 2
end
doubler(4) #=>8

# With recusion wwe can do something like this
def tripler(start)
  puts start
  tripler(start * 3) if start < 10
end
tripler(6)

# fib example
p 'fibonacci'

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(6)

# Take user input, only stops when thhe user types STOP. each loop has info
x = ''
while x != 'STOP'
  puts 'Hi, How are you feeling?'
  ans = gets.chomp
  puts 'Want me to ask you again?'
  x = gets.chomp
end
# countdown with recursion
def countdown_recursion(d)
  puts d -= 1 while d > 5
end
countdown_recursion(20)
