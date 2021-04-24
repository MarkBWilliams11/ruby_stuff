#conditional statements return boolean values

#if statment
=begin 
conditional statements are used to add branching logic
to programs, they allow us to include complex behavior
that only occur under specific conditions

with comparison we  return boolean values  true or false
the expression or values that an operator uses are operands.

operand1 == operand2
Note: ruby does not consider 0 or "" as false values
      we need to use "nil" or "false"

if statement is an expression that can check for truths
an will execute code if ture

syntax:

if condition == ture
  do  something
end   

=end
if 1 < 2
  puts "1 is less than 2!" 
end  
#or one liner works
puts " 1 is less than 2" if 1 < 2


#else
=begin
combinding if with the keyword else. the if  statement
exectues one block of code if the condition is true 
and a different block if it is false

if condition == true
  do something
else
  something if evaluates to false
end   
=end

hp=75
if hp == 100
  puts "100 hp"
else
  puts "Something lower than 100hp"
end  


=begin
the elseblock will only execute if the if block doesn't
run, so they both will never be executed.
=end

#elsif 
=begin
When you want more than two options, use the elseif
to do more condditional checks

  if condition == true
  something to be done
elsif different condition == true
  something else to be done
else
  another different thing to be done
end
*only one will run if satsfied
=end

if hp ==100
  puts "100 hp"
elsif hp >= 51
  puts "greater than 50hp"
else 
  puts"hp less than 50"
end    



#examples:
booleanOne = true
randomCode = "Hi!"
if booleanOne
  puts "I will be printed!"
elsif randomCode.length>=1
  puts "Even though the above code is true, I won't be executed because the earlier if statement was true!"
else
  puts "I won't be printed because the if statement was executed!"
end

language = "English"
if language === "English"
  puts "Hello!"
elsif language === "Spanish"
  puts "Hola!"
else
  puts "I don't know that language!"
end


#unless
#unless structred similar to if statement execpt if 
#will execute if the condition if false
=begin 
unless condition == false
  #Something done if condition if false
end 
=end 

num = 20
unless num < 17
  puts "greater than 17" #=> greather than 17
end

#can also add else cause here too
num2 = 5
unless num2 < 17
  puts "greater than 17"
else
  puts "less than 17" #=> less than 17
end
=begin
basically the reverse of the if statement.the else
keyword can also be used inside unless statement
=end


#Make sure to understand logic behind the expression being evaluated
#to step through it if need be

=begin 
Ruby only considers nil or false, or true, the string "false"
would be considered true in ruby

Note: ruby does not consider 0 or "" as false values
=end


#boolean logic 
=begin 
to determine whether an expression evqalute to true or false
we'll need a comparision operator
=end
p "Booleans logic"
# == (equals) returns true if values compared are exact
p 5 == 5 #=>true 
p 5 == "5" #=> false

# != (not eaqual) returns true if the values compared are not eqaul
p 5 != 5 #=>false
p 5 != 6 #=> true

# > return true when value on left is greater than right
p 9 > 5 #=>true
p 5 > 6 #=> false

# < return true when value on left is less than right
p 5 < 20 #=>true
p 5 < 1#=> false

# >= return true if value on left is greater or equal to right value
p 5 >= 20 #=>false
p 5 >= 3#=> true

# <= return true if value on left is less than or equal to right value
p 5 <= 20 #=>true
p 5 <= 3#=> false

#eql? check both value type and the value it holds
p 5.eql?(5.0) #=> false
p 5.eql?(5) #=> true


#equal?
=begin 
checks wether both values are the exact same object in memory.
compare two variables for example
=end

c=6
d=9
p c.equal?(d) #=> false
r=6
p c.equal?(r) #=> true

=begin 
Note: computer can't store strings in the same efficent way as numbers 
cant create two seperate string objects in memory
=end
a="hello"
b="hello"
p a.equal?(b) #=> false

# <=> returns one of three three numerical values
=begin 
-1 if the value on the left is less than the value on the right
0 if the value on the left is equal to the value on the right.
1 if the value on the left is greater than the value on the right
=end

p 5<=>20 #=> -1
p 5<=>5 #=> 0
p 5<=>3 #=> 1
#Note: most commonly use when sorting functions

#Logical Operators
=begin 
Expression the contain more than one condition
&& and
|| or
! not
#Note: when using && || ,expressions are evaluated from left to right
=end

# &&  and
=begin 
and returns true if BOTH left and right expression are true. 
if the first expression encountered returns false, then the second
  expression in never checked.
=end
if 1 < 2 && 5 < 6
  puts "yes 1 is less than 2 and five is less than 6"
end
#we can just type and it will still work
if 1 < 2 and 5< 6
  puts " This also works"
end  
#Note: when using && || ,expressions are evaluated from left to right

#|| or
=begin
if or evaluates the first expression if true, then second is never checked 
and will run never block of code.
 if or evaluates to false value, it will check second value

=end

if 10 < 2 || 5 < 6 #=> first is false, but second is true
  puts "we are learning"
end
#we can also type or 
if 20 > 5 or 5 < 1
  puts "This also works"
end
#This is known as a short circuit evaluation

# !
=begin 
reverses the logic. therefore, if the expression itself 
returns fasle, using ! will make it true and he code inside 
block will execute
=end


# if !false #=> true 
# if !(10<5) #=> true 

#case statements
=begin 
processes each condition inturn, and if the condition return false,
it will move onto the next one until a match is found. an else clause 
can be provided tp serve as a default if match not found
=end
grade = 'A'

#=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
did_i_pass = case grade 
  when 'A' then puts "Hell yeah!"
  when 'D' then p "Don't tell your mother."
  else p "McDonald's is hiring!"
end

grade = "a"
case grade
when  "a"
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when  "b"
    puts "Better luck next time"
  can_i_retire_soon = false
  else 
    puts "McDonald's is hiring"
    fml=true
  end


  #Ternary Operator 
=begin 
ternary is a one line if else staement 

syntax: conditional statement ? <execute if ture> : <execute if false>
=end

truthy = true ? "This is true" : "This is false" # =>"This is true"
falsey= false ? "This is true" : "This is false" #=> "This is false"
puts truthy
puts falsey

age = 18
response = age < 17 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."

=begin 
ruby has an order of precedence when deciding how to evaluate
mutiple expressions. from highet prendence to lowes here starting with 1
1. <=, <, >, >= - Comparison
2. ==, != - Equality
3. && - Logical AND
4. || - Logical OR

ex:
if x && y || z
  #do soemthing
end  

First the x&& y statment will be executed. and if true would continue.
if not then the z would be evaluated
=end

 p (32 * 4) >= 129 
 p false != !true
 p true == 4
 p false == (847 == "874")
 p (!true ||(!(100/5) == 20) || ((328/4) == 82)) || false

 