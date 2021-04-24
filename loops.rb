#Loops 
=begin 
loops in ruby are simply blocks of code that are continually repeated until a
certain condition is met. if you find that you need to repeat an action
more than once,probably need a loop
(ctrl + c to stop aswell)
=end

#loop
=begin 
infinite loop that will keep going unless requested to stop by
the beak command,break is used with a condition

#Note:break  does not exit the program,just exits the loop the exection will
continue after the loop
=end
p"basic loop:"
i=0
loop do 
 puts "i is #{i}"
  i+=1
  break if i == 10 # breaks out of iteration
end

#using the next keyword to continue on to the next iteration
p " using next in the loop "
#iteration gets us the even numbers 
i = 0
loop do
  i += 2
  if i == 4
    next        # skip rest of the code in this iteration
  end
  puts i
  if i == 10
    break
  end
end

p"While loop:"
#while stament
=begin
while statement repeats a block of code as long
  as a condition is true 

  while condition == true do
    #something done 
  end 
=end

#countdown example:
x = gets.chomp.to_i
while x >= 0
  puts x
  x = x - 1 # or X-=1 < refactored
end
puts "Done!"


#print k incrementing 
k=0
while k<10 do
  puts "k is #{k}"
  k+=1
end


#ex: puts "I'm looping" 7 times
condition =0
while condition <= 6
  puts "I'm Looping"
  condition= condition +1
end 


#until loop
=begin
until Statement repeat a block of code as long as
condition if false 


until condition == false do
  #something done
end 

Note: becareful of infinite loops. if we have a condition here that
always evaluate to true the loop will never end

=end
p"Until loop:"

u= 0
until u >= 10 do
  puts "u is #{u}"
  u+= 1
end

#Ranges 
=begin 
We can use range to define an inteval
(1..5)
('a'..'d')
=end


#for Loop
=begin 
is used to iterate through a collection of elements or 
information such as an array or range

for keyword followed by a variable then the in keyword followed by a collection of elements
=end
p"for loop"
for enemies in 0..5
  puts "#{enemies} Zombies incoming"
end


# countdown
p "countdown with gets.chop"
x = gets.chomp.to_i

for i in 1..x do
  puts i
end

puts "Done!"

p "countdown with array"
x=[1,2,3,4,5]
for i in x do 
  puts i
  end
  puts "done"

#times loop
=begin 
loops a specified number of times, and also allows access to the 
number begin iterated through.
=end
p"using times loop"
3.times do
  puts "looping"
end
#accessing the number being iterated
p"using times loop"

3.times do |number|
  puts "looping #{number}"
end

p "using upto"
#upto loop
=begin 
method to iterate from a strating number an go up
=end
4.upto(6){|num| puts "#{num}, "}
p "using  downto"
#downto loop
=begin 
method to iterate from a strating number an go down
=end
10.downto(6){|num| puts "#{num}, "}

#do/while loop 
=begin 
do while loop the condition check is at the end of the loop.
=end
p"using the do/while loop"
loop do 
  puts "do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end

#iterators
=begin 
iterators are methods that naturally loop over a given set of data and allow us
to operate on each element collection.
=end

#each method
=begin 
loops through our array inorder and begins executing the codewithin the block{}
we assign the variable with the: |varible|
=end
names = ['bob','joe','steven','lisa','zoey','susan']
names.each{|name| puts name}

#Recursion
=begin 
another way to create a loop in ruby. recursion is the act of calling a method 
within itself
=end
p"using recursion"
def doubler(start)
  puts start *2
end
doubler(4)  #=>8

#With recusion wwe can do something like this
def tripler(start)
  puts start
  if start <10
    tripler(start*3)
  end
end
tripler(6)

#fib example
p"fibonacci"

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(6)


#Take user input, only stops when thhe user types STOP. each loop has info
x = ""
while x != "STOP" do
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end
#countdown with recursion
def countdown_recursion(d)
  while d>5
  puts  d-=1
  end
end
countdown_recursion(20)