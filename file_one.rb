# ruby-doc.org ruby docs
#basic data types

#Numbers
#add
1 + 1

#subtract
5 - 3
#Multiply
5  * 3
#Divde
5 / 3
#Exponet
5 ** 3

#modules
8 % 6

#Integers and Floats two main types of number in ruby
#interger is a whole number 1
#float is a decimal point number 1.2
#Note ruby always results in an integer when doing arithmetic with two numbers
17 / 5 #3, not 3.5
#to obtain accurate answer one number must already be a float
17/5.0 #3.4


#Difference between modulo Vs Remainder 

#remainder
puts 16.remainder(5) #=> 1

#divmod computes both the integer results of  the division snd its modulo value
puts 16.divmod(5) #=> [3,1]

=begin 
Modulo opertation return a positive interger when the 
second operand is positive, and a negative integer when the second
operand is negetive.

Remainder operation returns a positive integer when the first operand 
is positive, and a negative integer when the first operand is negative

EX:
a= 17  
b= 5
a%b=2   a.remainder(b)=2   a.divmod(b)=[3/2]

a= 17  
b= -5
a%b=-3   a.remainder(b)=2   a.divmod(b)=[-4/-3]

a= -17  
b= 5
a%b= 3   a.remainder(b)= -2   a.divmod(b)=[-4/-3]

a= -17  
b= -5
a%b= -2   a.remainder(b)= -2   a.divmod(b)=[3/-2]

**try working with positive integers, when trying to get th remainder

=end

#converting number types 

#converts integer to float
13.to_f # 13.0
#convert float to an interger
13.0.to_i #13 no rounding just cut off

#useful number method
#Even
puts 6.even? #=> true 
puts 7.even? #=> false 

#Odd
puts 6.odd? #=> false 
puts 7.odd? #=> true

#String ...Use They well
#String Concatenation remeber the space!
#w/ +
puts "Hey " + "there " + "stranger"
#w/ <<
puts "Hey " << "there " << "stranger"


#w/ contact method
'Welcome'.concat('to').concat('Ruby')

#Arrays 
puts [1,2,3,6,4]
#zero base index
puts [1,2,3,6,4][1] #=>2


#stringsub setmethod
puts 'hello'[0] #=>'h'
puts 'hello'[0..1] #=>'he'
puts 'hello'[0,4] #=>'hell'
puts 'hello'[-1] #=>'0'

#Escape characters allow us to type in respresentation of whitespce
#and to include quotation marks inside your string accidentally ending it
#Note: escape characters only work inside double quotation marks
#\\  #=> Need a backslash in your string?
#\b  #=> Backspace
#\r  #=> Carriage return, for those of you that love typewriters
#\n  #=> Newline. You'll likely use this one the most.
#\s  #=> Space
#\t  #=> Tab
#\"  #=> Double quotation mark
#\'  #=> Single quotation mark

puts "Hello, Welcome to 'ruby' " #=> using single and double
puts 'Hello, Welcome to \ruby\'' #=> using single quatation marks

#interpolation
#String interpolation allows you to evalueate a string that contains 
#a placeholder
name = "Mac"
puts "Whats Good, #{name}" #=> "Whats Good, Mac"

#common string methods
#Ruby Docs string methods https://ruby-doc.org/core-2.7.1/String.html

#capitalize
puts "hello".capitalize #=> "Hello"

#includes? 
puts "hello".include?("lo") #=> true
puts "hello".include?("Q") #=> false

#uppercase
puts "hello".upcase #=> "HELLO"

#downcase
puts "HELLO".downcase #=> "hello"

#empty
puts"hello".empty? #=>false
"".empty? #=>true

#length
puts "hello".length # =>5

#reverse
puts "hello".reverse # "olleh"

#split
"hello world".split # ["hello","world"]
puts "hello".split("") #["h","e","l","l","o"]

#strip
puts "hello, world   ".strip  #"hello, world"

#Other useful methods
puts "ha77y".sub("7","p") #=>"hap7y"
puts "ha77y".gsub("7","p") #=>"happy"
puts "happy".insert(-1," Day") #=>"happy Day"
puts "!".prepend("happy"," Day") #=>"happy Day!"


#converting other object to strings
5.to_s  #=> "5"
nil.to_s  #=> "nil"
:symbol.to_s  #=> "symbol"

#mutli line comment

=begin  
So string can be changed, so eveytime a string is used 
ruby has to store it in memory even if value exists.

Symbols are strings 
Symbols  are store in memory only once, making them fater in certain 
situations

one common application where symbols are preferred over strings are the 
keys in hashes
=end
puts "string" == "string" #true

puts "string".object_id == "string".object_id #=> false

puts :symbol.object_id == :symbol.object_id #=> true

#examples of a symbol
:name
:a_symbol
:"This is also a symbol"



#Booleans more detail in conditional logic
=begin 
True and false 

The boolean values true andd false represent what they do!

  nil represents "nothing".
  Note: Everything in ruby have to return something
=end
puts nil #=>"nothing"
puts nothing = nil #=> "nothing"
puts "hello, wolrd".nil? #=> false

#when used in an if statement, treated as false, absence of content
if nil
  puts "hello, World" #=> nothing
end
#1 is not "nothing" and not false so it prints
if 1
  puts "hello, World" #=>"hello, world"
end

#Hashes is a set os key-value pair { }
=begin
hashes usually have a key assigned with a specific value
the key usually represented by symbol that points to a value
with(=>) of any type of data


we use key set to retrive our values
=end

myHash={
    "Key" => "value",
    "Key2" => "value2"
}

puts myHash["Key"] # puts value

#creating hashes
myHash=Hash.new()
myHash["Key"]="value"
myHash["Key2"]="value2"

#instead of using a string as key can use symbol
myHash=Hash.new()
myHash[:Key]="value"
myHash[:Key2]="value2"

puts myHash[:Key] # puts "value"

myFirstHash={
    "Dog" => "Dave"
    }
puts myFirstHash["Dog"]

pets = {:dog => 'bark', :cat => 'cat', :pig =>'oink'}[:pig]
puts pets

#Expressions and Retruns 
=begin
Expression is anything that can be evaluated ruby expression 
always return something
=end

#puts vs return 
=begin 
Puts tells ruby to print soething to the screen, but it does not return
aything thing. Expressions do soemthing, and also return something.
=end

puts "stuff"

a = puts "something else"

puts a

#Objects in Ruby

=begin 
An object is a location in a computer memory where you can store DATA
(aka values) that could be string, number, array, hash, time.....

the differernt kinda of objects are classes or types

Everytime an object recieves a message, it reuturns a response
Or value or returned value
=end

#Messages and operators
# and object responds to messages, send it messages using operators
# most powerful is the .

#EX:  "apple".upcase