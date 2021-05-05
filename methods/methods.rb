#Methods
=begin 
are reusable sections of code hat preform specific tasks
using methods mean that we write simpler,readable code

List example of how to write method names:
method_name      # valid
_name_of_method  # valid
1_method_name    # invalid
method_27        # valid
method?_name     # invalid
method_name!     # valid
begin            # invalid (Ruby reserved word)
begin_count      # valid

def method name
  #method code here
end

def keyword begins the header of the method.
This will include the name of the method 
along with any (parameters). the method will take
The body of the method will contain the code 
the we want the method to carry out. the method
ends with keyword end

indorder to perrform the task we must call it.
to call a defined method just type the name of the method

ruby is one of the few languages that offers an implict return 
for methods, which means that it will return the last thing evaluated.
even without the return keyword

Note: the last thing evaluated may not be the last line in the code
=end

def our_first_method
  "Our first Method"
end

puts our_first_method

#Method with parameter
=begin 
To extend functionally  of out methods, we can define
them with parameter and provide them with arguments.

parameters are placeholder names we put between the 
method parentheses when we define the method

arguments are the acutal variable that we apss to the method
when it is called.
=end

def clap_hands(number) #=>number is the parameter
    puts "Clap " * number
end

clap_hands(3) #=> 3 is the argument passed. we get =>Clap Clap Clap

#ex: square a number
def square(number)
    puts number ** 2
end
square(2)

puts "using default parameters"
#for when we dont provide an argument we can provide a deafault value
def greet (name = "Stranger")
  "hello , #{name}!"
end
puts greet #=> hello, stranger!
puts greet("mac") #=> hello, mac!

#example custom caps method
p "Enter a string: "

#str = gets.chop
def caps(str)
#our conditional for the method  
  if str.length>10
    puts str.upcase.chop
  elsif str.length < 10
    puts "Looking for a longer str"
  end #end conditional

end #end method

#call method
#p caps(str) #=> "conditional response" nil

#example 
p"Enter a number between 0-100"

numberInput=gets.chop.to_i

def userNumChoice(numberInput = 0) #=> default parameter zero
  if numberInput == 0
    puts "number is zero"
    elsif numberInput< 0
      puts " number must be negative  Number: #{numberInput}"
    elsif numberInput == 100
    puts "number is 100  Number: #{numberInput}"
  elsif numberInput <51
    puts "Number is between zero and 51 Number: #{numberInput}"
  elsif numberInput <100
    puts "Number is less than 100 but greater then 50 Number: #{numberInput}"
    else
      puts "number must be larger than 100 Number: #{numberInput}" 
    end#conditional end
  end#method end

  p userNumChoice(numberInput)

p "Using explict returns"
=begin 
=end
def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered" #=> will not continue eveluating if condition is not met reutrns
  end
  if number % 2 == 0
    "that is an even number"
  else
    "that is an odd number"
  end
end
puts even_odd(4) #=> "thats an even number"
puts even_odd("string") #=> "thats not a number"
#=>Note: unexpected return if not using the return in our first condition

p " using puts Vs return"
#puts Vs return
#puts method that prints whatever argument you pass it to the console
def puts_squared(num)
  puts num * num
end
x = puts_squared(20) #=> 400
p x #=> but our value of x is nil

#return is the final output of a method that you can use in other places throught the code
def add_three(number)
  return number + 3 #=> evalutes to 7 then returns
  number + 4 #=> doesnt output two 7 because we have already returned
end
returned_value = add_three(4)
puts returned_value #=> 7
#another return example
def return_squared(num)
  num * num
end
#using the implict return with ruby
a = return_squared(20) #=> 400
u=100
p sum= a + u  #=>500
puts "The sum of #{a} and #{u} is #{sum}" #=> "The sum of 400 and 100 is 500"

puts "Chanining Methods"

=begin 
Chaining methods can be done with ruby built-in methods or custom methods creaated.
The chain builds of the previous methods outcome in the chain,
=end

#length method returns an integer so we can use to_s method to make it a string
p "hi there".length.to_s      # returns "8" - a String

phrase = ["be", "to", "not", "or", "be", "to"]
puts phrase.reverse.join(" ").capitalize #=> "To be or not to be"
#the steps would be as follows
=begin  
["be", "to", "not", "or", "be", "to"].reverse
= ["to", "be", "or", "not", "to", "be"].join(" ")
= "to be or not to be".capitalize
= "To be or not to be"
=end

p "Predicate Methods"
=begin 
Built-in ruby methods that have a questionmark (?) at the end even?, odd?, ...
these are all predicate methods, which is a name conventiion that ruby uses 
for methods that retrun a boolean
=end

puts 5.even? #=>false
puts 5.odd? #=>true
puts 10.between?(5,15) #=>true

puts " bang method"
=begin 
by adding the (!) to the end of the method you indicate that this method preforms
its action simultaneously overwrites the value of the original object with the result.

Note:Genrally dont wan tot over write code to avoid changing data on accident
=end
whisper = "HELLO EVERYBODY"

puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"

p "obj.method or method(obj)"
=begin 
some_method(obj) #=> here we send arguments to the method call

somtimes we might see our methods being called by an explict caller

a_caller.some_method(obj)

=end

p " mutating the caller"
def some_method(number)
  number = 7 # this is implicitly returned by the method
end

a = 5
some_method(a)
p a #=> does not permently change a 



a = [1, 2, 3]

# Example of a method definition that modifies its argument permanently
def mutate(array)
  array.pop
end
p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"
=begin 
Note that here we are using a destructive method pop that mutates the caller
=end
a = [1, 2, 3]

# Example of a method definition that does not mutate the caller
def no_mutate(array)
  array.last
end
p "Before no_mutate method: #{a}"
no_mutate(a)
p "After no_mutate method: #{a}"

p " Because p and puts return nil"

=begin 
def add_three(n)
  puts n + 3
end
# add_three(5).times { puts "will this work?" } 
=end

#Note this will toss ua an error due to the fact that puts and p return nil
#try not to break the chain with nil
def add_three(n)
  new_value = n + 3
  puts new_value
  new_value
end
add_three(6) #=> 9

p "Using chr method"
#chr methods allows for ASCII code 
# Ruby Program of Integer chr function
# Initializing the numbers
num1 = 119
num2 = 68
num3 = 89
num4 = 255
# Prints the chr
# after encoding
puts num1.chr
puts num2.chr(Encoding::UTF_8)
puts num3.chr
puts num4.chr(Encoding::UTF_8)


p "Using the intersection method"

#  & method return the common of the two array
# showing intersection operation
# declaration of array
a = ["abc", "xyz", "dog"]
# declaration of array
b = ["cow", "cat", "dog"]
# declaration of array
c = ["cat", "1", "dog"]
# a intersecting b
puts "intersection of a and b : #{a & b}\n\n"
# a intersecting c
puts "intersection of a and c : #{a & c}\n\n"
# b intersecting c
puts "intersection of b and c : #{b & c}\n\n"
