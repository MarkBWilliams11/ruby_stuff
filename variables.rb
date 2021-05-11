# Variables assigning  data to names

# declaring a variable
puts age = 18 #=> 18

# we can assign a variable an expression
puts age = 18 + 5
# NOTE: variables are reusable, by overriding we as we did above w/age
# Likely to run into at senarios having to do this

cash = 20
puts cash *= cash #=> 400

#
# Naming variables should be clear as to what the value holds
#
# the varible name that has that values is stored in the computer memory
# and the variable is the refernce pointer to that addres in memory!

# bad
a = 10
string = '10'

# good
a_number_ten = 10
a_string_ten = '10'

# unexpected behavior
desired_location = 'Barcelona'
johns_location = desired_location

puts desired_location  #=> "Barcelona"
puts johns_location    #=> "Barcelona"
# unexpected behavior when having the sting stored memory
# using upcase! method here instead of safe upaces method

puts johns_location.upcase!  #=> "BARCELONA"

puts desired_location        #=> "BARCELONA"
puts johns_location          #=> "BARCELONA" # no longer "Barcelona"
# the return reflect the changes

# Simpple example to shouldd that varible are not deeply wired to each other
a = 4 #=> 4
b = a #=> 4
a = 7 #=> 7
puts b #=> 4
a = 8 #=> re-assigned again
puts b #=> 4

#
# Getting user data
#
name = gets #=> use terminal type
puts " Hello #{name}, nice to meet you!"
# NOTE: it returns th name entered, but on a new line
# Hello {name}
# ,nice to meet you!

# chop method to remove the carriage return charaters at the end
name = gets.chop
puts "Hello #{name}, nice to meet you"
# Hello {name}, nice to meet you
# Note: we have it all on the same line
#

# Variable Scope
#
# variables scope determines where in the program a veriable i available
# for use. the scope is defined by where the variable is initilailed.
#
# Variable scope is defined by a block using {} or do/end
#
#   Note: not all do end pairs imply a block
#
# inner scopes can access variables initialzed in ann outer scope,
# but now vice versa

m = 5 # variable is initialzied in the outer scope

3.times do |_n| # method invocation with a block
  m = 3 # is a accessible here, in an inner scope?
end

puts m #=> 3 changed when we accessed in the inner scope

# inner scope example
nt = 2
3.times do |_n| # method invocation with a block
  nt = 8
  e = 3 # is intialized in the inner scope
end

puts nt
# puts e will give us an error, the outer scope does not recongize the variable

#
# Note: Distinguishing factor for deciding whether code is limited by {} or do/end
#   (creates a new scope for vaible) immediately follow a method invocaton
#

arr = [1, 2, 3]

arr.each do |_i|
  a = 5      # a is initialized here
end

puts a       # =>5
#
# The for...do/end code did not create a new inner scope, because
# its part of ruby and not a method invocation

# types Variables
#
# There are five types of varibles
# Constansts,global variables,class variables, instance varible, and local variable.

# Constant
#
# constant are delcared using capitilization, it stores data that never needs to change
# constants cannot be declared in method definitions, and are available throughout
# application scopes
MY_CONSTANT = 'This is my constant throughout app'

# Global Variable
#
# global variable names are delacred with a dollar sign infront if it
# try to stay away from global variables  may cause unexpeted errors
$var = 'I am also available throughout your app.'

# Class Variables
#
# class variables are declared by starting the variable name with two @ signs.
# accessible by the instance of the class, and class itself.
#
# When a varible is declared a variable that is related to a class,but each
# instance of that class does not neeed its own value for this variable.
#
# Class variables must be initialized at the class level, outside of any method
# definitions. they can then be altered using class or instance method
# definitions

@@instances = 0

#
# instance methods variables are declared by starting variable with @.
#
# These variables are available throughout the current instance of the parent class.
# instance variable can cross scope boudaries,but not all of them.

@var = 'I am available throughout the current instance of this class.'

# Local variables
#
# local variable are the most commom variable you will come across and obey all scope
# boudaries. does not have a $ nor @ nor is it capitialized
#

var = 'I must be passed around to cross scope boundaries.'

# examples

age = gets
# gets age keeps on the same line and with chop and converts to integer
puts "im #{age}".chop.to_i

# gets name
name = gets
# method prints name 10 times
10.times do |_n|
  puts name.to_s
end

# user enters both fist and last name we get rid of the carriage retrun values
user_first_name = gets.chop
user_last_name = gets.chop
# concat both firstname and lastname
user_fullname = "#{user_first_name} #{user_last_name}"

puts user_fullname # print => inputs

# things on the right go first

number = 2 + 3 * 4
puts number #=> 14 not 20(which would left to right)
