#Exception Handling
=begin 
The process that deals with errors in a managabnle and predictble way
ruby havve exception classes to handle erros easier. using the reserved 
words begin, rescue, and end to signify exception handling
=end
# exception_example.rb

begin
  # perform some dangerous operation
rescue
  # do this if operation fails
  # for example, log the error
end

#We do this for unpredicitable outcomes wew need errors to let us know
#examnple see what happens when nil is returned


names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!" #=> if we result in errors
  end
end

#Another example wthis time in-inline 

zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "Can't do that!" #=> not possible to call each method on integer value zero
puts "After each call" 